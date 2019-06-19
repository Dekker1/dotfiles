export BUILDDIR=$HOME/build

function cppconfigure() {
    build_dir=${BUILDDIR}/pkg/${PWD##*/}
    wd=$PWD
    mkdir -p $build_dir
    pushd $build_dir
    echo " > ccmake ${wd} -G\"Ninja\" -DCMAKE_BUILD_TYPE=\"Release\" -DCMAKE_INSTALL_PREFIX=\"$BUILDDIR\" $@"
    ccmake ${wd} -G"Ninja" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="$BUILDDIR" $@
    popd
}

function cppbuild() {
    build_dir=${BUILDDIR}/pkg/${PWD##*/}
    echo " > cmake --build $build_dir $@"
    cmake --build $build_dir $@
}

function cppremove() {
    build_dir=${BUILDDIR}/pkg/${PWD##*/}
    echo " > rm -rf ${build_dir}/*"
    rm -rf ${build_dir}/*
}

function cppclean() {
    cppbuild $@ --target clean
}


function cppinstall() {
    cppbuild $@ --target install
}
