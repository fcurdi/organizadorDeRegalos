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
				height: 150px;
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
		
		<!-- DIV PARA MOSTRAR EMPRESAS -->
		<div class="col-md-6">
			<div class="col-md-11" style="margin: auto; text-align: center;">
				<label>Empresas</label>
			</div>
			<div style="text-align: center; margin: auto; margin-bottom: 30px;">
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10"  style="overflow: auto; height: 360px; background-color: #B9F6CA;">
					<table class="table table-hover" id="tabla_empresas">
						<div>
							<g:each in="${lista_empresas}" var="empresa">
								<div> ${empresa.razon_social} </div>
							</g:each>
						</div>
					</table>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>

		<!-- DIV PARA CREAR EMPRESA -->
		<div class="col-md-6">
			<div style="text-align: center; margin: auto; margin-bottom: 30px;">
				<div class="col-md-6" style="margin: auto; text-align: center;">
					<form action="${createLink(action: 'crearEmpresa', controller: 'empresa')}" method="post" style="width: 350px; text-align: left; margin: auto;">
						<div class="form-group">
							<label for="inputNombre">Razon Social</label>
							<input class="form-control" id="input-nombre" name="input_rs" placeholder="Razon Social" />
						</div>
						<button id="btn-crear" class="btn btn-primary btn-crearEmpleado" style="text-align: center; width: 200px;" type="submit">Crear</button>
					 </form>
				</div>
			</div>
		</div>

		<div id="dialog" class="alert-box">
			La empresa fue creada exitosamente.
			Usuario Administrador: 
			Contraseña: 
		</div>

		<script>
			$("#btn-crear").click(function (){
				$("#dialog").fadeIn('fast').delay(5000).fadeOut('fast');
				tabla_empresas.empty();
			});
		</script>	
	</body>	
</html>