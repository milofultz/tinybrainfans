#1/bin/bash

swiki ./wiki ./ -d
git add .
git commit -m "Update"
git push origin HEAD
