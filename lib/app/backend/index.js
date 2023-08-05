//PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const AuthRouter = require("./routes/auth");
const auth = require("./middleware/authmiddle");
const productRouter = require("./routes/product");
const AdminRouter = require("./routes/admin");
const userRouter = require("./routes/user");
const orderRouter = require("./routes/order");


//INITIALIZING THE PORT
const PORT = 3001;


//CONNECTION OF DATABASE
mongoose.connect("mongodb+srv://ursfan8102003:Merch123@cluster0.mfzruyo.mongodb.net/?retryWrites=true&w=majority").then(()=>{
    console.log("DataBase Connected Successfully 🚀")
}).catch((e)=>{
    console.log("We Got Error" + e);
})


//INITIALIZING THE APP
const app = express();
app.use(express.json());
app.use(express.urlencoded({extended: true}));


//USING THE MIDDLEWARES
app.use(express.json());
app.use(AuthRouter);
app.use(auth);
app.use(productRouter);
app.use(AdminRouter);
app.use(userRouter);
app.use(orderRouter);



//STARTING THE SERVER
    app.listen(PORT , (req,res)=>{
        console.log(`Server is Working at ${PORT}`);
    });
