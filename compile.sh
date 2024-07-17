#!/bin/bash
# shell command file for compiling Intel Fortran source file.
# Author:  Daniel Tulips Liu
# Date  :  July 17, 2024.

source /opt/intel/oneapi/setvars.sh --force

ifort -m64 -free -g kindtype.f90 interfaces.f90 umap_solve.f90 main.f90 \
	-o output

