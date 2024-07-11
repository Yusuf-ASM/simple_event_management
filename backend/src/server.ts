import cors from "cors";
import dotenv from "dotenv";
import express from "express";

import * as utility from "./helper/utility";
import * as db from "./helper/db";
import { auth } from "./routes/authRouter";
import { hacker } from "./routes/hackerRoutes";
import { organizer } from "helper/schema";

dotenv.config();

const PORT = process.env.PORT || "8080";
const app = express();

app.use(express.json());
app.use(cors());

// for login
app.use("/auth", auth);

app.use("/hacker", hacker);

app.get("/health", (req, res) => {
  res.send(`Server is running: ${utility.getDate(true)}`);
});

app.all("*", (req, res) => {
  res.sendStatus(404);
});

app.listen(PORT, async () => {
  // console.log(utility.hashPassword("pomato"));  
  // const hacker = {
  //   id: 15,
  //   name: "yusuf",
  //   email: "y.alsayed@nu.edu.eg",
  //   phone: "010",
  //   nationalID: "303",
  //   checkList: { attended: false, "lunch-day1": false, "lunch-day2": false },
  // };
  // const organizer: organizer = {
  //   username: "potato",
  //   password: "pomato",
  //   token: "",
  // };  
  // db.insertOrganizer(organizer);
  // db.insertHacker(hacker);
  await db.createIndexes();
  console.log("Running: 8080");
  console.log(utility.getDate(true));
});
