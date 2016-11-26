echo "load start bashrc"

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

# ls
alias ls='ls -G'
alias ll='ls -lh'

# profile
alias showMyProfile='cat ~/.bash_profile ~/.bashrc'
GIT_PS1_SHOWDIRTYSTATE=true
# PS1='\u@\h \W$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '
PS1='\u@\h:\[\033[36m\]\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '

echo "load complete bashrc"
