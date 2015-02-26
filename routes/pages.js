//require my modules
var path = require("path");
var Page = require(path.join(__dirname,"../models/models")).page;

var pages = {};

pages.showEditable = function(req,res){
	var id = req.id
	if (!id){
		page = new Page{
			content:"",
			title:"",
			links:[]
		}
		page.save()
		id = page.id
	}

	var toEdit = Page.findById(id)

	res.render('editForm',{
		title:toEdit.title,
		content:toEdit.content
		id:id
	})
}

pages.editPageSubmit = function(req,res){
	toChange = Page.findById(pageId)
	toChange.update({title:req.title},{content:req.content},fn);

	res.render('toChange',{
		title:toChange.title,
		content:toChange.content,
		links:toChange.links
	})

}