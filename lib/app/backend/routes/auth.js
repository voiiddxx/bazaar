const express = require("express");
const User = require("../models/user");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const auth = require("../middleware/authmiddle");
const AuthRouter = express.Router();

//API FOR REGISTERING THE USER
AuthRouter.post("/register" , async (req,res)=>{
   try{
    const {username , email , password , confirmpassword , type} = req.body;

    //CHECKING IF USER ALREADY PRESENT OR NOT
        const ExistingUser = await User.findOne({email});
    
        if(!ExistingUser){
            if(password == confirmpassword){
                const hashpassword = await bcrypt.hash(password , 10);
                const hashconfirmpassword = await bcrypt.hash(confirmpassword , 10);
    
                let user = new User({
                    username,
                    email,
                    password : hashpassword,
                    confirmpassword: hashconfirmpassword,
                    type,
                });
    
                user = await user.save();
    
                res.status(200).json(user);
            }
            else{
                res.status(401).json({msg: "Confirm Password did not matched"});
            }
        }else{
            res.status(500).json({msg : "User is Already Present With this email"});
        }
   } catch(e){
    res.status(401).json({error : e.message});
   }
});






// LOGIN API FOR ALL THE USERS


AuthRouter.post("/login" , async (req , res)=>{
    try{
        const {email , password} = req.body;

    const Exist = await User.findOne({email});

    if(Exist){
        const isMatch = await bcrypt.compare(password , Exist.password);

        if(isMatch){
            const token = await jwt.sign({id: Exist._id}, "securetoken");
            console.log(token);
            res.status(200).json({token , ...Exist._doc});
        } else{
            res.status(401).json({msg : "Invalid password"});
        }
    } else{
        res.status(401).json({msg: "Email Adress Invalid"});
    }
    } catch(e){
        res.status(500).json({error:e,message});
    }
});


//CHECKING FOR USER IS VALID OR NOT USING JWT TOKEN

AuthRouter.get("/isValid" , async (req , res) =>{
  try{
    const token = req.header("x-auth-token");
    if(!token)  return res.json(false);
    const verify = await jwt.verify(token , "securetoken");
    if(!verify) return res.json(false);
    const user = await User.findById(verify.id);
    if(!user) return res.json(false);
    return res.json(true);
  } catch(e){
    res.status(404).json({error:e.message});
  }
    
});



//GETTING DATA OF THE VERIFIED USER

AuthRouter.get("/getuser" , auth, async (req , res) =>{
    try{
        const user = await User.findById(req.user);
        res.json({...user._doc , token: req.token});
        
    } catch(e){
        res.status(500).json({error:e.message});
    }
})


module.exports = AuthRouter;
