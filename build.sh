#!/bin/bash

### Note to self -- keeping as a work in progress

### Create array of packages to keep from full gitpod image
pkgsToKeep=(compiler Homebrew Python Docker Tailscale nix Prologue)

### Pull Dockerfile for full gitpod image
curl -O https://raw.githubusercontent.com/gitpod-io/workspace-images/master/full/Dockerfile

### Get list of major packages installed in a temporary .txt file
grep "###" -n Dockerfile > parseme.txt
### Read temporary .txt file into an array called pkgs
OIFS=$IFS; IFS=$'\r\n' GLOBIGNORE='*' command eval 'pkgs=($(cat parseme.txt))'; IFS=$OIFS
### Remove temporary file
if [ -f parseme.txt ]; then rm "parseme.txt"; fi

### Loop through pkgs array, and process
for i in "${pkgs[@]}"
do
  OIFS=$IFS
  IFS=":"
  read -a strarr <<< "$i"
  echo "${strarr[*]}"
  IFS=$OIFS
done
