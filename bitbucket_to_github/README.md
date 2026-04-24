# Bitbucket to GitHub Migration Tools

This directory contains scripts to migrate repositories from Bitbucket to GitHub, with support for archival cloning and repository listing.

## Overview

- **`list_bitbucket_repos.sh`** - Lists all repositories in a Bitbucket workspace
- **`list_github_repos.sh`** - Lists all repositories in a GitHub organization
- **`MIGRATOR.sh`** - Migrates repositories from Bitbucket to GitHub while preserving history and metadata
- **`archival-clones/clone_repos.sh`** - Locally clones repositories for archival purposes

## Prerequisites

Ensure you have the following installed and configured:

- **git** - For cloning and mirroring repositories
- **curl** - For API requests
- **jq** - For JSON parsing
- **GitHub CLI (`gh`)** - For GitHub repository management
- **SSH keys** - Configured for both Bitbucket and GitHub access

## Setup & Configuration

### Bitbucket Credentials

1. Generate an App Password on Bitbucket:
   - Go to Bitbucket Settings → Personal Bitbucket settings → App passwords
   - Create a new app password with **Repositories: Read** permissions
   - Note your workspace name (e.g., `isme_robotics`)

2. Set environment variables before running scripts:
   ```bash
   export BB_MAIL="your-email@example.com"
   export BB_API_TOKEN="your-bitbucket-app-password"
   ```

### GitHub Credentials

1. Create a GitHub Personal Access Token:
   - Go to GitHub Settings → Developer settings → Personal access tokens
   - Create a token with `repo` and `admin:org_hook` scopes
   - Note your GitHub organization name (e.g., `GRAAL-Lab`)

2. Authenticate with GitHub CLI:
   ```bash
   gh auth login
   # Follow prompts and use your personal access token
   ```

### SSH Key Setup

Ensure your SSH keys are properly configured:
```bash
# For Bitbucket
ssh -T git@bitbucket.org

# For GitHub
ssh -T git@github.com
```

Both should return successful authentication messages.

## Usage

### Step 1: List Repositories

#### List Bitbucket Repositories
```bash
./list_bitbucket_repos.sh
```

This outputs repositories in the format `PROJECT/repo-name`. Redirect to a file if needed:
```bash
./list_bitbucket_repos.sh > all_repos.txt
```

#### List GitHub Repositories
```bash
./list_github_repos.sh
```

### Step 2: Prepare Migration List

Create a `repos.txt` file (or any name) with repositories to migrate. Format:
```
PROJECT/repo-name
PROJECT/another-repo
DIFFERENT_PROJECT/third-repo

# Comments are ignored
# Empty lines are ignored
```

**Example:**
```bash
./list_bitbucket_repos.sh > repos.txt
# Edit repos.txt to keep only repos you want to migrate
```

### Step 3: Run Migration

```bash
export BB_MAIL="your-email@example.com"
export BB_API_TOKEN="your-bitbucket-app-password"

./MIGRATOR.sh repos.txt
```

The migration process:
1. Fetches repository metadata from Bitbucket API
2. Creates corresponding repositories on GitHub with matching visibility (public/private)
3. Performs a git mirror clone to preserve all history and branches
4. Pushes to GitHub
5. Sets description and project topic on GitHub
6. Logs failures to `migration-failures.log`

**Output during migration:**
- Progress messages for each repository
- Migration status (created, migrated, or failed)
- Failure details in `migration-failures.log`

### Step 4: Verify Migration

Compare repository lists:
```bash
./list_github_repos.sh > migrated_repos.txt
diff repos.txt migrated_repos.txt
```

### Archival Cloning

To create local clones for archival/backup:

```bash
./archival-clones/clone_repos.sh repos.txt ./my-archive
```

This clones all repositories locally into a directory structure organized by project.

## Output Files

- **`migration-work/`** - Temporary directory for mirror clones (automatically cleaned up after successful migration)
- **`migration-failures.log`** - Log of failed migrations with reasons (CLONE_FAILED, PUSH_FAILED)
- **`archival-clones/cloned-repos/`** - Local repository clones (default when using archival script)

## Troubleshooting

### Authentication Errors

**Bitbucket:**
```
curl: (22) The requested URL returned error: 401
```
- Verify `BB_MAIL` and `BB_API_TOKEN` environment variables are set correctly
- Check that the app password is still active in Bitbucket

**GitHub:**
```
Error: NotAuthenticated
```
- Run `gh auth login` to re-authenticate
- Verify token has proper scopes

### SSH Key Issues

```
git@bitbucket.org: Permission denied (publickey)
```
- Add your SSH key to Bitbucket: Settings → SSH keys
- Test with: `ssh -T git@bitbucket.org`

### Repository Already Exists on GitHub

- The script will skip creation and proceed with migration
- If you need to reset, delete the GitHub repository and re-run

### Failed Migrations

Check `migration-failures.log`:
- **CLONE_FAILED** - Could not clone from Bitbucket (check SSH access, repo exists)
- **PUSH_FAILED** - Could not push to GitHub (check token permissions, network)

### Rate Limiting

If you experience API rate limits:
- GitHub: 5,000 requests/hour with authentication
- Bitbucket: 1,000 requests/hour

Wait before retrying failed repositories.

## Security Notes

⚠️ **Important:** Never commit credentials to version control.

- `.gitignore` is configured to ignore working directories
- Do NOT hardcode API tokens in scripts (use environment variables)
- Rotate tokens after migration
- Consider using a service account for production migrations

## Example Workflow

```bash
# 1. Setup environment
export BB_MAIL="user@example.com"
export BB_API_TOKEN="ATATT3x..."
gh auth login

# 2. Get all repos
./list_bitbucket_repos.sh > repos.txt

# 3. Review and filter (optional)
# Edit repos.txt to select which repos to migrate
vim repos.txt

# 4. Run migration
./MIGRATOR.sh repos.txt

# 5. Check for failures
cat migration-failures.log

# 6. Verify GitHub
./list_github_repos.sh
```

## Notes

- Repository visibility (public/private) is preserved from Bitbucket
- All git history, branches, and tags are migrated
- GitHub repository descriptions are set from Bitbucket
- Project names become GitHub topics (lowercase)
- Temporary mirror clones are cleaned up after successful migration
