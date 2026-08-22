#!/bin/bash
OBSIDAILYENV="$HOME/.config/obsidaily"

source "${OBSIDAILYENV}"

# Check required environment variables were set 
if [[ -z "${OBSIDIANVAULTPATH}" ]]; then
  echo >&2 "Malformed .obsidaily file. Ensure the path to your obsidian vault and daily format name are set"
  exit 1
fi

LOCKPATH="${OBSIDIANVAULTPATH}/.obsidian/.sync.lock"
if [[ -d "${LOCKPATH}" ]]; then
  echo >&2 "Last ob sync failed to release lock"
  rmdir "${LOCKPATH}"
fi
/home/mdi/.nvm/versions/node/v22.22.3/bin/node /home/mdi/.nvm/versions/node/v22.22.3/lib/node_modules/obsidian-headless/cli.js sync --path "${OBSIDIANVAULTPATH}"
