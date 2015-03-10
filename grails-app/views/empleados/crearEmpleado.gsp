<!DOCTYPE html>
<html>
	<head>
		<title>Organizador de Regalos</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,100' rel='stylesheet' type='text/css'>
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
		<style>
			body {
				font-family: Roboto;
				font-size: 14px;
				color: #37474f;
				background-color: #F4F4F4;
			}
			
			#background {
				position: absolute;
				z-index: 1;
				width: 100%;
				height: 222px;
				content: '';
				top: 0;
				left: 0;
				background-color: rgb(255, 232, 0);
			}
			
			#container {
				position: absolute;
				min-height: 85%;
				top: 50px;
				left: 50px;
				right: 50px;
				background-color: rgb(253, 253, 253);
				box-shadow: 0px 2px 12px #B2B2B2;
				z-index: 2;
				margin-bottom: 50px;
			}
			
			#title {
				text-align: center;
				font-size: 40px;
				font-weight: 100;
				padding: 30px;
			}
			
			#nav {
				text-align: center;
				padding: 45px;
				font-size: 20px;
			}
			
			#list-empleados{
				text-align: center;
			}
			
			a:hover { text-underline: none; border-bottom: 1px solid red; }
			ul { text-align : center }
			ul li { display: inline; white-space: nowrap; margin-right: 20px; }
		</style>
	</head>
	<body>
		<div id="background"></div>
		<div id="container" class="container">
			<div class="row">
				<div class="col-md-6">
					<div id="title" style="float: left;">
						Organizador de Regalos
					</div>
				</div>
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
			</div>
			<div class="row" style="height: 300px;">
				<div class="col-md-12">
					<div id="list-empleados" style="text-align:center;">
						<form action="${ createLink(controller:"Empleados",action:"guardarEmpleado")}" method="post">
							<input class="form-control" style="width: 300px; margin: auto;" id="input-nombre" name="nombre" placeholder="Nombre"/><br>
							<input class="form-control" style="width: 300px; margin: auto;" id="input-apellido" name="apellido" placeholder="Apellido"/><br>
							<input class="form-control" style="width: 300px; margin: auto;" id="input-dni" name="dni" placeholder="DNI"/><br>
							<input class="form-control" style="width: 300px; margin: auto;" placeholder="Cumpleaños" type="text" id="input-fecha" name="fecha" /><br>
							
							<!--  <input id="input-fecha" name="fecha" placeholder="Fecha de Nacimiento"/>-->
							<button id="btn-nuevo" class="btn btn-default" type="submit">Nuevo empleado</button>
						 </form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

<script>
		$(function() {
			$( "#input-fecha" ).datepicker();
			$( "#input-fecha" ).datepicker("option","dateFormat", "yy-mm-dd" );
		});
	</script>