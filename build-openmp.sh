#!/bin/bash -x

. setup.sh

export FLANG_BASE=${1:-`pwd`}
if [[ ! -d ${FLANG_BASE}/openmp ]]; then
  git clone https://github.com/llvm-mirror/openmp.git ${FLANG_BASE}/openmp
fi
(cd ${FLANG_BASE}/openmp && git checkout release_70)

cd ${FLANG_BASE}/openmp
mkdir -p build && cd build
cmake $CMAKE_OPTIONS ..
make -j `nproc`
make install
