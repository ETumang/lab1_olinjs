//require my modules
var path = require("path");
var Page = require(path.join(__dirname,"../models/models")).page;

var pages = {};

pages.showEditable = function(req,res){
	var id = req.body.id;
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
	    		id = page._id;

	    		Page.findOne({"_id":id}).exec(function (err, toEditPage) {

					if (err) {
						return console.log ("Something broke");
					}
					else {
						res.render('editForm',{
							title:toEditPage.title,
							content:toEditPage.content,
							pageID:id
						})
					}
	    		})
	    	}	
		})	
	}
}

pages.editPageSubmit = function(req,res){

	var newTitle = req.body.newPageTitle;
	var newContent = req.body.newPageContent;
	var links = [];

	Page.findOne({'_id': req.body.newPageID}).exec(function (err, toChangePage) {
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
		res.json({id:req.body.newPageID});
	})
}

pages.showPage = function(req,res){
	Page.findOne({'_id': req.body.id}).exec(function (err, toShowPage)  {
		if (err) {
			res.send ("There was an error!");
			console.log("err: " + err);
		}
		else{
			res.render('contentPage'
				// id:req.body.id,
				// title:toShowPage.title,
				// content:toShowPage.content,
				// links: toShowPage.links
				)
		}
	})
}
module.exports = pages;
