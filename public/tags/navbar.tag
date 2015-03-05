<navbar>
	<div id="topicTitle"> 
		<h1>Cats</h1>
	</div>

	<div id="linksList">
		<ul>
		    <li each="{name, i in links}" ><a href="(article/"+{name})>{name}</a> 
		    </li>
		</ul>
	</div>

	<div id = "newButton" if={topicable} onclick={ clickedNew } >
		<button type = "button">New</button>
	</div>

	<script>
		this.links=opts.links;

		clickedNew(e){
	 		console.log("New page clicked")

	 		$.get("makeNew").done(function (data, err) {
	 			riot.route("article/"+ data._id);
	 			
	 		}).error (function (status, err) {
	 			console.log("status: "+ status);
	 		})

	 		//trigger this from other tag
			this.editable=true;
			this.topicable=false;
		}

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



	</script>
</navbar>