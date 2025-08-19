#!/usr/bin/env bash
set -euo pipefail

# NOTE: this script should be idempotent!

# check brew is installed (don't install incase installation
# has changed, just link the place to find it)
if ! command -v brew >/dev/null 2>&1; then
  echo "please install brew https://brew.sh/"
  exit 1
fi

# install chezmoi if not already installed
if ! command -v chezmoi >/dev/null 2>&1; then
  brew install chezmoi
fi

# setup chezmoi and apply all the settings
chezmoi init https://github.com/calumpwebb/dotfiles.git
chezmoi apply

# finish
echo "Bootstrap complete!"
