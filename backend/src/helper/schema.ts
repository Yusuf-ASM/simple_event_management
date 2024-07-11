import Joi from "joi";
import { ObjectId } from "mongodb";
import { joiCheckListChecker, joiEmailChecker, joiObjectIdChecker } from "./utility";
export type json = { [key: string]: any };

export interface hacker {
  id: number;
  name: string;
  email: string;
  phone: string;
  nationalID: String;
  checkList: { [key: string]: boolean };
}

export interface organizer {
  username: string;
  password: string;
  token: string;
}

export interface organizer_id extends organizer {
  _id: ObjectId;
}

export interface hacker_id extends hacker {
  _id: ObjectId;
}

export const jObjectId = Joi.string().trim().custom(joiObjectIdChecker);
export const jEmail = Joi.string().trim().custom(joiEmailChecker);
export const jString = Joi.string().trim();
export const jNumber = Joi.number();
export const jHackerID = Joi.number().min(1).max(999);
export const jCheckList = Joi.object().custom(joiCheckListChecker);
