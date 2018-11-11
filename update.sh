#!/usr/bin/env bash

cd ~/.vim

echo "Updating plugins" &&
  git submodule init &&
  git submodule update &&
  git submodule foreach git pull origin master

