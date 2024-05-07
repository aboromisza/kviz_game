<template>

    <main class="game">
        <h4>{{ headMessage }}  Játszik: <p> {{ userStore.user?.name || 'Anonymus' }} </p></h4> 
		
		<section class="quiz" v-if="onGame">
            <img oncontextmenu="return false;" class="img-question quiz" :src="questions[currentQuestion].imagePath" alt="túl könnyű lenne :)">
			<div class="quiz-info">
                <span class="question"><p>Pontszám: {{userScore }}</p></span>
                <span class="question"><p>{{ result }}</p></span>
				<span class="score">{{ currentQuestion }}/{{ questions.length }}</span>
			</div>
      
			<div class="options">
        <label class="option" :class="{ 'correct': hasError &&  one, 'wrong': hasError && !one  }" @click="processAnswer(1)" > {{ questions[currentQuestion].answer1 }}</label>
				<label class="option" :class="{ 'correct': hasError &&  two, 'wrong': hasError && !two }" @click="processAnswer(2)" > {{ questions[currentQuestion].answer2 }}</label>
				<label class="option" :class="{ 'correct': hasError &&  tree, 'wrong': hasError && !tree }" @click="processAnswer(3)" > {{ questions[currentQuestion].answer3 }}</label>
			</div>                           
		</section>
        
		<section v-else >
            <h2>Gratulálunk!! </h2>
			<p>Az eredményed: {{ userScore }} ennyi kérdésből:{{ questions.length }}</p><br>
          <p>  <button class="btn btn-success btn-lg" type="button" @click="startNewGame">Új játék</button>
            <button class="btn btn-danger btn-lg" type="button" @click="reloadPage">Kilépés</button>
            <br> <p>          <br></p>
            <h5>A legjobb eredmények:</h5></p>
         
            <div class="d-flex justify-content-between">
</div>            
            <div class="container-fluid">
      <table class="table mx-auto">
        <thead class="pt-4 table-light text-center">
           
         </thead>
<tbody class="justify-content-between" v-for="item in allScores" :key="item.id"><tr><td>{{ item.name }} </td> <td>{{ item.score }} </td> 
</tr>
</tbody>
</table>
</div>
          </section>
	</main>
   
</template>

<script setup>

import { ref, onMounted } from 'vue'
import {useUserStore} from '../stores/users.js'
import { http } from '@/components/utils/http';
const questions = ref({})
const userStore = useUserStore()
const userScore = ref(0)
const headMessage = ref('A kvíz elkezdődött')
const currentQuestion = ref(0)
const onGame = ref(false)
const allScores = ref({})
const isAnswerGood = ref(0)
const one = ref(false)
const two = ref(false)
const tree = ref(false)

const hasError = ref(false)

const getCurrentQuestion = () => {

    if(currentQuestion.value == (questions.value.length -1)){
        headMessage.value = 'A végére értél a kvíznek!'
        onGame.value = false    
        createScore()
        return;
    }
    currentQuestion.value ++
    hasError.value= false
    one.value = false
     two.value = false
     tree.value = false
    
}
const isFunctionDisabled = ref(false);
const result = ref('');
const choosenAnswer = ref('')
const resultMessage = ref('');
const startNewGame = () => {
    userScore.value =0
    hasError.value = false
    currentQuestion.value = 0
    onGame.value = true
    headMessage.value = ''
}

const processAnswer = (selectedAnswer) => { 
 choosenAnswer.value = selectedAnswer
 isAnswerGood.value = questions.value[currentQuestion.value].correctAnswerDB
console.log(isAnswerGood.value, choosenAnswer.value);
isTrue()

   if (!isFunctionDisabled.value){    //ez azért felel, hogy ne tudjon addig újra kattintani a user, amíg az új kérdés be nem töltődik
    isFunctionDisabled.value = true;
    if (selectedAnswer === isAnswerGood.value) {
    result.value = ' +1 pont';
    userScore.value += 1;

  } else {
    result.value = 'Rossz válasz!';
    
  }
  hasError.value = 'true'
  setTimeout(() => {
     resultMessage.value = userScore.value
     isFunctionDisabled.value = false;
     result.value = '';
      getCurrentQuestion();

  }, 800);

} }

const reloadPage = () => {
       window.location.reload();
       }

const isTrue = ()=> {
if (choosenAnswer.value === isAnswerGood.value ){
  if (choosenAnswer.value === 1 )
  {one.value = true
  } else if  (choosenAnswer.value === 2) {
  two.value = true }
  else {
   tree.value =true}
  }}

const newScore = ref({
  name: userStore.user?.name || 'Név nélkül',
  score: userScore
  });

const createScore = async () => {
  try {
    const response = await http.post('scores',newScore.value);
    const responseData = response.data; // A válasz adatai
    return allScores.value = responseData

     } catch (error) {
    const responseData = response.data;
    console.error('Error during score:', error, responseData);
    
  }
};

const getQuestions = async () => {
  try {
    const response = await http.get('questions');
    questions.value = response.data; // questions ref értékének beállítása a lekért adatokra
    isAnswerGood.value = questions.value[0].correctAnswerDB
  } catch (error) {
    console.error('Error getting questions:', error);
    throw error; 
  }
};

onMounted(async () => {
  try {
    await getQuestions();
    onGame.value = true    
    
    return { questions, onGame};
   } catch (error) {
    
  }
});

</script>
<style scoped>
* {
    margin: 0;
	padding: 0;
	box-sizing: border-box;
	
}

.game {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 2rem;
	height: 100vh;
}

h1 {
	font-size: 2rem;
	margin-bottom: 2rem;
}

.quiz {
	padding: 0.5rem;
	width: 100%;
	max-width: 600px;
}

.quiz-info {
	display: flex;
	justify-content: space-between;
	margin-bottom: 0.5rem;
}

.img-question { 
 
    width: 100%; 
    height: 370px;
	border-radius: 2rem;
	margin-bottom: 1rem;
    overflow: hidden;
    pointer-events: none;
		
}

.quiz-info .question {
	color: #8F8F8F;
	font-size: 1.25rem;
}

.quiz-info .score {
	font-size: 1.25rem;
}

.options {
	margin-bottom: 1rem;
	color: #fffefe;
}

.option {
	font-size: 1.25rem;
	padding: 1rem;
	display: block;
	background-color: #33aaef;
	margin-bottom: 0.5rem;
	border-radius: 0.5rem;
	cursor: pointer;
}

.option:hover {
	background-color: #3c5680;
}

.option.correct {
	background-color: #2cce7d;
}

.option.wrong {
	background-color: #ff5a5f;
}

.option:last-of-type {
	margin-bottom: 0;
}


h2 {
	font-size: 2rem;
	margin-bottom: 2rem;
	text-align: center;
}

p {
	color: #8F8F8F;
	font-size: 1.5rem;
	text-align: center;
}

.root {
    position: relative;
}

</style>
