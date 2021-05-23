#!/usr/bin/env zsh

# Neovim
if command -v nvim &> /dev/null; then
    alias vi="nvim"
    alias ni="nvim"
    alias vim="nvim"
fi

# Emacs
export EDITOR="emacsclient -nw"
alias edit="emacsclient -nw"
[ -d "$HOME/.emacs.d/bin" ] && export PATH=$PATH:"$HOME/.emacs.d/bin"
