source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "geometry-zsh/geometry"

zplug "~/.dotfiles/zsh/autorun/*.zsh", from:local

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

if zplug check zsh-users/zsh-history-substring-search; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

# Case insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
