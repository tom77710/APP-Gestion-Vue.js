#!/bin/bash

echo "Démarrage du backend..."
cd BACKEND-Gestion-Vue.js || exit
npm install && node app.js &
cd ..

sleep 2  # Pause pour éviter les conflits de démarrage

echo "Démarrage du frontend..."
cd FRONTEND-Gestion-Vue.js || exit
npm install && npm run dev &

wait  # Attend la fin des processus enfants
