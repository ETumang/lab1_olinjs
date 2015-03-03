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

	<div if={editable}>
		<p>Text</p>
	</div>

	<script>
	var self=this;
	this.title = opts.title;
	this.content=opts.content;
	this.links = opts.links;
	this.buttontext=opts.buttontext;

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
			// this.trigger('switch')
			this.editable=!this.editable;
			this.contentable=!this.contentable;
		}

	</script>

</article>