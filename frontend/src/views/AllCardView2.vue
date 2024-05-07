<template>
  <div class="containar m-5">
    <h3>Kérdések:</h3>
    <div class="row">
      <div class="col-md-3" v-for="item in questions" :key="item.id">
        <div class="card ">
          <img :src="item.imagePath" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">{{ item.name }}</h5>
            <p class="card-text">ID: {{ item.id }}</p>
            <p class="list-group-item">{{ item.answer1 }}</p>
              <p class="list-group-item">{{ item.answer2 }}</p>
              <p class="list-group-item">{{ item.answer3 }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
"../img/bison.jpg"
import {http} from "@/components/utils/http.js"

export default {
  data(){
        return{
          questions: []                    
        }
    },
    methods: {
      async getQuestions(){
      const response = await http.get('/questions')
      this.questions=await response.data;
 },
 
  },

  mounted(){
    this.getQuestions();
  }
};
</script>

<style scoped>

.card {
  margin-bottom: 20px;
  height: 420px;
  max-width: 400px;
  
}
img {
  max-width: 400px;
  max-height: 200px;
}
</style>
