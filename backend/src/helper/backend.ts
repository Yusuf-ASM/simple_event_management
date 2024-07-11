//okie

///////////////////////////////////////////////////////////////////////////////////////////

// export async function Backend(req: Request, res: Response) {
//   const body = req.body;

//   if (Object.keys(body).length == 0) {
//     res.status(400).send({ error: "Empty Body" });
//     return;
//   }
//   const checkingResult = utility.checkParameter({
//     body: body,
//     objectIds: ["userId","campaignId"],
//     numbers: ["quantity", "plate"],
//     strings: ["type"],
//   });

//   if (validationResult.error === undefined) {
//     let result = await db.addMeal(body);
//     console.log(result);
//     res.send(result);
//   } else {
//     console.log(JSON.stringify(validationResult.error.message));
// res.status(400).send({ error: validationResult.error.message });
//   }
// }

///////////////////////////////////////////////////////////////////////////////////////////

