#!/bin/bash

rm -f CMakeCache.txt
rm -f *.cmake
rm -rf CMakeFiles

MY_PROJECT_SOURCE=/home/chao/code/modular_convolution
MY_PROJECT_INSTALL=../install.dir

cmake                                                                                       \
-D CMAKE_INSTALL_PREFIX=${MY_PROJECT_INSTALL}                                               \
-D CMAKE_CXX_COMPILER=clang++                                                               \
-D CMAKE_BUILD_TYPE=Release                                                                 \
-D CMAKE_VERBOSE_MAKEFILE:BOOL=ON                                                           \
-D BOOST_ROOT="/package/install/boost_1.67.0"                                               \
-D CMAKE_CUDA_COMPILER="/package/install/cuda_10.0/bin/nvcc"                                \
-D CUDA_COMMON_INCLUDE_DIR="/home/chao/code/test_feature/cuda_common/cuda_10.0_common/inc"  \
-D CMAKE_CUDA_FLAGS="-ccbin clang++ -m64 -Xcompiler -fopenmp -lineinfo --source-in-ptx -keep -Xptxas -v -arch=sm_61 -Xptxas -v" \
${MY_PROJECT_SOURCE}

#-D CMAKE_CUDA_FLAGS="-ccbin clang++ -m64 -Xcompiler -fopenmp -lineinfo --source-in-ptx -keep -Xptxas -v -arch=sm_61 -Xptxas -v -maxrregcount=40" \
#-D CMAKE_CUDA_FLAGS="-lineinfo --source-in-ptx -keep -Xptxas -v -arch=sm_35 -Xptxas -v -maxrregcount=32"            \
#-D CMAKE_CUDA_FLAGS="-G -lineinfo --source-in-ptx -keep -Xptxas -v -arch=sm_35"            \
