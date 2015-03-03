<editbutton onclick={ clicked }>

	<button type = "button">{opts.text}</button>

	<script>
		clicked(e){
			this.trigger('switch')
		}

	</script>

</editbutton>