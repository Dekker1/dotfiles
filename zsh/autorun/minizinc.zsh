function minidev() {
  # Add the compiled binaries to the path
  if [ "$1" "==" "release" ]; then
    export PATH="$MZNSOURCE/build/release:$PATH"
  else
    export PATH="$MZNSOURCE/build/debug:$PATH"
    [ "$1" "!=" "debug" ] && { echo "ʕ•ᴥ•ʔ: I assume you meant \"debug\"!"; }
  fi

  # Link included libraries
  export MZN_STDLIB_DIR=$MZNSOURCE/share/minizinc
}

function contains {
  string="$1"
  substring="$2"
  if test "${string#*$substring}" != "$string"
  then
    return 0    # $substring is in $string
  else
    return 1    # $substring is not in $string
  fi
}

function checkdev() {
  loc=`which mzn2fzn`
  contains $loc $MZNSOURCE
}
