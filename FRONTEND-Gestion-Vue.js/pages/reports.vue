<template>
    
        <h1>Rapport détaillé</h1>
        <v-spacer/>

        <v-row>
            <v-col>
                <v-card
                    class="mx-auto text-center"
                    color="indigo"
                    max-width="600"
                    dark
                >
                    <v-card-text>
                    <v-sheet color="rgba(0, 0, 0, .12)">
                        <v-sparkline
                        :model-value="salesValue"
                        color="rgba(255, 255, 255, .7)"
                        height="100"
                        padding="24"
                        stroke-linecap="round"
                        smooth
                        >
                        <template v-slot:label="item">
                            ${{ item.value }}
                        </template>
                        </v-sparkline>
                    </v-sheet>
                    </v-card-text>

                    <v-card-text>
                    <div class="text-h4 font-weight-thin">
                        Progression des ventes
                    </div>
                    </v-card-text>

                    <v-divider></v-divider>

                    <v-card-actions class="justify-center">
                    <v-btn
                        variant="text"
                        block
                    >
                        Plus d'infos
                    </v-btn>
                    </v-card-actions>
                </v-card>
            </v-col>

            <v-col>
                <v-card
                    class="mx-auto text-center"
                    color="indigo"
                    max-width="600"
                    dark
                >
                    <v-card-text>
                    <v-sheet color="rgba(0, 0, 0, .12)">
                        <v-sparkline
                        :model-value="usersValue"
                        color="rgba(255, 255, 255, .7)"
                        height="100"
                        padding="24"
                        stroke-linecap="round"
                        smooth
                        >
                        <template v-slot:label="item">
                            {{ item.value }}
                        </template>
                        </v-sparkline>
                    </v-sheet>
                    </v-card-text>

                    <v-card-text>
                    <div class="text-h4 font-weight-thin">
                        Progression des clients
                    </div>
                    </v-card-text>

                    <v-divider></v-divider>

                    <v-card-actions class="justify-center">
                    <v-btn
                        variant="text"
                        block
                    >
                        Plus d'infos
                    </v-btn>
                    </v-card-actions>
                </v-card>
            </v-col>
        </v-row>

        <h2 class="text-center my-8">Principaux KPI</h2>

        <v-row>
            <v-col>
                <div class="text-center">
                    <v-progress-circular model-value="60" :rotate="360" :size="100" :width="15" color="indigo">
                    <template v-slot:default> 60 % </template>
                    </v-progress-circular>
                    <p>Délais</p>
                </div>
            </v-col>
            <v-col>
                <div class="text-center">
                    <v-progress-circular model-value="80" :rotate="360" :size="100" :width="15" color="indigo">
                    <template v-slot:default> 80 % </template>
                    </v-progress-circular>
                    <p>Satisfaction</p>
                </div>
            </v-col>
            <v-col>
                <div class="text-center">
                    <v-progress-circular model-value="70" :rotate="360" :size="100" :width="15" color="indigo">
                    <template v-slot:default> 70 % </template>
                    </v-progress-circular>
                    <p>Efficacité</p>
                </div>
            </v-col>
            <v-col>
                <div class="text-center">
                    <v-progress-circular model-value="35" :rotate="360" :size="100" :width="15" color="indigo">
                    <template v-slot:default> 35 % </template>
                    </v-progress-circular>
                    <p>Marge</p>
                </div>
            </v-col>
        </v-row>
    
        <h2 class="text-center my-8">Derniers commentaires</h2>

        <v-timeline>
            <v-timeline-item v-for="i in 5">
                <template v-slot:icon>
                    <v-avatar :image="`https://robohash.org/${i}`"></v-avatar>
                </template>
                <template v-slot:opposite>
                    <span>Pas trop mal</span>
                </template>
                <v-card class="elevation-2">
                    <v-card-title class="text-h5">
                    Lorem ipsum
                    </v-card-title>
                    <v-card-text>{{ getReviewById(i-1) }}</v-card-text>
                </v-card>
            </v-timeline-item>
        </v-timeline>
        
        <!-- IA -->
    <v-btn class="position-fixed right-0 bottom-0 mr-4 mb-4" 
    color="indigo" icon="$vuetify">
    <v-icon icon="$vuetify"></v-icon>

        <v-dialog activator="parent" max-width="500">
          <template v-slot:default="{ isActive }">
            <v-card rounded="lg">
              <v-card-title class="d-flex justify-space-between align-center">
                <div class="text-h5 text-medium-emphasis ps-2">
                  Demander à l'IA
                </div>

                <v-btn
                  icon="mdi-close"
                  variant="text"
                  @click="isActive.value = false"
                ></v-btn>
              </v-card-title>

              <v-divider class="mb-4"></v-divider>

              <v-card-text>
                <div class="text-medium-emphasis mb-4">
                    <span v-if="inputRes.length > 1">{{ inputRes }}</span>
                    <span v-else>Bonjour, je suis VueAI, comment puis-je vous aider ?</span>
                </div>

                <div class="mb-2">Votre demande</div>

                <v-textarea
                  :counter="300"
                  class="mb-2"
                  rows="2"
                  variant="outlined"
                  persistent-counter
                  v-model="inputMsg"
                ></v-textarea>

                <div class="text-overline mb-2">💎 PREMIUM</div>

                <div class="text-medium-emphasis mb-1">
                  Envie d'aller encore plus loin avec l'IA, souscrivez à l'abonnement premium !
                </div>

                <v-btn
                  class="text-none font-weight-bold ms-n4"
                  color="indigo"
                  text="Prenez mon argent !"
                  variant="text"
                ></v-btn>
              </v-card-text>

              <v-divider class="mt-2"></v-divider>

              <v-card-actions class="my-2 d-flex justify-end">
                <v-btn
                  class="text-none"
                  rounded="xl"
                  text="Annuler"
                  @click="isActive.value = false"
                ></v-btn>

                <v-btn
                  class="text-none"
                  color="indigo"
                  rounded="xl"
                  text="Envoyer"
                  variant="flat"
                  @click="askIA"
                ></v-btn>
              </v-card-actions>
            </v-card>
          </template>
        </v-dialog>

    </v-btn>

