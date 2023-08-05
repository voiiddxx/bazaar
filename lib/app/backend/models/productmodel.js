const mongoose = require("mongoose");

const productSchema = mongoose.Schema({
    product_name:{
        type:String,
        required: true,
    },
    product_detail:{
        type:String,
        required: true,
    },
    product_price:{
        type:String,
        required: true,
    },
    product_quantity:{
        type:String,
        required: true,
    },
    product_category:{
        type:String,
        required: true,
    },
    images:[
        {
            type:String,
        }
    ]
});

const Product = mongoose.model("Product" , productSchema);
module.exports = {Product , productSchema};