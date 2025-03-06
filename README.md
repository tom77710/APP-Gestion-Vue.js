# Gestion-Vue.js

🔹 Donner les permissions et exécuter le script :

Dans le terminal, exécutez ces commandes :

sh
start.bat

🔹 Explication du script :

Il installe les dépendances (npm install) pour le backend et le frontend.
Il lance le backend (npm start) et redirige la sortie vers backend.log pour éviter le blocage du terminal.
Il démarre le frontend (npm run dev) et redirige la sortie vers frontend.log.
nohup permet aux processus de continuer à tourner même après la fermeture du terminal.
Après l’exécution du script, vous devriez pouvoir accéder :

Backend : http://localhost:3002
Frontend : http://localhost:3000 (ou un autre port selon Nuxt)

# Users Admin

login : thomas@gmail.com
mdp : 12345

# Architecture 

GESTION-VUE.JS
│
│── .vscode
│    └── settings.json
│
│──BACKEND-Gestion-Vue.js
│    │ 
│    │── api
│    │   ├── projectsApi.js
│    │   └── usersApi.js
│    │
│    │── db
│    │   ├── projects.json
│    │   └── users.json
│    │
│    │── entities
│    │   ├── projects.js
│    │   └── users.js
│    │
│    │── app.js
│    │── package.json
│    └── README.md
│
│──FRONTEND-Gestion-Vue.js
│    │
│    │── .nuxt
│    │   ├── manifest
│    │   ├── schema
│    │   ├── types
│    │   ├── app.config.mjs
│    │   ├── components.d.ts
│    │   ├── imports.d.ts
│    │   ├── nitro.json
│    │   ├── nuxt.json
│    │   ├── tsconfig.json
│    │   └── tsconfig.server.json
│    │
│    │── .output
│    │   └── public
│    │
│    │── components
│    │   └── ProjectSingle.vue
│    │
│    │── layouts
│    │   ├── default.vue
│    │   └── login.vue
│    │
│    │── node_modules
│    │
│    │── pages
│    │   ├── index.vue
│    │   ├── login.vue
│    │   ├── project-[id].vue
│    │   ├── projects.vue
│    │   ├── reports.vue
│    │   ├── settings.vue
│    │   └── team.vue
│    │
│    │── plugins
│    │   └── vuetify.ts
│    │
│    │── public
│    │   ├── favicon.ico
│    │   └── robots.txt
│    │
│    │── server
│    │   └── tsconfig.json
│    │
│    │── settings.json
│    │── server
│    │── .gitignore
│    │── app.vue
│    │── nuxt.config.ts
│    │── package-lock.json
│    │── package.json
│    │── README.md
│    └── tsconfig.json
│
│── README.md
└──start.bat