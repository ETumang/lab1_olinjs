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
	 			riot.route("article/"+ data._id+"/edit");
	 			//need to update link list 

	 		}).error (function (status, err) {
	 			console.log("status: "+ status);
	 		})
		}
	</script>
</navbar>