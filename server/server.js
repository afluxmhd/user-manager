const express = require('express')
const dotenv = require('dotenv')
const morgan = require('morgan')
const bodyparser = require('body-parser')
const path = require('path')
const connectDB = require('./server/database/connection')



dotenv.config({path:'config.env'})

const app = express()

const PORT = process.env.PORT


//log request
app.use(morgan('tiny'))

//mongoDB Connection
connectDB()

//parse request to body-parser //web
app.use(bodyparser.urlencoded({ extended : true}))

//parse request to body-parser //mobile
app.use(bodyparser.json());


app.use(express.static('public'));


//set view engine
app.set('view engine','ejs')
//app.set('views',path.resolve(__dirname,"views/ejs"))

//load assets
app.set('/css',express.static(path.resolve(__dirname,"assets/css")))
app.set('/img',express.static(path.resolve(__dirname,"assets/img")))
app.set('/js',express.static(path.resolve(__dirname,"/assets/js")))

//load router
app.use('/',require('./server/routes/router'))


app.listen(PORT,()=>{
    console.log(`Server is running on http://localhost:${PORT}`)
})