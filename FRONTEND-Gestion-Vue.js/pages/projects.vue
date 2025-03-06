<template>
    <v-sheet class="mx-auto" width="100%">
        <h1>Liste des projets</h1>
        <v-spacer/>
        
        <!-- Liste projets -->
        <v-row>
            <template v-for="project in data">
                <ProjectSingle :project="project" @deleteProject="deleteProject" /> 
            </template>
        </v-row>

        <!-- Créer un projet -->
        <v-divider class="mt-8"></v-divider>

        <h2 class="text-h4 my-4">Ajouter un projet</h2>

        <form @submit.prevent="submit">
            <v-text-field
            v-model="name.value.value"
            :counter="3"
            :error-messages="name.errorMessage.value"
            label="Nom"
            ></v-text-field>

            <v-text-field
            v-model="desc.value.value"
            :error-messages="desc.errorMessage.value"
            label="Description"
            ></v-text-field>

            <v-text-field
            v-model="user.value.value"
            :counter="1"
            :error-messages="user.errorMessage.value"
            label="Utilisateur"
            ></v-text-field>

            <v-btn class="me-4" type="submit" >
                Valider
            </v-btn>

            <v-btn @click="handleReset">
                Réinitialiser
            </v-btn>
        </form>

    </v-sheet>
</template>

<script setup lang="ts">
    import { useField, useForm } from 'vee-validate'

    const { data, status, error, refresh } = await useFetch('http://localhost:3002/projects')

    const { handleSubmit, handleReset } = useForm({
        validationSchema: {
            name (value:any) {
                if (value?.length >= 3) return true
                return 'Le nom doit contenir au moins 3 caractères'
            },
            user (value:any) {
                if (/^[0-9-]{1,}$/.test(value)) return true
                return 'Il faut au moins 1 chiffre'
            },
            desc (value:any) {
                if (value?.length >= 3) return true
                return 'Le nom doit contenir au moins 3 caractères'
            },
        },
    })

    const name = useField('name')
    const user = useField('user')
    const desc = useField('desc')

    const submit = handleSubmit(values => {
        // alert(JSON.stringify(values, null, 2))
        const projectToCreate = JSON.stringify(values, null, 2)
        createProject(projectToCreate)
    })

    const createProject = async (p:any) => {
        const { data: responseData } = await useFetch(`http://localhost:3002/projects`, {
            method: 'post',
            body: p
        })

        if (responseData.value)
            refresh()
    }

    const deleteProject = async (val:any) => {
        const { data: responseData } = await useFetch(`http://localhost:3002/projects?id=${val}`, {
            method: 'delete'
        })

        if (responseData.value)
        {
            refresh()
        }
    }

</script>