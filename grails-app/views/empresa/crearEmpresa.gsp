<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/themes/flick/jquery-ui.css">
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.10.0/jquery.validate.min.js"></script>
	</head>
	<body>
		<style>
			#background {
				background-color: #00E676;
			}

			.btn-crearEmpleado {
				width: 200px;
				margin-left: 70px;
				margin-top: 20px;
				margin-bottom: 40px;
			}
			
			.alert-box {
				width: 400px;
				height: 100px;
				position: absolute;
				z-index: 1;
				margin: auto;
				left: 0;
				right: 0;
				top: 0;
				bottom: 0;
				color: #fff;
				font-size: 24px;
				text-align: center;
				padding: 20px;
				background-color: #00E676;
				display: none;
			}
			
			label.error {
				color: rgba(255, 81, 81, 1);
	  			float: right;
			}	
			
			a:focus, a:hover {
				color: #00E676;
			}
		</style>
		<g:set var="titulo" value="Nueva empresa" scope="request"/>
		<div class="col-md-12 box">
			<form id="crearEmpleado" style="width: 350px; text-align: left; margin: auto;">
				<div class="form-group">
					<label for="inputNombre">Razon Social</label>
					<input data-validation="required" class="form-control" id="input-nombre" name="nombre" placeholder="Razon Social" />
				</div>
				<button id="btn-nuevo" class="btn btn-primary btn-crearEmpleado" style="text-align: center; width: 200px;" type="submit">Crear</button>
			 </form>
			<div id="dialog" class="alert-box">
				La empresa fue creada exitosamente.
				Usuario Administrador: 
				Contraseña: 
			</div>
		</div>
	</body>	
</html>