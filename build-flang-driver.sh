#!/bin/bash -x

. setup.sh

export FLANG_BASE=${1:-`pwd`}
if [[ ! -d ${FLANG_BASE}/flang-driver ]]; then
  git clone https://github.com/flang-compiler/flang-driver.git ${FLANG_BASE}/flang-driver
else
  cd ${FLANG_BASE}/flang-driver && git pull
fi
(cd ${FLANG_BASE}/flang-driver && git checkout release_70)

# Use local GCC to bootstrap flang-driver
cd ${FLANG_BASE}/flang-driver
mkdir -p build && cd build
cmake $CMAKE_OPTIONS -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ ..
make -j `nproc`
make install
