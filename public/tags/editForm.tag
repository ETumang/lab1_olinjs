<editform onsubmit={ add }>
	<div class="editPage" name="{opts.pageID}">
		<form id="editPageInput">
			<div id="titleInput" >
				<label for="pageTitle">Title of Page</label>
			    <input id="pageTitle" type="text" value="{opts.title}" name="{opts.pageID}" onkeyup={ edit }> 
		    </div>   

		    <div id="contentInput">
				<label for="pageContent">Content of Page</label>
			    <input id="pageContent" type="text" value="{opts.content}">  
			</div>

		    <input type="submit" id="submit" value="Submit"/>

		</form>
	</div>

	<script>

		edit(e){
			this.text=e.target.value
		}

    	add(e){

    		var $form=$(#"editPageSubmit");
      		if(this.text){

				var title = $form.find("#pageTitle").val();
			    var content = $form.find("#pageContent").val();
			    var pageID = $form.find("#pageTitle").attr("name");

				$.post("editPageSubmit", {
				    newPageTitle: title,
				    newPageContent: content,
				    newPageID: pageID
				}).done(onSuccess).error(onError)

      		}
      	}

      	var onSuccess = function(data, status) {
		  var id = data._id;
		  console.log("Data is : "+data)
		  this.trigger('switch')
		};

		var onError = function(data, status) {
		  console.log("status", status);
		  console.log("error", data);
		};

   	</script>

</editForm>

	