</template>

<script setup lang="ts">
    import { ref } from 'vue'

    const salesValue = [
        423,
        446,
        675,
        510,
        590,
        610,
        760,
    ]
    const usersValue = [
        4,
        9,
        45,
        89,
        135,
        211,
        289,
    ]

    const reviews = [
        "The application is difficult to use.",
        "The tool is quite slow, it's annoying.",
        "I have trouble finding the information I need.",
        "It lacks features like CSV export",
        "I think it's not too bad. It works well.",
    ]
    const getReviewById = (id:number) => {
        return reviews[id]
    }

    const inputMsg = ref("")
    const inputRes = ref("")

    const askIA = () => {
        const reviewData = "Here are some reviews: " + reviews.toString() + ". Here is my question: "
        const messageContent = reviewData + inputMsg.value
        inputRes.value = "..."

        const preprompt = {
            "messages":[
                { "role":"system", "content":"You are an assistant, you have to help the user."},
                { "role":"user", "content": messageContent}
            ],
            "model_params": {
                "temperature":0.5,
                "top_p":1,
                "max_new_tokens":2048,
                "stream":false
            },
            "model_name":"mistralai_Mistral-7B-Instruct-v0.3"
        }
        getAiRes(preprompt)
    }

    const getAiRes = async (p:any) => {
        const { data: responseData } = await useFetch(`http://127.0.0.1:5000/v1/chat/completions`, {
            method: 'post',
            body: p
        })
        if (responseData.value)
        {
            console.log(responseData.value.choices[0].message.content)
            inputRes.value = responseData.value.choices[0].message.content
            inputMsg.value = ""
        }
    }

</script>