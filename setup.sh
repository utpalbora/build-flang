#!/bin/bash

INSTALL_PREFIX=/home/`whoami`/installs/flang-$(date +'%Y-%m-%d')

# Targets to build should be one of: X86 PowerPC AArch64
CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
  -DLLVM_CONFIG=$INSTALL_PREFIX/bin/llvm-config \
  -DCMAKE_CXX_COMPILER=$INSTALL_PREFIX/bin/clang++ \
  -DCMAKE_C_COMPILER=$INSTALL_PREFIX/bin/clang \
  -DLLVM_TARGETS_TO_BUILD=X86"
  #-DCMAKE_ASM_COMPILER=$INSTALL_PREFIX/bin/clang \
  #-DCMAKE_Fortran_COMPILER=$INSTALL_PREFIX/bin/flang \
