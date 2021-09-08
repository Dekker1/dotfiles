#!/usr/bin/env zsh

# Neovim
if command -v nvim &> /dev/null; then
	alias vi="nvim"
	alias ni="nvim"
	alias vim="nvim"
	export EDITOR="nvim"
else
	export EDITOR="vi"
fi

alias edit="${EDITOR}"
