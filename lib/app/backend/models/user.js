const mongoose = require("mongoose");
const { productSchema } = require("./productmodel");

//CREATING THE SCHEMA FOR AUTHENTICATION

const userSchema = mongoose.Schema({
    username:{
        type:String,
        trim:true,
    },
    email:{
        type:String,
        trim:true,
        validate:{
            validator :(value)=>{
                var emailRegex = /^[-!#$%&'*+\/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&'*+\/0-9=?A-Z^_a-z`{|}~])*@[a-zA-Z0-9](-*\.?[a-zA-Z0-9])*\.[a-zA-Z](-?[a-zA-Z0-9])+$/;
                return value.match(emailRegex);
            }
        }
    },
    password:{
        type:String,
        trim:true,
    },
    confirmpassword:{
        type:String,
        trim:true,
    },
    type:{
        type:String,
    },
    cart:[
        {
            product : productSchema,
            quantity : {
                type:Number,
            }
        }
    ]
});

const User = mongoose.model("User" , userSchema);

module.exports = User;
