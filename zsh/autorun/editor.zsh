#!/usr/bin/env zsh

# Neovim
alias vi="nvim"
alias ni="nvim"
alias vim="nvim"

# Emacs
export EDITOR="emacsclient -nw"
alias edit="emacsclient -nw"
[ -d "$HOME/.emacs.d/bin" ] && export PATH=$PATH:"$HOME/.emacs.d/bin"
