#/bin/bash

readonly TARGET_DIR="$(cd $(dirname $1); pwd)"
readonly TARGET="$TARGET_DIR/$(basename $1)"
echo "target: $TARGET" >&2

# zip validation
if ! unzip -t $TARGET; then
    echo "Abort" >&2
fi

# unzip
unset WORKSPACE
atexit() {
    test -d "$WORKSPACE" && rm -rf "$WORKSPACE"
}
trap atexit EXIT
trap 'rc=$?; trap - EXIT; atexit; exit $rc' INT PIPE TERM
readonly WORKSPACE=$(mktemp -d)
unzip $1 -d $WORKSPACE

if [ $(ls $WORKSPACE | wc -l) -ne 1 ] || ! [ -d $(find $WORKSPACE -mindepth 1 -maxdepth 1 -type d) ]; then
    echo "NOT Required rewrap"
    exit 1
fi

cd $(find $WORKSPACE -mindepth 1 -maxdepth 1 -type d)
zip "$TARGET_DIR/rewrap_$(basename $TARGET)" -r *

