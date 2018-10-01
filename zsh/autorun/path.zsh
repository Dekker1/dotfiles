function add-to-path() {
  if [ -z "$1" ]; then
    dir=`pwd`
  else
    dir=$1
  fi
  export PATH=$dir:$PATH
  echo "(☞ﾟヮﾟ)☞ Added $dir to the PATH"
}
