#!/bin/bash

shopt -s expand_aliases
if [ -n "$BASH_VERSION"]
then
    source ~/.bashrc
else
    source ~/.zshrc
fi

swiki ./wiki ./ -d
git add .
git commit -m "Update"
git push origin HEAD
