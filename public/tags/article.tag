<article>
		<div id="sidebar">
			<h1>{topicTitle}</h1>

			
		</div>

	<div id="changing">

		<div id="title" if={contentable}>
			<h1>{title}</h1>
		</div>

		<div id="content" if={contentable}>
			<p>{content}</p>
		</div>

		<div id = "editButton" if={contentable} onclick={ clickedEdit } >
			<button type = "button">Edit</button>
		</div>

		<div id="form" onsubmit={ add } if={editable}>
			<form id="editPageInput">
				<div id="titleInput" >
					<label for="pageTitle">Title of Page</label>
				    <input id="pageTitle" type="text" value="{title}" name="{pageID}" onkeyup={ edit }> 
			    </div>   

			    <div id="contentInput">
					<label for="pageContent">Content of Page</label>
				    <input id="pageContent" type="text" value="{content}">  
				</div>

			    <input type="submit" id="submit" value="Submit"/>

			</form>

		</div>
	</div>

	<script>
	var self=this;
	this.title = opts.title;
	this.content=opts.content;

	this.topicTitle=opts.topicTitle;
	this.pageID=opts.pageID;

	this.contentable = opts.contentable;
	this.editable = opts.editable;
	this.topicable = opts.topicable;

	var hashchange = function (type, ID, action) {

		if (action==="content"||action==="new"){
			$.get("article/"+ID).done(function (data, err) {
				console.log(data);
				this.contentable = true;
				this.editable = false;
				self.update(data);

			}).error (function (status, err) {
				console.log("status: "+status);
			})
			this.contentable = true;
			this.editable = false;
			self.update
		}


		if (action==="edit"||action==="new"){
			this.contentable = false;
			this.editable=true;
			self.update();
		}

	};

		riot.route.exec(hashchange);
		riot.route(hashchange);

		clickedEdit(e){
	 		riot.route("article/"+opts.pageID+"/edit")
		}

		add(e){

    		var $form=$("#form");

			var title = $form.find("#pageTitle").val();
		    var content = $form.find("#pageContent").val();
		    var pageID = $form.find("#pageTitle").attr("name");

			$.post("editPageSubmit", {
			    newPageTitle: title,
			    newPageContent: content,
			    newPageID: pageID
			})
			.done(onSuccess).error(onError);

//TODO- onSuccess isn't being called, so you have to refresh to see new data
      	var onSuccess = function(data, status) {
      		console.log("onsuccess")
			riot.route("article/"+pageID+"content")
			var id = data._id;
			self.update(data);
		}

		var onError = function(data, status) {
		  console.log("status", status);
		  console.log("error", data);
		}
	}

	</script>

</article>