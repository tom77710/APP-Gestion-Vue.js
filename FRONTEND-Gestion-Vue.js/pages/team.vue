<template>
    <v-sheet class="mx-auto" width="100%">
        <h1>L'équipe</h1>
        <v-spacer/>
        <v-data-table 
            :headers="headers"
            :items="usersData" 
            v-if="usersData">
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>Gestion des utilisateurs</v-toolbar-title>
                    <v-divider class="mx-4" inset vertical ></v-divider>
                    <v-spacer></v-spacer>
                    <v-dialog v-model="dialog" max-width="500px" >
                        <template v-slot:activator="{ props }">
                            <v-btn class="mb-2" color="primary"
                            dark v-bind="props" >
                            Ajouter
                            </v-btn>
                        </template>
                        <v-card>
                            <v-card-title>
                            <span class="text-h5">Créer un utilisateur</span>
                            </v-card-title>

                            <v-card-text>
                            <v-container>
                                <v-text-field label="E-mail" v-model="userData.email"></v-text-field>
                                <v-text-field label="Mot de passe" v-model="userData.pass"></v-text-field>
                            </v-container>
                            </v-card-text>

                            <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn color="blue-darken-1"
                                variant="text" @click="closeDial" >
                                Annuler
                            </v-btn>
                            <v-btn color="blue-darken-1"
                                variant="text" @click="addUser" >
                                Créer
                            </v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    <!-- Dialog delete -->
                    <v-dialog v-model="dialogDelete" max-width="500px">
                        <v-card>
                            <v-card-title class="text-h5">Supprimer l'utilisateur {{ idToDelete }} ?</v-card-title>
                            <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn color="blue-darken-1" variant="text" @click="closeDelete">Annuler</v-btn>
                            <v-btn color="blue-darken-1" variant="text" @click="deleteItemConfirm">Oui</v-btn>
                            <v-spacer></v-spacer>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    <!-- ### -->
                </v-toolbar>
            </template>
            <!-- Supprimer une ligne -->
            <template v-slot:item.actions="{ item }">
                <v-icon size="small" @click="deleteItem(item.id)">
                    mdi-delete
                </v-icon>
            </template>
            <!-- ### -->
        </v-data-table>
        <v-skeleton-loader type="article" v-else></v-skeleton-loader>
    </v-sheet>
</template>

<script setup lang="ts">
    import { ref } from 'vue'

    const { data: usersData, refresh } = await useFetch('http://localhost:3002/users')

    // Var
    const dialog = ref(false)
    const dialogDelete = ref(false)
    const idToDelete = ref(-1) 

    const userData = ref({
        email: '',
        pass: '',
    })

    const headers = ref ([
        { title: 'ID', key: 'id' },
        { title: 'E-mail', key: 'email' },
        { title: 'Pass', key: 'pass' },
        { title: 'Est Admin ?', key: 'isAdmin' },
        { title: 'Actions', key: 'actions', sortable: false },
    ])

    // Func
    const closeDial = () => {
        dialog.value = false
    }

    const addUser = async () => {
        const userToCreate = {
            "email": userData.value.email,
            "pass": userData.value.pass
        }

        const { data: responseData } = await useFetch(`http://localhost:3002/users`, {
            method: 'post',
            body: userToCreate
        })

        if (responseData.value)
        {
            // user créé
            userData.value.email = ""
            userData.value.pass = ""
            closeDial()
            refresh()
        }
    }

    // Suppression
    const deleteItem  = (itemId:any) => {
        idToDelete.value = itemId
        dialogDelete.value = true
    }

    const deleteItemConfirm = async () => {
        const { data: responseData } = await useFetch(`http://localhost:3002/users?id=${idToDelete.value}`, {
            method: 'delete'
        })

        if (responseData.value)
        {
            // user supprimé
            closeDelete()
            refresh()
        }
    }

    const closeDelete = () => {
        dialogDelete.value = false
        idToDelete.value = -1
    }

</script>