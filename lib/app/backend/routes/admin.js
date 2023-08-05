const express = require("express");
const admin = require("../middleware/adminmiddle");
const {Product} = require("../models/productmodel");

const AdminRouter = express.Router();

// GETTING ALL THE PRODUCT DATA FOR ADMIN
AdminRouter.get("/getAdmindata" , admin ,async(req , res)=>{
    try{
        let product = await Product.find({});
        res.json(product);
    } catch(e){
        res.status(400).json({error:e.message});

    }
});


// API FOR DELETING THE PRODUCT BY USER

AdminRouter.post("/product-delete" , admin , async(req , res)=>{
    try{
        const {id} = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
    } catch(e){
        res.json({error : e.message});
    }
})

module.exports = AdminRouter;