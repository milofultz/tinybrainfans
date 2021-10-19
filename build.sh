#!/bin/zsh

shopt -s expand_aliases
source ~/.zshrc

swiki ./wiki ./ -d
git add .
git commit -m "Update"
git push origin HEAD
