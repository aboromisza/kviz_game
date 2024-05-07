<script>
import { RouterLink, useRouter} from "vue-router";
import {useUserStore} from '../../stores/users'
export default {
    data() {
        return {
            toggleValue: true,
            isAdmin: false,
            userStore : useUserStore()
            
            };
        },
        methods: {
            
        reloadPage() {
        window.location.reload();
        },
 
        onTest(){
             alert('Alert Test')
        },
        onDark(){
          
          if(this.toggleValue) {
              document.querySelector('html').setAttribute('data-bs-theme', 'dark');
          }
          else {
            document.querySelector('html').setAttribute('data-bs-theme', 'light');
              }
          this.toggleValue = !this.toggleValue
          
            },
    }
}
</script>

<template>

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid justify-content-center">
            <img alt="Vue logo" class="logo" src="../../img/node.png" width="45" height="45" />
            <img alt="Vue logo" class="logo" src="../../img/mysql1.png" width="45" height="45" />
            <img alt="Vue logo" class="logo" src="../../assets/logo.svg" width="45" height="45" />
            <img alt="Bootstrap logo" class="logo" src="../../assets/bootstrap.png" width="65" height="45" />
            
            <router-link to="/" class="nav-link" >Home</router-link>
            <router-link to="/" ><img alt="QuestionMark" class="logo" src="../../assets/questionm.jpg" width="45" height="45" /></router-link>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <router-link to="/game" class="nav-link"  >Játék</router-link> 
                    </li>
                    
                    
                    
                    <li class="nav-item" v-if="userStore.user.isAdmin">
                        <router-link to="/database" class="nav-link"    >Adatbázis</router-link> 
                    </li>
                    
                    <li class="nav-item">
                        <router-link to="/about" class="nav-link"  >Rólunk</router-link> 
                    </li>
                    
                    <li class="nav-item">
                        <router-link to="/cards" class="nav-link"  >Ismeretterjesztés</router-link> 
                    </li>
                </ul>
                <form class="d-flex gap-3" role="search">
                    <router-link to="/game"><button v-if="(userStore.user.name)" class="btn btn-info" >Játék kezdése</button></router-link> 
                    <router-link to="/game" ><button v-if="(userStore.user.name)" class="btn btn-danger "  @click="reloadPage">Kilépés</button></router-link> 
                    <img alt="QuestionMark" class="logo" src="../../img/day_night_1.png" @click="onDark" width="50" height="50" />
                    
                    <router-link to="/login"><button class="btn btn-secondary" router-link to="/login"   >Bejelentkezés</button></router-link>
                    <router-link to="/register"><button class="btn btn-warning">Regisztráció</button></router-link>
                </form>
            </div>
        </div>
    </nav>
   
</template>

<style scoped>
.nav-link {
  font-size: x-large;
}
img {
    margin-right: 3px;
    margin-left: 3px;
} 
</style>