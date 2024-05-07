// import {sign, verify} from 'jsonwebtoken';
import jwt from 'jsonwebtoken';
const {sign, verify} = jwt;
export function createTokens (user) {
    /* console.log(user) */
    const accessToken = sign ({name: user.name, id: user.id}, "jwtsecretusersecrettoken", {


    });
    return accessToken;

};


