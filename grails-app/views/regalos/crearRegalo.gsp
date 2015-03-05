html>
	<head>
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	</head>
	
		
	<body>
		<form action="${ createLink(controller:"Empleados",action:"guardarEmpleado")}" method="post">
			<input id="input-nombre" name="nombre" placeholder="Nombre"/>
			<input id="input-apellido" name="apellido" placeholder="Apellido"/>
			<span>
				titulo:${titulo},   
			</span>
			<input type="text" id="input-fecha" name="fecha" />
			<button id="btn-nuevo" type="submit">Nuevo empleado</button>
		 </form>
		<div id="productos"></div>
	</body>
	<script>
		$(function() {
			$( "#input-fecha" ).datepicker();
			$( "#input-fecha" ).datepicker("option","dateFormat", "yy-mm-dd" );
		});
	</script>

</html>