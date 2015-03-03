<body>
	<div if !{is_editable} class="wrapper">
		<title></title>
		<content></content>
		<links></links>
		<editButton></editButton>
	</div>

	<div if {is_editable} class="wrapper">
		<form></form>
	</div>

	<script> 
		this.on("switch" function () {
			var is_editable= !is_editable;
		})

		riot.mount('wrapper', { plan: { name: 'small', term: 'monthly' } })
	</script>
</body>
