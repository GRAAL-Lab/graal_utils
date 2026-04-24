#!/usr/bin/env bash
set -euo pipefail

org="GRAAL-Lab"
token="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"   # optional but recommended

page=1

while :; do
    response=$(curl -fsS \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $token" \
        "https://api.github.com/orgs/$org/repos?per_page=100&page=$page")

    count=$(echo "$response" | jq 'length')

    [ "$count" -eq 0 ] && break

    echo "$response" | jq -r '.[] | .name'

    ((page++))
done | sort -u
