#!/bin/bash

shopt -s expand_aliases
source ~/.bashrc
source ~/.zshrc

swiki ./wiki ./ -d
git add .
git commit -m "Update"
git push origin HEAD
