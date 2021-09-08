#!/usr/bin/env zsh

# Add packages not linked by homebrew to the PATH
PREFIX=$(brew --prefix)
if command -v brew &>/dev/null; then
    for pkg in bison flex llvm openjdk; do
        if [ -d "$PREFIX/opt/$pkg/bin" ]; then
          export PATH="$PREFIX/opt/$pkg/bin":$PATH
        fi
    done
fi
