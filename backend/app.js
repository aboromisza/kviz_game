import express from 'express'
import { getQuestions, getQuestion, createQuestion, deleteQuestion, updateQuestion, getScores, getUsers, 
    registerUser,  loginUser, createScore,  deleteScore, deleteUser} from './database.js'
import cors from 'cors';
import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import {createTokens} from './JWT.js';


const app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(cookieParser());
app.get('/questions', async (req,res) => {
    const questions = await getQuestions()    
    res.send(questions)
})

app.get('/questions/:id', async (req, res) => {
   const id = req.params.id
   const question = await getQuestion(id)
    res.send(question)
})

app.post("/questions", async (req, res) => {
    const { name, imagePath, answer1, answer2, answer3 } = req.body
    const question = await createQuestion(name, imagePath, answer1, answer2, answer3)
    res.status(201).send(question)
})

app.put("/questions/:id", async (req, res) => {
    const id = req.params.id;
    const { name, imagePath, answer1, answer2, answer3 } = req.body;

    try {
        const updatedQuestion = await updateQuestion(id, name, imagePath, answer1, answer2, answer3);
        res.status(200).send(updatedQuestion);
    } catch (error) {
        console.error('Hiba a kérdés frissítése során:', error);
        res.status(500).send('Nem sikerült frissíteni a kérdést.');
    }
});

app.delete('/questions/:id', async (req, res) => {
    const id = req.params.id
    const question = await deleteQuestion(id)
    res.status(200).send("Kérdés sikeresen törölve.");

 })

 
app.delete('/user/:id', async (req, res) => {
    const id = req.params.id
    const user = await deleteUser(id)
    res.status(200).send("A felhasználó sikeresen törölve.")

 })

 app.delete('/score/:id', async (req, res) => {
    const id = req.params.id
    const score = await deleteScore(id)
    res.status(200).send("Kérdés sikeresen törölve.");

 })

 app.delete('/user/:id', async (req, res) => {
    const id = req.params.id;
    await deleteUser(id);
    const users = await getUsers();
    res.status(200).send(users);
}); 


 app.get('/users', async (req,res) => {
    const users = await getUsers()    
    res.send(users)
})
 
app.post("/registration", async (req, res) => {
    const { name, email, password, isAdmin} = req.body
    try {
        const newUser = await registerUser(name, email, password, isAdmin)
        res.status(201).send('Sikeres regisztráció')
        
    } catch (error) {
        console.error('Hiba a kérés során:', error);
        res.status(500).send({ error: error.message }); // A hibaüzenetet elküldjük a kliensnek
    }

})
 
app.post("/login", async (req, res) => {
    const { email, password } = req.body;
    try {
        const lUser = await loginUser(email, password);
        
        const accessToken = createTokens(lUser) 
        res.cookie('accestoken', accessToken, {
            maxAge: 60 * 60 * 24 * 15 * 1000,
        });
        res.status(201).send(lUser);
    } catch (error) {
        console.error('Hiba a kérés során:', error);
        res.status(500).send({ error: error.message }); // A hibaüzenetet elküldjük a kliensnek
    }
});

app.post("/scores", async (req, res) => {
    const {score, name} = req.body
    const newScore = await createScore(score, name)
    res.status(201).send(newScore)
})

app.get('/scores', async (req,res) => {
    const scores = await getScores()    
    res.send(scores)
})

 app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).send('Valamilyen bosszantó ismeretlen hiba lépett fel')
}) 

app.listen(3000, () => {
    console.log(`A szerver fut a következőn:  http://localhost:3000`)
})