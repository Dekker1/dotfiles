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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi

# z (autojump)
if command -v pazi &>/dev/null; then
  eval "$(pazi init zsh)"
  alias zf='z --pipe="fzf"'
fi
