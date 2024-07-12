import { MongoClient, ObjectId } from "mongodb";
import { hashPassword } from "./utility";
import { organizer_id, hacker, organizer } from "./schema";
import * as utility from "./utility";
import dotenv from "dotenv";
dotenv.config();

const mongoUrl = process.env.MONGOLINK as string;
const dbName = process.env.DBNAME as string;

const mongoClient = new MongoClient(mongoUrl);
let db = mongoClient.db(dbName);

const hackersCollection = db.collection("hackers");
const organizersCollection = db.collection("organizers");

export async function createIndexes() {
  await organizersCollection.createIndex("username", { unique: true });
  await hackersCollection.createIndex("id", { unique: true });
}

///////////////////////////////////////////////////////////////////////////////////////////

//okie
export async function login({ username, password }: { username: string; password: string }) {
  const query = { username: username, password: hashPassword(password) };
  const user = await organizersCollection.findOne<organizer_id>(query);
  if (user != null) {
    const token = utility.generateToken();
    const insertTokenResult = await organizersCollection.updateOne(
      { username: username },
      { $set: { token: token } }
    );
    if (insertTokenResult.acknowledged && insertTokenResult.modifiedCount == 1) {
      return { id: user._id, token: token };
    }
    return [500, "login error"];
  }
  return [401, "Wrong credentials"];
}

export async function userToken(_id: string, token: string) {
  let user = (await organizersCollection.findOne({
    _id: new ObjectId(_id),
    token: token,
  })) as organizer_id;
  return user != null;
}

export async function getHackerData(id: number) {
  return await hackersCollection.findOne({
    id: id,
  });
}

export async function hackerUpdateCheckList(id: number, checkList: any) {
  const res = await hackersCollection.updateOne(
    {
      id: id,
    },
    { $set: { checkList: checkList } }
  );
  return res.acknowledged == true && res.modifiedCount == 1;
}

export async function insertOrganizer(organizer: organizer) {
  organizer.password = hashPassword(organizer.password);
  const result = await organizersCollection.insertOne(organizer);
  return result.acknowledged == true;
}

export async function insertHacker(hacker: hacker) {
  const result = await hackersCollection.insertOne(hacker);
  return result.acknowledged == true;
}

//////////////////////////////////////////////////////////////////
