const jwt = require("jsonwebtoken");
const User = require("../models/user");


const auth =  async( req , res , next)=>{
try{
    const token = req.header("x-auth-token");
    if(!token) {
        res.status(401).json({msg:"Token Not found"});
    }
    const verified = await jwt.verify(token , "securetoken");
    if(!verified) {
        res.status(400).json({msg:"Invalid Token, Access Denied"});
    }

    req.user = verified.id;
    req.token = token;
    next();
} catch(e){
    res.status(500).json({error:e.message});
}
}
module.exports = auth;