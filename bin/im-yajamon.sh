#!/bin/bash

# Gitリポジトリでyajamonだと設定する
if git rev-parse 2> /dev/null; then
    git config user.name yajamon
    git config user.email yajamon.tatsuki@gmail.com
fi
