
ostype () {
    uname | tr "[:upper:]" "[:lower:]"
}
os_detect() {
    case "$(ostype)" in
        *'linux'*)  PLATFORM='linux'   ;;
        *'darwin'*) PLATFORM='osx'     ;;
        *'bsd'*)    PLATFORM='bsd'     ;;
        *)          PLATFORM='unknown' ;;
    esac
    export PLATFORM
}
# is_osx returns true if running OS is Macintosh
is_osx() {
    os_detect
    if [ "$PLATFORM" = "osx" ]; then
        return 0
    else
        return 1
    fi
}

is_exists() {
    type -a "$1" >/dev/null 2>&1
    return $?
}

has() {
    is_exists "$@"
}
