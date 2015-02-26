var mongoose = require("mongoose");
var Schema = mongoose.Schema;

var PageSchema = new Schema({
	title: String,
	content: String,
	links: [String]
});


module.exports.page = mongoose.model("Page", PageSchema);