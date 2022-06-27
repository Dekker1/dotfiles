#> Homebrew integration
source-bash $(brew shellenv)
#> Kitty integration
xontrib load kitty
#> Starship: smart prompt
execx($(starship init xonsh))
#> Zoxide: smart cd
execx($(zoxide init xonsh), 'exec', __xonsh__.ctx, filename='zoxide')