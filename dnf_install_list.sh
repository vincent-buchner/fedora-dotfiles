#!/bin/bash

packages=(
	# =============== QUALITY OF LIFE ===============
	kitty
	fish
	stow
	gh
	gitleaks
	fzf
	zoxide
	tmux
	htop
	neovim
	tldr
	ripgrep

	# =============== LANGUAGE SPECIFIC ===============
	python3
	nodejs
	golang
	rust
	cargo
)

sudo dnf install "${packages[@]}"
