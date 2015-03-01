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
	    		console.log("Before finding: "+ id)
	    		console.log(page._id === id)

	    		Page.findOne({"_id":id}).exec(function (err, toEditPage) {
					console.log("page: "+toEditPage);
					console.log(id)
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

/*	Page.findOne({"_id":id}).exec(function (err, toEditPage) {
		console.log("page: "+toEditPage);
		console.log(id)
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
	})*/

//}

pages.editPageSubmit = function(req,res){

	var newTitle = req.body.newPageTitle;
	var newContent = req.body.newPageContent;
	var links = [];

	console.log("ID" + req.body.newPageID);

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
		res.json({id:req.body.newPageID});
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
