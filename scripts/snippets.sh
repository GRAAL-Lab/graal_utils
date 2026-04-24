# GIT: Pull all repos in subfolders
find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;
