<wrapper>
	<div if !{is_editable} class="wrapper">
		<titleTag title={opts.title}></titleTag>
		<content content={opts.content}></content>
		<links links={opts.links}></links>
		<editButton text= {opts.text}></editButton>
	</div>

	<div if {is_editable} class="wrapper">
		<editForm title ={opts.title} content={opts.content} pageID={opts.pageID}></editForm>
	</div>

	 <!--script> 
	// 	this.on("switch" function () {
	// 		var is_editable= !is_editable;
	// 	})
	 </script-->
</wrapper>