#!/bin/bash

set -e -x

mkdir build
pushd build

export PKG_CONFIG="${BUILD_PREFIX}/bin/pkg-config"

meson \
	${SRC_DIR} \
	${MESON_ARGS} \
	-Dlibdir=lib \
	-Dlibpython-dir="${PREFIX}/lib" \
	-Dpython="${PYTHON}" \
	--prefix="${PREFIX}" \
	--wrap-mode=nofallback \
;

# build
ninja -j${CPU_COUNT} -v

# install
ninja install
