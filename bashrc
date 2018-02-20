#!/bin/bash
#
# Paludis environment
#

LC_ALL=en_US.UTF-8

# Burn all cores
MAKEOPTS="-j8"

O3_FLAGS="-ftree-vectorize"
ARCH_FLAGS="-march=native"

# Suppress useless warnings about unused local typedefs appeared for some packages
CXXONLY_FLAGS="-fnothrow-opt -Wno-unused-local-typedefs"

CFLAGS="-O2 -pipe ${ARCH_FLAGS} ${O3_FLAGS}"
CXXFLAGS="${CFLAGS} ${CXXONLY_FLAGS}"
LDFLAGS="-Wl,-O1 -Wl,--sort-common -Wl,--as-needed"

# Detect terminal width dynamically for better [ ok ] align
save_COLUMNS=${COLUMNS}
COLUMNS=$(stty size 2>/dev/null | cut -d' ' -f2)
test -z "${COLUMNS}" && COLUMNS=${save_COLUMNS}
unset save_COLUMNS
PALUDIS_ENDCOL=$'\e[A\e['$(( ${COLUMNS:-80} - 7 ))'G'

# Tune hooks
PALUDIS_FILESYSTEM_HOOK_NO_WARNING=yes

# Setup per package environment
[ -e /usr/libexec/paludis-hooks/setup_pkg_env.bash ] && source /usr/libexec/paludis-hooks/setup_pkg_env.bash
