echo "load start bashrc"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

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
if is_osx ; then
    alias ls='ls -G'
    alias ll='ls -lh'
else
    alias ls='ls --color=auto'
    alias ll='ls -lh'
fi

# chrome
if is_osx ; then
    alias google-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    alias google-chrome-debug='google-chrome --remote-debugging-port=9222'
fi

# profile
alias showMyProfile='cat ~/.bash_profile ~/.bashrc'
PS1='\u@\h:\[\033[36m\]\W'
if type -a __git_ps1 1>/dev/null 2>&1 ; then
    GIT_PS1_SHOWDIRTYSTATE=true
    # PS1='\u@\h \W$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '
    PS1="${PS1}\[\033[31m\]$(__git_ps1 [%s])"
fi
PS1="${PS1}\[\033[00m\]\$ "

echo "load complete bashrc"

# added by travis gem
[ -f /Users/t-kasamatsu/.travis/travis.sh ] && source /Users/t-kasamatsu/.travis/travis.sh
