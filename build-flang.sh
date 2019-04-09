#!/bin/bash -x

. setup.sh

if [[ ! -d flang ]]; then
  git clone https://github.com/flang-compiler/flang.git
fi

(cd flang/runtime/libpgmath
mkdir -p build && cd build
cmake $CMAKE_OPTIONS ..
make -j `nproc`
make install)

cd flang
mkdir -p build && cd build
cmake $CMAKE_OPTIONS ..
make -j `nproc`
make install
