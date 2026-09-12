#!/usr/bin/env bash
# Symlinks .config/* from this repo into ~/.config, leaving everything else
# in ~/.config (and the rest of $HOME) untouched.
set -euo pipefail
cd "$(dirname "$0")/.."
stow -d . -t "$HOME/.config" -R .config
