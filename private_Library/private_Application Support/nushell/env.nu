# Nushell Environment Config File

# Load standardised prompt "starship"
# TEMP: Custom vi prompt indicators
let-env PROMPT_INDICATOR_VI_INSERT = "✏️ "
let-env PROMPT_INDICATOR_VI_NORMAL = "🔙 "
source ~/.cache/starship/init.nu

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

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# From MacOS helper (/usr/libexec/path_helper)
let-env PATH = ($env.PATH | append "/Library/TeX/texbin")
let-env PATH = ($env.PATH | append "/Library/Apple/usr/bin")
let-env PATH = ($env.PATH | append "/opt/homebrew/bin")
let-env PATH = ($env.PATH | append "/opt/homebrew/sbin")
let-env PATH = ($env.PATH | append "/usr/local/bin")
# Optional Homebrew packages
let-env PATH = ($env.PATH | prepend $'(brew --prefix | str trim)/opt/bison/bin')
let-env PATH = ($env.PATH | prepend $'(brew --prefix | str trim)/opt/flex/bin')
let-env PATH = ($env.PATH | prepend $'(brew --prefix | str trim)/opt/llvm/bin')
let-env PATH = ($env.PATH | prepend $'(brew --prefix | str trim)/opt/openjdk/bin')
# Other package managers
let-env PATH = ($env.PATH | prepend "~/.local/bin")
let-env PATH = ($env.PATH | prepend "~/.cargo/bin")

# --- user custom ---
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
let-env INFOPATH = "/opt/homebrew/share/info"
# Set MANPATH
let-env MANPATH = "/usr/share/man:/usr/local/share/man:/Library/TeX/Distributions/.DefaultTeX/Contents/Man:/opt/homebrew/share/man"
