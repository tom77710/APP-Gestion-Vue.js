<template>
    <v-sheet class="mx-auto" width="100%">
        <h1>Accueil</h1>
        
    <v-container>
      <v-row>
        <v-col>

        <v-card color="indigo" variant="flat" v-if="usersData">
            <v-card-item title="Utilisateurs">
            <template v-slot:subtitle>
                <v-icon
                class="me-1 pb-1"
                color="success"
                icon="mdi-trending-up"
                size="18"
                ></v-icon>
                En hausse de 5%
            </template>
            </v-card-item>

            <v-card-text class="py-0">
            <v-row align="center" no-gutters>
                <v-col class="text-h2" cols="6" >
                    {{ usersData.length }} 
                </v-col>

                <v-col class="text-right" cols="6">
                <v-icon icon="mdi-account" size="88" ></v-icon>
                </v-col>
            </v-row>
            </v-card-text>

            <div class="d-flex py-3 justify-space-between">
            <v-list-item
                density="compact"
                prepend-icon="mdi-gender-male"
            >
                <v-list-item-subtitle>{{ usersData.length - 1 }}</v-list-item-subtitle>
            </v-list-item>

            <v-list-item
                density="compact"
                prepend-icon="mdi-gender-female"
            >
                <v-list-item-subtitle>1</v-list-item-subtitle>
            </v-list-item>
            </div>

            <v-divider></v-divider>

            <v-card-actions>
            <v-btn @click="navigateTo('/team')">Détail</v-btn>
            </v-card-actions>
        </v-card>
      </v-col>
    
      <v-col>
        <v-card color="indigo" variant="flat" v-if="projectsData">
            <v-card-item title="Projets">
            <template v-slot:subtitle>
                <v-icon
                class="me-1 pb-1"
                color="error"
                icon="mdi-trending-down"
                size="18"
                ></v-icon>
                En baisse de 1%
            </template>
            </v-card-item>

            <v-card-text class="py-0">
            <v-row align="center" no-gutters>
                <v-col class="text-h2" cols="6" >
                {{ projectsData.length }}
                </v-col>

                <v-col class="text-right" cols="6">
                <v-icon icon="mdi-briefcase" size="88" ></v-icon>
                </v-col>
            </v-row>
            </v-card-text>

            <div class="d-flex py-3 justify-space-between">
            <v-list-item
                density="compact"
                prepend-icon="mdi-folder-open"
            >
                <v-list-item-subtitle>{{ projectsData.length - 1 }} projets ouverts</v-list-item-subtitle>
            </v-list-item>

            <v-list-item
                density="compact"
                prepend-icon="mdi-lock"
            >
                <v-list-item-subtitle>1 projets clos</v-list-item-subtitle>
            </v-list-item>
            </div>

            <v-divider></v-divider>

            <v-card-actions>
            <v-btn @click="navigateTo('/projects')">Détail</v-btn>
            </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
    </v-container>

    <v-container>
        <v-card color="indigo" variant="flat">
        <v-card-title class="text-overline">
            Progression du CA

            <div class="text-h3 font-weight-bold">90%</div>

            <div class="text-h6 font-weight-regular">
            10 000€ restant
            </div>
        </v-card-title>
        <br>
        <v-card-text>
            <v-progress-linear
            height="20"
            model-value="90"
            rounded="lg"
            >
            <v-badge
                class="position-absolute"
                color="white"
                dot
                inline
            ></v-badge>
            </v-progress-linear>

            <div class="d-flex justify-space-between py-3">
            <span class="font-weight-medium">
                90 000€ réalisés
            </span>

            <span> Objectif 100 000€ </span>
            </div>
        </v-card-text>

        <v-divider></v-divider>

        <v-list-item
            append-icon="mdi-chevron-right"
            lines="two"
            subtitle="Rapport détaillé"
            link
             @click="navigateTo('/reports')"
        ></v-list-item>
        </v-card>
    </v-container>

  </v-sheet>
</template>

<script setup lang="ts">
    const { data: usersData } = await useFetch('http://localhost:3002/users')
    const { data: projectsData } = await useFetch('http://localhost:3002/projects')
</script>