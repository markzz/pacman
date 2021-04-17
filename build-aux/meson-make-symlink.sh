#!/bin/sh
set -eu

# this is needed mostly because $DESTDIR is provided as a variable,
# and we need to create the target directory...

# test if ln is GNU or not
LN_FLAG="-T"
strings /bin/ln | grep -q 'GNU coreutils' || LN_FLAG=""

mkdir -vp "$(dirname "${DESTDIR:-}$2")"
if [ "$(dirname $1)" = . ]; then
        ln -vfs ${LN_FLAG} "$1" "${DESTDIR:-}$2"
else
        ln -vfs ${LN_FLAG} --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
fi
