//require my modules
var path = require("path");
var Page = require(path.join(__dirname,"../models/models")).page;

var pages = {};

pages.showEditable = function(req,res){
	var id = req.id
	if (!id){
		page = new Page ({
			content:"",
			title:"",
			links:[]
		});
		page.save(function (err) {
	    	if (err) {
	    		console.log("Something broke!");
	    	}
	    	else {
	    		id = page.id;
	    	}
		});
	}

	var toEdit = Page.findById(id).exec(function (err, toEditPage) {
		if (err) {
			return console.log ("Something broke");
		}
		else {
			res.render('editForm',{
				title:toEdit.title,
				content:toEdit.content,
				pageID:id
			})
		}
	});

}

pages.editPageSubmit = function(req,res){

	var newTitle = req.body.newPageTitle;
	var newContent = req.body.newPageContent;
	var links = [];

	console.log(req.body.newPageID);

	Page.findOne({'_id': req.body.newPageID}, function (err, toChangePage) {
		if (err){
			res.send ("There was an error!");
			console.log("err: " + err);
		}

		else{
			toChangePage.title = newTitle;
			toChangePage.content=newContent;
			toChangePage.links = links;
			toChangePage.save();
		}
		res.end();
	})
}

pages.showPage = function(req,res){
	Page.findOne({'_id': req.id}, function (err, toShowPage) {
		console.log(req.id)
		if (err) {
			res.send ("There was an error!");
			console.log("err: " + err);
		}
		else{
			console.log(toShowPage);
			res.render('contentPage',{
				id:req.id,
				title:toShowPage.title,
				content:toShowPage.content,
				links: toShowPage.links
			})
		}
	})
}
module.exports = pages;
