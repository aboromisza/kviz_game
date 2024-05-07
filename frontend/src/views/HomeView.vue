<template>
  <div class="container">
  
      <div class="row mt-5">
  <div class="col-md-6 mt-5 col-12">
      
      <h1>Igazán ismered a világunkat?</h1>
      <br>
      <h5><i class="glyphicon glyphicon-cloud" style="font-size:36px;"></i>
        Jártál már mindenfelé, néztél már rengeteg ismeretterjesztő filmet, kisujjadban vannak az emberiség minden művészeti és építészeti alakotásai?
        Tedd próbára magad, hogy mennyire ismered őket!</h5>
        <br>
           <h5>Utazz velünk körbe a világon, ugrálj a térben és az időben, és ismerd fel, mit ábrázolnak a képek.
            Játékunk célja hogy szórakoztasson, emlékeket idézzen fel, ötleteket adjon utazásokhoz, és oktasson ezzel a kvízzel a világon található csodákról.
           </h5>
           <h5>Képek, szobrok, helyszínek, emberek, múlt és jelen, engedd szabadon az elmédet, és tedd próbára magad a játékunkban.
           <br><br> Kellemes kikapcsolódást kívánunk a játékunkban!
           </h5>
           <div class="col-6 mt-5">
    
     <br>
  </div>
</div>
  <div class="col-md-6 mt-5 col-12">
        
     <br>     
  
      <div class="d-flex justify-content-center mt-5 " id="carousel">
           <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner text-center">
      <div class="carousel-item active text-center">
        <img src="../img/1.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="../img/3.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="../img/2.jpg" class="d-block w-100" alt="...">
      </div>
      </div>
      </div>
  </div>
      
      </div>
      
    </div>
  </div>
  <br><br>
  </template>
  
  <script>
  export default {
    data() {
      return {
       
      };
    }
  };
  
  </script>
  
  <style scoped>
  #carousel{
    max-width: 100%;
    max-height: 100%; 
   
  }
  img{ 
 
 width: 100%; 
 height: 300px;
border-radius: 1rem;
margin-bottom: 1rem;
 overflow: hidden;
 pointer-events: none;
 
}
  </style>