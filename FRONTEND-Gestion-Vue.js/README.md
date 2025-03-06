# Nuxt Minimal Starter

Look at the [Nuxt documentation](https://nuxt.com/docs/getting-started/introduction) to learn more.

## Setup

Make sure to install dependencies:

```bash
# npm
npm install

## Development Server

Start the development server on `http://localhost:3000`:

```bash
# npm
npm run dev
```

Check out the [deployment documentation](https://nuxt.com/docs/getting-started/deployment) for more information.

# Architecture 

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