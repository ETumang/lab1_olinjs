var mongoose = require("mongoose");
var Schema = mongoose.Schema;

var PageSchema = new Schema({
	title: String,
	content: String
});

var LinkSchema= new Schema ({
	links: [String]
})


module.exports.page = mongoose.model("Page", PageSchema);
module.exports.linkList=mongoose.model("Links", LinkSchema);