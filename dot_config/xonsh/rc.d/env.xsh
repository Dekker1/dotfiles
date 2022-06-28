# --- Detect Environment ---

try:
    import warnings
    with warnings.catch_warnings():
        warnings.simplefilter("ignore")
        import darkdetect

    dark_mode = darkdetect.isDark()
except ImportError:
    dark_mode = False

brew_prefix = $(brew --prefix).strip()

# --- Xonsh Configuration ---

$XONSH_COLOR_STYLE = "stata-dark" if dark_mode else "stata-light"

# --- Path Variables ---
#> Use MacOS path_helper executable
source-bash $(/usr/libexec/path_helper -s)

$PATH = [
    brew_prefix + "/opt/bison/bin",
    brew_prefix + "/opt/flex/bin",
    brew_prefix + "/opt/llvm/bin",
] + $PATH + [
    $HOME + "/.local/bin",
    $HOME + "/.cargo/bin",
]

# --- General Environment ---
#> Default Editor
$EDITOR = "nvim"
$VISUAL = "subl"
#> Monash Cluster
$OPTCLUSTER = "compute.optimisation-2020.cloud.edu.au"
#> CMake settings
$CMAKE_EXPORT_COMPILE_COMMANDS = "1" # output compile-commands.json for clangd
$CMAKE_GENERATOR = "Sublime Text 2 - Ninja" # use Ninja generator by default
#> FZF
$FZF_DEFAULT_COMMAND = "fd --type f"

# --- Aliases ---
aliases["brew-backup"] = ("brew", "bundle", "dump", "--global", "--no-lock", "--cask", "--mas", "--tap", "--force")
aliases["brew-cleanup"] = ("brew", "bundle", "cleanup", "--global", "--no-lock", "--force", "--zap")
aliases["brew-restore"] = ("brew", "bundle", "install", "--global", "--no-lock")
aliases["edit"] = $VISUAL
aliases["less"] = "bat"
aliases["ls"] = "exa"
aliases["set-dark-theme"] = ("kitty", "+kitten", "themes", "Mariana")
aliases["set-light-theme"] = ("kitty", "+kitten", "themes", "Breakers")
aliases["ssh"] = ("kitty", "+kitten", "ssh")
aliases["start"] = "open"
