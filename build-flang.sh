#!/bin/bash -x

. setup.sh

export FLANG_BASE=${1:-`pwd`}
if [[ ! -d ${FLANG_BASE}/flang ]]; then
  git clone https://github.com/flang-compiler/flang.git ${FLANG_BASE}/flang
fi
(cd ${FLANG_BASE}/flang && git pull)

(cd ${FLANG_BASE}/flang/runtime/libpgmath
mkdir -p build && cd build
cmake $CMAKE_OPTIONS ..
make -j `nproc`
make install)

cd ${FLANG_BASE}/flang
mkdir -p build && cd build
cmake $CMAKE_OPTIONS ..
make -j `nproc`
make install
