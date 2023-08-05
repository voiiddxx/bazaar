const express = require("express");
const auth = require("../middleware/authmiddle");
const {Product} = require("..//models/productmodel");
const User = require("../models/user");

const userRouter = express.Router();

// GETTING ALL THE USER DATA 

userRouter.get("/getuserData" , auth , async(req,res)=>{
try{
    let product = await Product.find({});
    res.json(product);
} catch(e){
    res.status(500).json({error:e.message});
}
});

userRouter.post("/addtocart" , auth , async (req , res)=>{
    try{
        const {id} = req.body;
    let product = await Product.findById(id);
    let user = await User.findById(req.user);
   
    if(user.cart.length==0){
        user.cart.push({product , quantity:1});
    }
    let found = false;
    for(let i =0;i<user.cart.length;i++){
        if(user.cart[i].product._id.equals(product._id)){
            found = true;
        }
        else{
            found = false;
        }
    }

    if(found){
        res.status(402).json({msg:"Item is Already Present in cart"});
    } else{
        user.cart.push({ product, quantity: 1 });
    }

     user = await user.save();
     res.json(user);
    
   
    } catch(e){
        res.status(500).json({error:e.message});
    }
});

userRouter.delete("/delete-cart-product/:name" , auth , async(req , res)=>{
try{
    let user = await User.findById(req.user);
    let found = false;
    for(let i =0;i<user.cart.length;i++){
        
    if(user.cart[i].product.product_name==req.params.name){
        user.cart.splice(i , 1);
    }
    }
    user = await user.save();
    res.json(user);
} catch(e){
    res.status(500).json({error:e.message});
}
})


module.exports = userRouter;