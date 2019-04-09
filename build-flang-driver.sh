#!/bin/bash -x

. setup.sh

if [[ ! -d flang-driver ]]; then
  git clone https://github.com/flang-compiler/flang-driver.git
fi
(cd flang-driver && git checkout release_70)

# Use local GCC to bootstrap flang-driver
cd flang-driver
mkdir -p build && cd build
cmake $CMAKE_OPTIONS -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ ..
make -j `nproc`
make install
