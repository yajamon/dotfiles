#!/bin/bash

# getoptsによる引数判定
while getopts "hn:m:" OPT ; do
    case $OPT in
        h) echo "Help: im-yajamon.sh [-n YOUR_NAME -m YOUR_EMAIL]"; exit 1 ;;
        n) OPT_FLAG_n=1;OPT_VALUE_n=$OPTARG ;;
        m) OPT_FLAG_m=1;OPT_VALUE_m=$OPTARG ;;
    esac
done

if [ ${OPT_FLAG_n:-0} -ne ${OPT_FLAG_m:-0} ]; then
    echo "Invalid. Look -h option." >&2
    exit 1
fi

readonly NAME=${OPT_VALUE_n:-yajamon}
readonly EMAIL=${OPT_VALUE_m:-yajamon.tatsuki@gmail.com}

# Gitリポジトリで設定する
if git rev-parse 2> /dev/null; then
    git config user.name $NAME
    git config user.email $EMAIL
fi
