<wrapper>
	<div if !{is_editable} class="wrapper">
		<titletag title={opts.title}></titletag>
		<content content={opts.content}></content>
		<links links={opts.links}></links>
		<editbutton text= {opts.text}></editbutton>
	</div>

	<div if {is_editable} class="wrapper">
		<editform title ={opts.title} content={opts.content} pageID={opts.pageID}></editform>
	</div>

	 <!--script> 
	// 	this.on("switch" function () {
	// 		var is_editable= !is_editable;
	// 	})
	 </script-->
</wrapper>