# Nushell Config File

let $config = ($config | upsert rm_always_trash true)
let $config = ($config | upsert edit_mode vi)
let $config = ($config | upsert max_history_size 100000)
let $config = ($config | upsert footer_mode auto)

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

module completions {
  # Custom completions for external commands (those outside of Nushell)
  # Each completions has two parts: the form of the external command, including its flags and parameters
  # and a helper command that knows how to complete values for those flags and parameters
  #
  # This is a simplified version of completions for git branches and git remotes
  def "nu-complete git branches" [] {
    ^git branch | lines | each { |line| $line | str find-replace '\* ' '' | str trim }
  }

  def "nu-complete git remotes" [] {
    ^git remote | lines | each { |line| $line | str trim }
  }

  export extern "git checkout" [
    branch?: string@"nu-complete git branches" # name of the branch to checkout
    -b: string                                 # create and checkout a new branch
    -B: string                                 # create/reset and checkout a branch
    -l                                         # create reflog for new branch
    --guess                                    # second guess 'git checkout <no-such-branch>' (default)
    --overlay                                  # use overlay mode (default)
    --quiet(-q)                                # suppress progress reporting
    --recurse-submodules: string               # control recursive updating of submodules
    --progress                                 # force progress reporting
    --merge(-m)                                # perform a 3-way merge with the new branch
    --conflict: string                         # conflict style (merge or diff3)
    --detach(-d)                               # detach HEAD at named commit
    --track(-t)                                # set upstream info for new branch
    --force(-f)                                # force checkout (throw away local modifications)
    --orphan: string                           # new unparented branch
    --overwrite-ignore                         # update ignored files (default)
    --ignore-other-worktrees                   # do not check if another worktree is holding the given ref
    --ours(-2)                                 # checkout our version for unmerged files
    --theirs(-3)                               # checkout their version for unmerged files
    --patch(-p)                                # select hunks interactively
    --ignore-skip-worktree-bits                # do not limit pathspecs to sparse entries only
    --pathspec-from-file: string               # read pathspec from file
  ]

  export extern "git push" [
    remote?: string@"nu-complete git remotes", # the name of the remote
    refspec?: string@"nu-complete git branches"# the branch / refspec
    --verbose(-v)                              # be more verbose
    --quiet(-q)                                # be more quiet
    --repo: string                             # repository
    --all                                      # push all refs
    --mirror                                   # mirror all refs
    --delete(-d)                               # delete refs
    --tags                                     # push tags (can't be used with --all or --mirror)
    --dry-run(-n)                              # dry run
    --porcelain                                # machine-readable output
    --force(-f)                                # force updates
    --force-with-lease: string                 # require old value of ref to be at this value
    --recurse-submodules: string               # control recursive pushing of submodules
    --thin                                     # use thin pack
    --receive-pack: string                     # receive pack program
    --exec: string                             # receive pack program
    --set-upstream(-u)                         # set upstream for git pull/status
    --progress                                 # force progress reporting
    --prune                                    # prune locally removed refs
    --no-verify                                # bypass pre-push hook
    --follow-tags                              # push missing but relevant tags
    --signed: string                           # GPG sign the push
    --atomic                                   # request atomic transaction on remote side
    --push-option(-o): string                  # option to transmit
    --ipv4(-4)                                 # use IPv4 addresses only
    --ipv6(-6)                                 # use IPv6 addresses only
  ]
}

# Get just the extern definitions without the custom completion commands
use completions *

### Manage PATH
# From MacOS helper (/usr/libexec/path_helper)
let-env PATH = ($env.PATH | append "/Library/TeX/texbin")
let-env PATH = ($env.PATH | append "/Library/Apple/usr/bin")
let-env PATH = ($env.PATH | append "/opt/homebrew/bin")
let-env PATH = ($env.PATH | append "/opt/homebrew/sbin")
# Optional Homebrew packages
let-env PATH = ($env.PATH | prepend $'(brew --prefix | str trim)/opt/bison/bin')
let-env PATH = ($env.PATH | prepend $'(brew --prefix | str trim)/opt/flex/bin')
let-env PATH = ($env.PATH | prepend $'(brew --prefix | str trim)/opt/llvm/bin')
let-env PATH = ($env.PATH | prepend $'(brew --prefix | str trim)/opt/openjdk/bin')
# Other package managers
let-env PATH = ($env.PATH | prepend "~/.local/bin")
let-env PATH = ($env.PATH | prepend "~/.cargo/bin")

### Setup aliases
alias edit = ^($env.EDITOR)
alias set-light-theme = kitty +kitten themes Rosé Pine Dawn
alias set-dark-theme = kitty +kitten themes Rosé Pine Moon
alias brew-backup = brew bundle dump --global --no-lock --cask --mas --tap --force
alias brew-cleanup = brew bundle cleanup --global --no-lock --force --zap
alias brew-restore = brew bundle install --global --no-lock
alias packer-sync = nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"

### Environment
# Set default editor
let-env EDITOR = "nvim"
# Alias for Monash compute cluster
let-env BIGBAD = "compute.optimisation-2020.cloud.edu.au"
# CMake settings
let-env CMAKE_EXPORT_COMPILE_COMMANDS = "1" # output compile-commands.json for clangd
let-env CMAKE_GENERATOR = "Ninja Multi-Config" # use Ninja generator by default
# Default find command for FZF
let-env FZF_DEFAULT_COMMAND = "fd --type f"
# Homebrew shell setup (brew shellenv)
let-env HOMEBREW_PREFIX = "/opt/homebrew"
let-env HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
let-env HOMEBREW_REPOSITORY = "/opt/homebrew"
let-env HOMEBREW_SHELLENV_PREFIX = "/opt/homebrew"
let-env INFOPATH = "/opt/homebrew/share/info"
# Set MANPATH
let-env MANPATH = "/usr/share/man:/usr/local/share/man:/Library/TeX/Distributions/.DefaultTeX/Contents/Man:/opt/homebrew/share/man"

# Load autojump plugin "zoxide"
# source ~/.cache/zoxide/zoxide.nu

# Load standardised prompt "starship"
# TEMP: Custom vi prompt indicators
let-env PROMPT_INDICATOR_VI_INSERT = "✏️ "
let-env PROMPT_INDICATOR_VI_NORMAL = "🔙 "
source ~/.cache/starship/init.nu
