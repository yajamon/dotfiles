#!/bin/bash

readonly PATTERN=$1

git rev-parse 1>/dev/null || exit 1

readonly Rewind=$(git branch | grep '*' | tr -d '*')

git branch -l $PATTERN | tr '*' ' ' | ( while read bname
do
    git switch $bname && git merge --ff-only origin/$bname
done

git switch $Rewind
)
