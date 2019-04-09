#!/bin/bash -x

. setup.sh

if [[ ! -d llvm ]]; then
  git clone https://github.com/flang-compiler/llvm.git
fi
(cd llvm && git checkout release_70)

cd llvm

# Use local GCC to bootstrap LLVM
mkdir -p build && cd build
cmake $CMAKE_OPTIONS -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ ..
make -j `nproc`
make install
