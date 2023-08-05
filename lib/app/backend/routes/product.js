const express = require("express");
const admin = require("../middleware/adminmiddle");
const {Product} = require("../models/productmodel");
const auth = require("../middleware/authmiddle");

const productRouter = express.Router();


productRouter.post("/add-product" , admin ,async (req , res)=>{
    try{
        const {product_name , product_detail , product_price , product_quantity , product_category, images} = req.body;

    let product = new Product({
        product_name,
        product_detail,
        product_price,
        product_quantity,
        product_category,
        images,

    });

    product = await product.save();
    res.json(product);
    } catch(e){
        res.status(400).json({error: e.message});
    }
});


// GETTING PRODUCT BASED ON CATEGORY


productRouter.get("/categoryproduct" , auth , async (req , res) =>{
    try{
        const product_category = req.query.product_category;
        const product = await Product.find({product_category : product_category});

        res.json(product);



    } catch(e){
        res.status(500).json({error : e.message});
    }
});


// GETTING DATA BASED ON SEARCH
 productRouter.get("/product/:productname" , auth , async (req , res) =>{
    try{
       
    let product = await Product.find({product_name: {$regex:  req.params.productname , $options: "i"}});
    res.json(product);
    } catch(e){
        res.status(400).json({error: e.message});
    }
 });
module.exports = productRouter;
