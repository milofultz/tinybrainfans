#!/bin/zsh

shopt -s expand_aliases

#source ~/.zshrc

swiki ./wiki ./ -d

new_changes=$(git status | grep -i "modified")

if [[ ! -z "$new_changes" ]]
then
    git add .
    git commit -m "Update"
    git push origin HEAD
fi

