#!/bin/bash
set -e
thisdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cpp=$thisdir/test.cpp

user_mode=$1
mode=release
opt=-O3
if [ "$user_mode" = "debug" ];then
    mode=debug
    opt=-O0
fi

compiler=g++
if [ "x$CXX" != "x" ];then
    compiler=$CXX
fi

echo "Compiling $cpp with $compiler ..."
$compiler -std=gnu++17 $opt -g -pedantic -Wall -Wextra -Wconversion -Werror -pthread $cpp -o ${cpp%.cpp}.$mode
