<html>
	<head>
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	</head>
	<body>
		<div id="nav" class="col-md-6">
			<ul>
				<li><a href="${ createLink(controller:"Index",action:"Index")}">Últimos Regalos</a></li>
				<li><a href="${ createLink(controller:"Empleados",action:"crearEmpleado")}">Nuevo Empleado</a></li>
				<li><a href="${ createLink(controller:"Regalos",action:"crearRegalo")}">Nuevo Regalo</a></li>
				<li><a href="${ createLink(controller:"Empleados",action:"elegirEmpleado")}">Eliminar/Editar Empleado</a></li>
				<li><a href="${ createLink(controller:"Regalos",action:"elegirRegalo")}">Eliminar/Editar Regalo</a></li>	
				<li><a href="${ createLink(controller:"Index",action:"mandarMail")}">Mandar Mails</a></li>
			</ul>
		</div>
		<form action="${ createLink(controller:"Empleados",action:"guardarEmpleadoEditado",params:[idEmpleado:empleado.id])}" method="post">
			<input id="input-nombre" name="nombre" placeholder="Nombre"/>
			<input id="input-apellido" name="apellido" placeholder="Apellido"/>
			<input id="input-dni" name="dni" placeholder="DNI"/>
			<input type="text" id="input-fecha" name="fecha" placeholder="Fecha De Nacimiento"/>
			<button id="btn-nuevo" type="submit">Editar empleado</button>
		 </form>
	</body>
	<script>
		$(function() {
			$( "#input-fecha" ).datepicker();
			$( "#input-fecha" ).datepicker("option","dateFormat", "yy-mm-dd" );
		});
	</script>

</html>