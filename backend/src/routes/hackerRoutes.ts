import { Router } from "express";
import * as backend from "../backend/hackerBackend";
import { authorize_express } from "../backend/authBackend";

export const hacker = Router();

/* 
Headers:
_id
token

Response:
 - Code 200 
    {
      _id: Chat _id,
      sender_id: Sender id,
      title: Chat title,
      last_message: Last message in a chat,
    }
 - Code 400 if your request is missing something
 - Code 403 Wrong credentials 
*/
hacker.use((req, res, next) => {
  authorize_express(req, res, next);
});

hacker.get("/:id", async (req, res) => {
  await backend.getHackerBackend(req, res);
});

/* 
Headers:
_id
token

Prams:
/chat_id

Response:
 - Code 200 returns Array of messages [sender,message] if sender = 0 then it is user, 1 is the bot
 - Code 400 if your request is missing something
 - Code 404 Not found
 - Code 403 Wrong credentials 
*/

hacker.put("/:id/check-list", async (req, res) => {
  await backend.updateHackerBackend(req, res);
});
