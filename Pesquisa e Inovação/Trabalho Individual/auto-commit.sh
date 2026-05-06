#!/bin/bash

echo "Adicionando arquivos..."
git add .

if [[ -z $(git status --porcelain) ]]; then
  echo "Nada para commitar"
else
  echo "Criando commit..."
  git commit -m "${1:-auto commit}"
fi

echo "Enviando para o GitHub..."
git push origin main

echo "✅ Finalizado"