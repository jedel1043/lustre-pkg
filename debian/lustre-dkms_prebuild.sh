#!/bin/sh
# DKMS PRE_BUILD hook for lustre-client-modules-dkms and
# lustre-server-modules-dkms.

set -eu

SRC=/usr/src/lustre

if [ ! -f "$SRC/configure.ac" ]; then
	echo "ERROR: shared lustre source tree not found at $SRC" >&2
	echo "       Install the lustre-source package (same version as" >&2
	echo "       this DKMS package) and retry." >&2
	exit 1
fi

find . -mindepth 1 -maxdepth 1 \
	! -name dkms.conf \
	! -name lustre-dkms_prebuild.sh \
	-exec rm -rf -- {} +

cp -a "$SRC"/. .
