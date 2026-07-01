#!/usr/bin/env bash

set -euxo pipefail

export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"

rpath="-Wl,-rpath,${PREFIX}/lib"

echo "--- C ---"
${CC} test.c $(pkg-config --cflags --libs libxrl) ${rpath} -lm -o test_c
./test_c

echo "--- C++ ---"
${CXX} test.cpp $(pkg-config --cflags --libs libxrl) ${rpath} -o test_cpp
./test_cpp

echo "--- Fortran ---"
${FC} test.f90 $(pkg-config --cflags --libs libxrlf03 libxrl) -I"${PREFIX}/include/xraylib" ${rpath} -o test_fortran
./test_fortran

echo "All tests passed."
