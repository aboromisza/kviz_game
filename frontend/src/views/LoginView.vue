<script setup>
import { ref, reactive, onMounted } from 'vue'; // TODO Objektumra áttenni a reactive-ot. TODO a hibás jelszó kezeklését megvalósítani!!!
import { http } from '@/components/utils/http';
import { useUserStore } from '../stores/users.js'
import { RouterLink} from "vue-router";
import router from '../router/index';
import { Field, Form, ErrorMessage } from 'vee-validate'; // a mezők/adatok validálásához
import * as yup from 'yup';
import ErrorModal from "@/components/layouts/ErrorModal.vue"; // A felugró ablak komponens

const userStore = useUserStore()
const errorModal = ref(null);
const loginStatus = ref('')

const schema = yup.object ({
  email: yup.string().required('Kötelező kitölteni!').email('Helyes email címet kell megadni!'),
  password: yup.string().required('Kötelező kitölteni!'),
  
});

const user = ref({
  email: '',
  password: ''
});

const loginUser = async () => {
  try {
    const response = await http.post('login', user.value);
    userStore.user = response.data
    // router.push('/game') -ideiglenesen félretéve 
    console.log('Login successful!', response.data);
    loginStatus.value = 'success';
    router.push('/')

  } catch (error) {
    loginStatus.value = 'error';
    errorModal.value.displayError(error.response.data.error); //ha a catch ág fut le, meghívjuk ezt a Modalt, és kiíratjuk a hibát
    console.error('Error during login:', error);
    // alert('Login failed! Please check your credentials.'); 
    console.error('Error during registration:', error.response.data);
  }
};

onMounted(() => {
  console.log(userStore);
});

</script>

<template>
<div class="container">
    <div class="row">
      <div class="col-md-4 offset-md-4">
        <div class="card my-5">
          <Form class="card-body cardbody-color p-lg-5" @submit="loginUser" :validation-schema="schema">
            <div class="text-center">
              <h3>Bejelentkezés</h3>
              <img src="../img/questionm.jpg" class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
                width="200px" alt="profile">
            </div>
            <div class="mb-3">
              <Field name="email" type="text" class="form-control" id="email" v-model="user.email" 
                placeholder="Email"/>
              <ErrorMessage name="email" as="div" class="alert alert-danger m-1"/>
            </div>
            <div class="mb-3">
              <Field name="password" type="password" class="form-control" id="password" v-model="user.password" placeholder="Jelszó"/>
              <ErrorMessage name="password" as="div" class="alert alert-danger m-1"/>
            </div>
            <div class="text-center"><button type="submit" class="btn btn-color px-5 mb-5 w-100">Bejelentkezés</button>
              <ErrorModal ref="errorModal" /></div>
            <div  class="form-text text-center mb-5 text-dark">Nincs regisztrációd? 
              <router-link to="/register" class="text-dark fw-bold">Regisztrálj!</router-link>
            </div>
          </Form>
        </div>

      </div>
    </div>
  </div>
</template>

<style scoped>
.btn-color{
  background-color: #0e1c36;
  color: #fff;
}

.profile-image-pic{
  height: 100px;
  width: 100px;
  object-fit: cover;
}

.cardbody-color{
  background-color: #b1ceec; 
}

a{
  text-decoration: none;
}
</style> 
