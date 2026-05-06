#!/bin/bash

if [[ -z $(git status --porcelain) ]]; then
  echo "Nada para commitar"
  exit 0
fi

git add .
git commit -m "${1:-auto commit}"
git push origin main