#!/bin/bash -x

. setup.sh

export FLANG_BASE=${1:-`pwd`}
if [[ ! -d ${FLANG_BASE}/llvm ]]; then
  git clone https://github.com/flang-compiler/llvm.git ${FLANG_BASE}/llvm
else
  cd ${FLANG_BASE}/llvm && git pull
fi
(cd ${FLANG_BASE}/llvm && git checkout release_70)

cd ${FLANG_BASE}/llvm

# Use local GCC to bootstrap LLVM
mkdir -p build && cd build
cmake $CMAKE_OPTIONS -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ ..
make -j `nproc`
make install
