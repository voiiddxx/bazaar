const express = require("express");
const auth = require("../middleware/authmiddle");
const { Product } = require("../models/productmodel");
const User = require("../models/user");
const Order = require("../models/order");
const admin = require("../middleware/adminmiddle");

const orderRouter = express.Router();

orderRouter.post("/postorder" , auth , async(req , res)=>{
   
    try {

        const {address , products} = req.body;

        let order = new Order({
            address,
            products,
            userId:req.user,
        });
        order = await order.save();
        res.json(order);
       
          } catch(e){
    res.status(500).json({error:e.message});
   }
   
});


//GETTING USER ORDERS ONLY

orderRouter.get("/getuserorder" , auth , async(req , res)=>{
    try{
        const userId = req.user;
    let orderproduct = await Order.find({userId:userId});
    res.json(orderproduct);
    } catch(e){
        res.status(500).json({error:e.message});
    }
    
});

// GETTING ORDER DATA FOR ADMIN


orderRouter.get("/admin/order/get" , admin , async (req , res)=>{
    try{
        let adminproduct = await Order.find({});
        res.json(adminproduct);
    } catch(e){
        res.status(500).json({error:e,message});
    }
});


//UPDATING THE STATUS OF ORDERED PRODUCT ONLY FOR ADMIN


orderRouter.post("/updatestatus" , admin , async (req , res)=>{
    try{
        const {id , value} = req.body;

    let order = await Order.findById(id);

    order.value = value;

    order = await order.save();
    res.json(order);
    } catch(e){
        res.status(500).json({error:e.message});
    }
});


//ROUTE FOR CANCEL THE ORDER AS USER


orderRouter.post("/delete-order" , auth , async(req , res)=>{
    try{
        const {id} = req.body;

    let order = await Order.findByIdAndDelete(id);
    res.json(order);
    } catch(e){
        res.status(500).json({error:e.message});
    }
})

module.exports = orderRouter;
