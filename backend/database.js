import mysql from 'mysql2'
import dotenv from 'dotenv'
import bcrypt from 'bcrypt'
dotenv.config()

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise()

export async function getQuestions() {
    const [rows] = await pool.query("SELECT * FROM questions")
    return rows
}

export async function getQuestion(id) {
    const [rows] = await pool.query(`
    SELECT * FROM questions
    WHERE id = ?`, [id])
    return rows }
    
export async function createQuestion(name, imagePath, answer1, answer2, answer3) {
   const [result] = await pool.query(`
    INSERT INTO questions (name, imagePath, answer1, answer2, answer3)
    VALUES (?, ?, ?, ?, ?)
    `, [name, imagePath, answer1, answer2, answer3])
    const id = result.insertId
    return getQuestion(id)
}

export async function deleteQuestion(id) {
    const [rows] = await pool.query(`
    DELETE FROM questions
    WHERE id = ?`, [id])
    return
   }

export async function updateQuestion(id, name, imagePath, answer1, answer2, answer3) {
    try {
        await pool.query(`
            UPDATE questions
            SET name = ?, imagePath = ?, answer1 = ?, answer2 = ?, answer3 = ?
            WHERE id = ?
        `, [name, imagePath, answer1, answer2, answer3, id]);
        
        // Sikeres frissítés esetén visszaadjuk az új kérdést
        return getQuestion(id);
    } catch (error) {
        console.error('Hiba a kérdés frissítése során:', error);
        throw new Error('Nem sikerült frissíteni a kérdést.');
    }
}
    
    export async function deleteUser(id) {
        try {
            const [rows] = await pool.query(`
        DELETE FROM users
        WHERE id = ?`, [id])
        return
        } catch (error) {
                console.error('Hiba a felhasználó törlése során:', error);
                throw new Error('Nem sikerült törölni a felhasználót.');
            }
        }
   
        
export async function createScore(score, name) {
    const [result] = await pool.query(`
     INSERT INTO scores (score, name)
     VALUES (?, ?)
     `, [score, name])
         return getTopScores()
        }

export async function getScores() {
    const [rows] = await pool.query("SELECT * FROM scores")
    return rows
}
export async function getTopScores() {
    const [rows] = await pool.query("SELECT * FROM scores ORDER BY score DESC LIMIT 10")
    return rows
}

export async function deleteScore(id) {
    const [rows] = await pool.query(`
    DELETE FROM scores
    WHERE id = ?`, [id])
    return rows
   }

export async function getUsers() {
    const [rows] = await pool.query("SELECT * FROM users")
    return rows
}

export async function getUser(id) {
    const [rows] = await pool.query(`
    SELECT * FROM users
    WHERE id = ?`, [id])
    return rows }


export async function registerUser(name, email, password, isAdmin) {
    // Ellenőrzés, hogy van-e már ilyen email címmel felhasználó az adatbázisban
    const [existingUsers] = await pool.query('SELECT * FROM users WHERE email = ?', [email]);
    if (existingUsers.length > 0) {
        // Ha már van ilyen email címmel regisztrált felhasználó, akkor dobok egy hibát, és TODO üzenni
        throw new Error('Ez az email cím már használatban van.');
    }
    if (email.endsWith('@blathy.info')) { // Ezt a konzulensünk kérte, legyen egy admin jogosultság is
         isAdmin = true    
    }
    let hashedPassword = await bcrypt.hash(password, 8);
    password = hashedPassword;
    const [result] = await pool.query(`
        INSERT INTO users (name, email, password, isAdmin)
        VALUES (?, ?, ?, ?)
    `, [name, email, password, isAdmin]);

}
export async function loginUser(email, password) {
    // Ellenőrizd, hogy van-e felhasználó az adatbázisban az adott email címmel
    const [existingUsers] = await pool.query('SELECT * FROM users WHERE email = ?', [email]);
    if (existingUsers.length === 0) {
        // Ha nem találtál felhasználót ezzel az email címmel, dobj hibát
        throw new Error('Nem található felhasználó ezzel az email címmel.');
    }

    // Ellenőrizd a jelszót
    const user = existingUsers[0];
    const passwordMatch = await bcrypt.compare(password, user.password);
    if (!passwordMatch) {
        // Ha a jelszó nem egyezik, dobj hibát
        throw new Error('Hibás jelszó.');
    }else{
        return user;
    }

}

