<script setup>
import { ref } from 'vue';
import { reactive } from "vue"; // TODO erre át kell alakítani az objektum figyelését
import { http } from '@/components/utils/http';
import { RouterLink} from "vue-router";
import { Field, Form, ErrorMessage } from 'vee-validate';
import * as yup from 'yup';
import ErrorModal from "@/components/layouts/ErrorModal.vue"; // A felugró ablak komponens

const schema = yup.object ({
  name: yup.string().required('Kötelező kitölteni').min(3).label('A nevet meg kell adni!'),
  email: yup.string().required('Kötelező kitölteni').email('Helyes email címet kell megadni!'),
  password: yup.string().required('Kötelező kitölteni').min(8),
  passwordConfirm: yup.string().required('Kötelező kitölteni').oneOf([yup.ref('password')], 'A jelszavaknak meg kell egyezniük')
});

const newUser = ref({
  name: '',
  email: '',
  password: '',
  passwordConfirm: '',
  isAdmin: false
});
const errorModal = ref(null);

const registerUser = async () => {
  try {
    const response = await http.post('registration', newUser.value);
    const responseData = response.data; // A válasz adatai
    errorModal.value.displayError(response.data);
    router.push('/');
    
  } catch (error) {
    errorModal.value.displayError(error.response.data.error); //ha a catch ág fut le, meghívjuk ezt a Modalt, és kiíratjuk a hibát
    newUser.value = response.data
    console.error('Error during registration:', error.response.data);
        
  }
};

</script>

<template>
  
  <div class="container">
    <div class="row">
      <div class="col-md-4 offset-md-4">
        <div class="card my-5">
          <Form class="card-body cardbody-color p-lg-5" @submit="registerUser" :validation-schema="schema">
            <div class="text-center">
              <h3>Regisztráció</h3>
              <img src="../img/questionm.jpg" class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
              width="200px" alt="profile">
            </div>
            <div class="mb-3">
              <Field name="name" type="text" class="form-control" id="name" v-model="newUser.name"  
              placeholder="Név"/>
              <ErrorMessage name="name" as="div" class="alert alert-danger m-1"/>
            </div>
            <div class="mb-3">
              <Field name="email" type="email" class="form-control" id="email" v-model="newUser.email" 
              placeholder="Email"/>
              <ErrorMessage name="email" as="div" class="alert alert-danger m-1"/>
            </div>
            <div class="mb-3">
              <Field name="password" type="password" class="form-control" id="password" v-model="newUser.password" 
              placeholder="Jelszó"/>
              <ErrorMessage name="password" as="div" class="alert alert-danger m-1"/>
            </div>
            <div class="mb-3">
              <Field name="passwordConfirm" type="password" class="form-control" id="passwordConfirm" v-model="newUser.passwordConfirm" placeholder="Jelszó újra"/>
              <ErrorMessage name="passwordConfirm" as="div" class="alert alert-danger m-1"/>
            </div>
            <div class="text-center"><button type="submit" class="btn btn-color px-5 mb-5 w-100">Regisztráció</button>
            <ErrorModal ref="errorModal" /></div>
            <div id="emailHelp" class="form-text text-center mb-5 text-dark">Már van regisztrációd? 
              <router-link to="/login" class="text-dark fw-bold"> Lépj be itt!</router-link>
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