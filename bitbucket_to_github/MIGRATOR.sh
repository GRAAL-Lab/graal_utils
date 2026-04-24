#!/usr/bin/env bash
set -euo pipefail

: "${BB_MAIL:?Set BB_MAIL}"
: "${BB_API_TOKEN:?Set BB_API_TOKEN}"

bb_workspace="isme_robotics"
gh_org="GRAAL-Lab"
workdir="${PWD}/migration-work"
repos_file="${1:-repos.txt}"
fail_log="${PWD}/migration-failures.log"

mkdir -p "$workdir"
: > "$fail_log"

while IFS= read -r line; do
  [[ -z "$line" ]] && continue
  [[ "$line" =~ ^# ]] && continue

  project="${line%%/*}"
  repo="${line#*/}"
  topic="$(printf '%s' "$project" | tr '[:upper:]' '[:lower:]')"

  echo "=== ${project}/${repo} ==="

  bb_api="https://api.bitbucket.org/2.0/repositories/${bb_workspace}/${repo}"
  repo_json="$(curl -fsS -u "$BB_MAIL:$BB_API_TOKEN" "$bb_api")"

  description="$(printf '%s' "$repo_json" | jq -r '.description // empty' | tr '\n' ' ')"
  is_private="$(printf '%s' "$repo_json" | jq -r '.is_private')"

  if [[ "$is_private" == "true" ]]; then
    visibility="private"
  else
    visibility="public"
  fi

  if gh repo view "${gh_org}/${repo}" >/dev/null 2>&1; then
    echo "GitHub repo exists: ${gh_org}/${repo}"
  else
    gh repo create "${gh_org}/${repo}" "--${visibility}" >/dev/null
    echo "Created GitHub repo: ${gh_org}/${repo}"
  fi

  mirror_dir="${workdir}/${repo}.git"
  rm -rf "$mirror_dir"

  bb_url="git@bitbucket.org:${bb_workspace}/${repo}.git"
  gh_url="git@github.com:${gh_org}/${repo}.git"

  if ! git clone --mirror "$bb_url" "$mirror_dir"; then
    echo "${project}/${repo} CLONE_FAILED" >> "$fail_log"
    continue
  fi

  git -C "$mirror_dir" remote remove github 2>/dev/null || true
  git -C "$mirror_dir" remote add github "$gh_url"

  if ! git -C "$mirror_dir" push --mirror github; then
    echo "${project}/${repo} PUSH_FAILED" >> "$fail_log"
    rm -rf "$mirror_dir"
    continue
  fi

  gh repo edit "${gh_org}/${repo}" \
    --description "$description" \
    --add-topic "$topic" >/dev/null || true

  echo "Migrated ${project}/${repo}"
  rm -rf "$mirror_dir"
done < "$repos_file"

echo "Done. If any errors are present, look ${fail_log}."
