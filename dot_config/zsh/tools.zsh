#!/usr/bin/env zsh

# ls
if command -v exa &> /dev/null; then
	alias ls="exa"
	alias l="exa -la"
else
	alias l="ls -lah"
fi

# cat
if command -v bat &> /dev/null; then
	alias cat="bat"
	alias less="bat"
fi

# fzf - Command line fuzzy finder
if command -v fd &> /dev/null; then
	export FZF_DEFAULT_COMMAND='fd --type f'
fi