@echo off
echo Démarrage du backend...
cd BACKEND-Gestion-Vue.js
start cmd /k "npm install && node app.js"

cd ..
echo Démarrage du frontend...
cd FRONTEND-Gestion-Vue.js
start cmd /k "npm install && npm run dev"

echo Backend et Frontend demarres !
pause
