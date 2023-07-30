var Userdb = require('../model/model')

//create and save new user
exports.create = (req,res)=>{
    //validate request
    if(!req.body){
        res.status(400).send({message:'Content cannot be empty'})
        return
    }
    console.log(req.headers)
    //new user
    const user = Userdb({
        name: req.body.name,
        email:req.body.email,
        gender:req.body.gender,
        status:req.body.status,
    })
    //save user in the database
    user
     .save(user)
     .then(data =>{
        if(req.headers['user-agent'].includes('Mobile')){
            res.send(data) //for mobile
        }else{
            res.redirect('/') //for web
        }
       
     })
     .catch(err=>{
        res.status(500).send({
            message : err.message||"Some Error Occured while creating a create operation"
        })
     })
}

//retrieve and return all users
exports.find=(req,res)=>{
    if(req.query.id){
        const id = req.query.id

        Userdb.findById(id).then(data=>{
            if(!data){
                res.status(404).send({message:"Not found user with id "+id})
            }else{
                res.send(data)
            }
        }).catch(err=>{
            res.status(500).send({message:"Error retrieving user id "+id})
        })
    }else{
        Userdb.find().then(user=>{
            res.send(user)
        })
        .catch(err=>{
            res.status(500).send({message: err.message||"Error occured by retrieving user"})
        })
    }
}

//Update a new identified user by user id
exports.update=(req,res)=>{
    if(!req.body){
        return res.status(400).send({message:"Data to update cannot be empty"})
    }

    const id = req.params.id
    Userdb.findByIdAndUpdate(id, req.body,{useFindAndModify: false}).then(data=>{
        if(!data){
            res.status(404).send({message:`Cannot update user ${id}. Maybe User not found`})
        }else{
            res.send(data)
        }
    })
    .catch(err=>{
         res.status(500).send({message: 'Error update user information'})
    })
}

//Delete a user with specific user id in the requeste
exports.delete=(req,res)=>{
    const id=req.params.id

    Userdb.findByIdAndDelete(id).then(data=>{
        if(!data){
            res.status(404).send({message: `Cannot delete with id ${id}. Maybe id is wrong`})
        }else{
            res.send({
                 message:"User was deleted successfully"
            })
        }
    }).catch(err=>{
        res.status(500).send({message: "Couldn't delete User id="+id})
    })
}
