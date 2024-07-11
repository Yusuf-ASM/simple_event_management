import { Request, Response } from "express";
import * as db from "../helper/db";
import dotenv from "dotenv";
import { jCheckList, jHackerID } from "../helper/schema";
import Joi from "joi";

dotenv.config();

export async function getHackerBackend(req: Request, res: Response) {
  const id = Number.parseInt(req.params.id);
  const validationResult = jHackerID.validate(id);

  if (validationResult.error === undefined) {
    res.json(await db.getHackerData(id));
  } else {
    console.log(JSON.stringify(validationResult.error.message));
    res.status(400).send({ error: validationResult.error.message });
  }
}

export async function updateHackerBackend(req: Request, res: Response) {
  const body = { ...req.body, id: req.params.id };
  const schema = Joi.object({
    id: jHackerID.required(),
    checkList: jCheckList.required(),
  });
  const validationResult = schema.validate(body);

  if (validationResult.error === undefined) {
    const id = Number.parseInt(body.id);
    const checkList = body.checkList;
    console.log({ id: id, checkList: checkList });

    res.json({ result: await db.hackerUpdateCheckList(id, checkList) });
  } else {
    console.log(JSON.stringify(validationResult.error.message));
    res.status(400).send({ error: validationResult.error.message });
  }
}
