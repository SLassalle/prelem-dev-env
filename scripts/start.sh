#!/bin/bash

# Copie automatique du fichier .env s’il n’existe pas
if [ ! -f .env ]; then
  echo "Création du fichier .env depuis .env.example"
  cp .env.example .env
fi

echo "Lancement de l'environnement Docker..."
docker-compose up --build