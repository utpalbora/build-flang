#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 path_to_parent_of_flang"
  echo "example: $0 /home/username/base"
  exit 0
fi
FLANG_ROOT=${1:-`pwd`}

./build-llvm.sh $FLANG_ROOT
./build-flang-driver.sh $FLANG_ROOT
./build-openmp.sh $FLANG_ROOT
./build-flang.sh $FLANG_ROOT
