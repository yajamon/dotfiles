
# ls
alias ls='ls -G'
alias ll='ls -lh'

# profile
alias showMyProfile='cat ~/.bash_profile ~/.bashrc'
GIT_PS1_SHOWDIRTYSTATE=true
# PS1='\u@\h \W$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '
PS1='\u@\h:\[\033[36m\]\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '
