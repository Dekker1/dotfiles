import shutil
import sys

brew_prefix = $(brew --prefix).strip()

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

def _theme(args):
    """This command takes a 
    """
    DARK_XONSH_STYLE = "stata-dark"
    DARK_KITTY_STYLE = "Mariana"
    LIGHT_XONSH_STYLE = "stata-light"
    LIGHT_KITTY_STYLE = "Breakers"
    if len(args) == 0 or args[0] == "info":
        print("dark" if $XONSH_COLOR_STYLE == DARK_XONSH_STYLE else "light")
    elif args[0] == "set":
        dark_mode = False
        if len(args) > 1:
            if args[1] == "dark":
                dark_mode = True
            elif args[1] == "light":
                dark_mode = False
            else:
                print(f"unknown theme `{args[1]}'", file=sys.stderr)
                return 1
        else:
            try:
                import warnings

                with warnings.catch_warnings():
                    warnings.simplefilter("ignore")
                    import darkdetect

                dark_mode = darkdetect.isDark()
            except ImportError:
                print("darkdetect package not found (xpip install darkdetect)", file=sys.stderr)
        $XONSH_COLOR_STYLE = DARK_XONSH_STYLE if dark_mode else LIGHT_XONSH_STYLE
        $( kitty +kitten themes @(DARK_KITTY_STYLE if dark_mode else LIGHT_KITTY_STYLE) )
    else:
        print(f"unknown argument `{args[0]}'", file=sys.stderr)
        return 1
    return 0

aliases["brew-backup"] = ("brew", "bundle", "dump", "--global", "--no-lock", "--cask", "--mas", "--tap", "--force")
aliases["brew-cleanup"] = ("brew", "bundle", "cleanup", "--global", "--no-lock", "--force", "--zap")
aliases["brew-restore"] = ("brew", "bundle", "install", "--global", "--no-lock")
aliases["edit"] = $VISUAL
aliases["ssh"] = ("kitty", "+kitten", "ssh")
aliases["theme"] = _theme
if shutil.which('bat'):
    aliases["less"] = "bat"
if shutil.which('exa'):
    aliases["ls"] = "exa"
if shutil.which('rsync'):
    aliases['cp'] = 'rsync --progress --recursive --archive'

# --- Set theme based on Dark Mode ---
_theme(["set"])
