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
  await db.createIndexes();
  console.log("Running: " + PORT);
  console.log(utility.getDate(true));
});
