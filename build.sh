#!/bin/bash

shopt -s expand_aliases
source ~/.zshrc
source ~/.bashrc

swiki ./wiki ./ -d
git add .
git commit -m "Update"
git push origin HEAD