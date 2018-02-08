#!/bin/bash
#
# Paludis environment
#

LC_ALL=en_US.UTF-8

# Burn all cores
MAKEOPTS="-j8"

ARCH_FLAGS="-march=native"

# Suppress useless^W warnings about unused local typedefs appeared for some packages
CXXONLY_FLAGS="-fnothrow-opt -Wno-unused-local-typedefs"

CFLAGS="-O2 -pipe ${ARCH_FLAGS}"
CXXFLAGS="${CFLAGS} ${CXXONLY_FLAGS}"
