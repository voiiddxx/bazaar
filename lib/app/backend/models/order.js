const mongoose = require("mongoose");
const { productSchema } = require("./productmodel");


const orderSchema = mongoose.Schema({
    products : productSchema,
    address:{
        type:String
    },
    userId:{
        type:String
    },
    date:{
        type:Number,
    },
    value:{
        type:Number,
        default : 0,
    }
    
});

const Order = mongoose.model("Order" , orderSchema);

module.exports = Order;