const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./server/routes/auth");
// const userRouter = require("./servers/routes/user"); 

const auth = require('./middlewares/auth'); 
const userRouter = require("./routes/user");

const PORT = 4000;
const app = express();

const DB = ""

app.use(express.json());

app.use(authRouter);
// app.use(adminRouter);
// app.use(userRouter);



mongoose.connect(DB).then(() => {
    console.log("Connection successful");
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected Port ${PORT}`);
});



