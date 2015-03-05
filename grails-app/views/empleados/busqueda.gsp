<html>
	<head>
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	</head>
	
	<body>
			<input placeholder="Busque regalo..." id="search"/>
			<button id="btn-buscar">Buscar</button>
		 
		<div id="productos"></div>
	</body>

</html>

<script type="text/javascript">
	$("#btn-buscar").click(getProductos);
	function getProductos(){
		$("#productos").html("");
		var regalo = $("#search").val();
		if(regalo == ""){
			alert("Ingrese algún regalo");
		}else{
			$.ajax({
				url: "https://api.mercadolibre.com/sites/MLA/search?q="+regalo,
				dataType:"json",
				type:"GET",
				success:function(data){
					for(var i=0;i<data.results.length;i++){
						$("#productos").append(data.results[i].title+"<br>");
					}
				}
			});
		}
	}
	
</script>