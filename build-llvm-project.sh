#!/bin/bash -x

. setup.sh

export FLANG_BASE=${1:-`pwd`}
if [[ ! -d ${FLANG_BASE}/classic-flang-llvm-project ]]; then
      git clone -b release_100 https://github.com/flang-compiler/classic-flang-llvm-project.git ${FLANG_BASE}/classic-flang-llvm-project
fi

(cd ${FLANG_BASE}/classic-clang-llvm-project && git checkout release_100)


cd ${FLANG_BASE}/classic-flang-llvm-project

# Use local GCC to bootstrap LLVM
mkdir -p build && cd build
cmake $CMAKE_OPTIONS -DCMAKE_C_COMPILER=/usr/bin/gcc \
  -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
  -DLLVM_ENABLE_CLASSIC_FLANG=ON \
  -DLLVM_ENABLE_PROJECTS="clang;openmp" \
  ../llvm
make -j `nproc`
make install
