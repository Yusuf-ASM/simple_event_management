import { NextFunction, Request, Response } from "express";
import * as utility from "../helper/utility";
import * as db from "../helper/db";
import { jObjectId, jString, json } from "../helper/schema";
import Joi from "joi";
import dotenv from "dotenv";

dotenv.config();

export async function loginUserBackend(req: Request, res: Response) {
  const body = req.body;

  const schema = Joi.object({
    username: jString.required(),
    password: jString.required(),
  });

  let validationResult = schema.validate(body);

  if (validationResult.error === undefined) {
    let result = await db.login(body);

    if (Array.isArray(result)) {
      console.log(result);
      res.status(result[0] as number).json({ error: result[1] });
    } else {
      res.json(result);
    }
  } else {
    console.log(JSON.stringify(validationResult.error.message));
    res.status(400).json({ error: validationResult.error.message });
  }
}

export async function authorize(headers: json) {
  const validationResult = Joi.object({
    token: jString.required(),
    id: jObjectId.required(),
  })
    .unknown()
    .validate(headers);
  if (validationResult.error === undefined) {
    return await db.userToken(headers.id, headers.token);
  } else {
    console.log(JSON.stringify(validationResult.error.message));
    return false;
  }
}

export async function authorize_express(req: Request, res: Response, next: NextFunction) {
  if (await authorize(req.headers)) {
    next();
  } else {
    res.sendStatus(403);
  }
}
