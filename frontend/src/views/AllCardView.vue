<template>
  <div class="containar m-5">
    <h3>Válassz korszakot és mélyítsd el a tudásodat.</h3>
    <br>
    <br>
<div class="row">
    <div class="card" style="width: 18rem;">
        <a href="https://vetesigimnazium.hu/anyagok/vizualiskultura/kronologikus/Oskor.pdf" target="_blank">
            <img src="/src/img/oskorCard.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <p class="card-text">Őskor</p>
                <p class="card-text">Kr.e.6millió - 3500</p>
                <p class="card-text">Az első emberfélék megjelenésétől az írásbeliségig.</p>
            </div>
        </a>
    </div>

    <div class="card" style="width: 18rem;">
      <a href="http://enciklopedia.fazekas.hu/tarsmuv/gorog.htm" target="_blank">
          <img src="/src/img/coloCard..jpg" class="card-img-top" alt="...">
          <div class="card-body">
              <p class="card-text">Ókor</p>
               <p class="card-text">Kr.e.3500 - kr.u.476</p>
              <p class="card-text">Az írásbeliség megjelenésétől a Nyugat-Római Birodalom felbomlásáig.</p>
          </div>
      </a>
    </div>

    <div class="card" style="width: 18rem;">
      <a href="https://btk.ppke.hu/storage/tinymce/uploads/old/uploads/articles/2446835/file/szakacsbelazsolt-korakozepkorimuveszet.pdf" target="_blank">
          <img src="/src/img/kozepkorCard.jpg" class="card-img-top" alt="...">
          <div class="card-body">
              <p class="card-text">Középkor</p>
               <p class="card-text">476 - 1492</p>
              <p class="card-text">Nyugat-Római Birodalom felbomlásától Amerika felfedezéséig</p>
          </div>
      </a>
    </div>

    <div class="card" style="width: 18rem;">
      <a href="https://baloghpet.com/2014/04/15/az-jkor-muvszete/" target="_blank">
          <img src="/src/img/ujkorCard.jpg" class="card-img-top" alt="...">
          <div class="card-body">
              <p class="card-text">Újkor</p>
               <p class="card-text">1492 - 1900</p>
              <p class="card-text">Amerika felfedezésétől XX.századig.</p>
          </div>
      </a>
    </div>

    <div class="card" style="width: 18rem;">
      <a href="https://muvesz.ma/szecesszio-kepzelet-forma-es-kaprazatos-szinvilag-osszhangban/" target="_blank">
          <img src="/src/img/xxSzazadCard.jpg" class="card-img-top" alt="...">
          <div class="card-body">
              <p class="card-text">Jelenkor</p>
               <p class="card-text">1900 -</p>
              <p class="card-text">xxSzazadCard</p>
          </div>
      </a>
    </div>

    <div class="card" style="width: 18rem;">
      <a href="https://youngart.hu/blog/a-modern-a-posztmodern-es-a-kortars-muveszetek-egymashoz-valo-viszonyulasa" target="_blank">
          <img src="/src/img/modernCard.jpg" class="card-img-top" alt="...">
          <div class="card-body">
              <p class="card-text">Modernkor</p>
               <p class="card-text">jelenkorunk</p>
              <p class="card-text">XXI.századtól</p>
          </div>
      </a>
    </div>
</div>
   </div>
</template>
<script>

import {http} from "@/components/utils/http.js"

export default {
  data(){
        return{
        }
  }
}
</script>

<style scoped>

.card {
  margin-bottom: 20px;
  margin-left: 140px;
  height: 400px;
  max-width: 400px;
}

h3{
  text-align: center;
}

a {
  text-decoration: none; /* Aláhúzás eltávolítása */
  color: inherit;
}

img {
  max-width: 400px;
  max-height: 200px;
  margin-top: 12px;
}
</style>
