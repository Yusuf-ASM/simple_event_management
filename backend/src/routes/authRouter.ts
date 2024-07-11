import { Router } from "express";
import * as backend from "../backend/authBackend";

export const auth = Router();
/* 
Request:
{
  username: String
  password: String
}

Response:
 - Code 200 user is registered successfully  {token: token, _id: _id, name: name }
 - Code 400 if your request body is missing something
 - Code 500 Db error or server error
 - Code 401 Wrong credentials 
*/

auth.post("/login", async (req, res) => {
  await backend.loginUserBackend(req, res);
});