<template>
    <div>
      <br>
      <h5>Az adatbázis egy mySQL szervereren fut, amit egy Node.js szerver szolgál ki a Vue.js felé.
       Ez a menű csak admin jogosultsággal érhető el. Lehetőség van Kérdéseket módosítani, létrehozni, 
       lekérdezni és törölni, felhasználókat és eredményeket törölni.
        </h5>
    <br>

    <h5>Kérdések tábla</h5>
<div class="container-fluid">
<table class="table table-striped mt-2">
  <thead class="pt-4 bg-warning text-center">
    <th>id</th><th>Név</th><th>elérési út</th><th>válasz 1</th><th>válasz 2</th><th>válasz 3</th><th >Művelet</th>
  </thead>
  <tr class="text-center">
  <td>#</td>
  <td><input type="text" class="form-control" name="name" id="name" v-model="newQuestion.name" placeholder="név"></td>
  <td><input type="text" class="form-control" name="rating" id="rating" v-model="newQuestion.imagePath" placeholder="elérési út"></td>
  <td><input type="text" class="form-control" name="category" id="category" v-model="newQuestion.answer1" placeholder="Válasz"></td>
  <td><input type="text" class="form-control" name="description" id="description" v-model="newQuestion.answer2" placeholder="Válasz"></td>
  <td><input type="text" class="form-control" name="price" id="price" v-model="newQuestion.answer3" placeholder="Válasz"></td>
  
  <td colspan="2">
    <button class="btn btn-success" @click="createQuestion(this.newQuestion)">Felvétel</button>
  </td>
</tr>

<tbody class="text-center" v-for="item in questions" :key="item.id" > <tr> 
<th>{{ item.id }}</th>
<th>{{ item.name }}</th>
<th>{{item.imagePath}}</th>
<th>{{item.answer1}}</th>
<th>{{item.answer2}}</th>
<th>{{item.answer3}}</th>
<th><button class="btn btn-info" data-bs-toggle="modal" :data-bs-target="`#modal-${item.id}` ">Módosítás</button>
  <button class="btn btn-danger" @click="deleteQuestion(item.id)">Törlés</button></th>
  
</tr>
<EditModal :id="`modal-${item.id}`" :item="item" @modify-question="modifyQuestion"/> 

</tbody>

</table>

</div>
      <div class="container-fluid">
        <h5>Felhasználók tábla</h5>
      <table class="table table-striped mt-2">
        <thead class="pt-4 bg-warning text-center">
    
      <th >Id</th>
      <th>Név</th>
      <th>Email</th>
      <th>Admin jogok</th>
      <th>Művelet</th>
    </thead>
<tbody class="text-center" v-for="user in users" :key="user.id"> <tr><td>{{ user.id }} </td> <td>{{user.name }}</td> <td>{{ user.email }} </td> <td>{{user.isAdmin? 'igen':'nem' }}</td>
  <td><button class="btn btn-danger" @click="deleteUser(user.id)">Törlés</button></td></tr>
</tbody>
</table>
</div>

<br>
<div class="container-fluid">
        <h5>Eredmények tábla</h5>
      <table class="table table-striped mt-2">
        <thead class="pt-4 bg-warning text-center">
        <th >Id</th>
      <th>UserId</th>
      <th>Pontszám</th>
      <th>Dátum</th>
      <th>Művelet</th>
    </thead>
<tbody class="text-center" v-for="item in scores" :key="item.id" ><tr><td>{{ item.id }} </td> <td>{{ item.name }}</td> <td>{{ item.score }} </td> 
  <td>{{ item.date }}  </td><td><button class="btn btn-danger" @click="deleteScore(item.id)">Törlés</button></td></tr>
</tbody>
</table>
</div>
<br>
      
      <!-- <ul>
        <li v-for="question in questions" :key="question.id" > {{ question.id }} {{ question.name }}</li>
      </ul> -->
    </div>

  </template>
  
  <script>
  import { http } from '@/components/utils/http';
  import EditModal from "@/components/layouts/EditModal.vue";
    
  export default {
    
    components: {
      EditModal
    },

    data() {
      return {
        users: [],
        scores: [],
        questions: [],
        item: Object,
        newQuestion: {          
          name: "",
          imagePath: "",
          answer1: "",
          answer2: "",
          answer3: ""
        }
      };
    },
    methods: {

  async getUsers() {
    try {
      const response = await http.get('users');
      this.users = response.data;
    } catch (error) {
      console.error('Hiba történt a felhasználók lekérése közben:', error);
    }
  },
  
  async deleteUser(id) {
    try {
      await http.delete(`/user/${id}`);
      await this.getUsers(); // Felhasználók újratöltése a törlés után
    } catch (error) {
      console.error('Hiba történt a felhasználó törlése közben:', error);
    }
  },

  async getScores() {
    try {
      const response = await http.get('scores');
      this.scores = response.data;
    } catch (error) {
      console.error('Hiba történt a pontszámok lekérése közben:', error);
    }
  },
  async deleteScore(id) {
    try {
      await http.delete(`/score/${id}`);
      await this.getScores(); // Az eredmények újratöltése a törlés után
    } catch (error) {
      console.error('Hiba történt a  törlése közben:', error);
    }
  },
  async getQuestions() {
    try {
      const response = await http.get('questions');
      this.questions = response.data;
    } catch (error) {
      console.error('Hiba történt a kérdések lekérése közben:', error);
    }
  },

  async createQuestion(newQuestion) {
    try {
      const response = await http.post('questions', newQuestion);
      this.questions.push(response.data);
      await this.getQuestions()
    } catch (error) {
      console.error('Hiba történt az új kérdés létrehozása közben:', error);
    }
  },

  async modifyQuestion(modifiedQuestion) {
    try {
      const response = await http.put(`questions/${modifiedQuestion.id}`, modifiedQuestion);
      const index = this.questions.findIndex(item => item.id === modifiedQuestion.id);
      this.questions.splice(index, 1, response.data);
    } catch (error) {
      console.error('Hiba történt a kérdés módosítása közben:', error);
    }
  },

  async deleteQuestion(id) {
    try {
      const response = await http.delete(`/questions/${id}`);
      await this.getQuestions()
      return response.data;
    } catch (error) {
      console.error('Hiba történt a kérdés törlése közben:', error);
    }
  }

    },
    mounted() {
        this.getUsers();
        this.getScores();
        this.getQuestions()
     
    }
  };
  </script>