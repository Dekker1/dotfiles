#!/usr/bin/env zsh

### C++ ###
# CMake output compile_commands.json
export CMAKE_EXPORT_COMPILE_COMMANDS=1
# CMake use Ninja by default
export CMAKE_GENERATOR="Ninja Multi-Config"

### MiniZinc ###

if [ -d "/opt/homebrew/share/minizinc/solvers" ]; then
    export MZN_SOLVER_PATH=$MZN_SOLVER_PATH:"/opt/homebrew/share/minizinc/solvers"
fi


### Python ###
# Add pipx installed binaries to PATH
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$PATH:"$HOME/.local/bin"
fi

### Rust ###
# Add cargo installed binaries to PATH
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH=$PATH:"$HOME/.cargo/bin"
fi

