<article>
	<div id="title" if={contentable}>
		<h1>{title}</h1>
	</div>

	<div id="content" if={contentable}>
		<p>{content}</p>
	</div>

	<div id="links" if={contentable}>
		<ul>
		    <li each="{name, i in links}">{name}
		    </li>
		</ul>
	</div>

	<div id = "editButton" onclick={ clicked }>
		<button type = "button">{buttontext}</button>
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

	<script>
	var self=this;
	this.title = opts.title;
	this.content=opts.content;
	this.links = opts.links;
	this.buttontext=opts.buttontext;
	this.pageID=opts.pageID;


	this.contentable = opts.contentable;
	this.editable = opts.editable;

	var hashchange = function (type, ID) {

		$.get("article/"+opts.pageID).done(function (data, err) {
			console.log(data);
			self.update(data);
		}).error (function (status, err) {
			console.log("status: "+status);
		})
	};

		riot.route.exec(hashchange);
		riot.route(hashchange);

		clicked(e){
	 		console.log("Triggered a switch")
			this.editable=!this.editable;
			this.contentable=!this.contentable;
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

      	var onSuccess = function(data, status) {
			this.editable=!this.editable;
			this.contentable=!this.contentable;

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