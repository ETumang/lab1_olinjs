//import npm packages
var express = require('express');
var path = require("path");
var logger = require("morgan");
var cookieParser = require("cookie-parser");
var bodyParser = require("body-parser");
var exphbs = require("express-handlebars");
var mongoose = require("mongoose");

var app = express();

//require my modules
var pages = require("./routes/pages");

//setup
var PORT = process.env.PORT || 3000;
var mongoURI = process.env.MONGOURI || "mongodb://localhost/test";

app.engine("handlebars", exphbs({defaultLayout: "main.handlebars"}));
app.set("view engine", "handlebars");

//setting up npm packages
app.use(logger("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

//routes!
app.post("/editPageSubmit", pages.editPageSubmit)
app.get("/",pages.home);
app.get("/article/:id", pages.showPage);
app.get("/makeNew", pages.makeNew);

//connect to mongoose
mongoose.connect(mongoURI);

app.listen(PORT, function(){
  console.log("Application running on port:", PORT);
});

