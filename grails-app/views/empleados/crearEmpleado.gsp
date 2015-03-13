<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/themes/flick/jquery-ui.css">
		<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.10.0/jquery.validate.min.js"></script>
		
		<script>
			$(document).ready(function(){
				$( "#input-fecha" ).datepicker();
				$( "#input-fecha" ).datepicker("option","dateFormat", "yy-mm-dd" );

				$('#crearEmpleado').validate({
			        rules: {
			            nombre: {
			                required: true,
			                lettersonly: true
			            },
			            apellido: {
			                required: true,
			                lettersonly: true
			            },
			            dni: {
							required: true,
							number: true
				        },
				        fecha: {
					        required: true
					    }
			        },
			        messages: {
			            nombre: {
			            	required: "Por favor complete su nombre",
				           	lettersonly: "Ingrese solo letras y espacios"
			            },
				        apellido: {
			            	required: "Por favor complete su nombre",
			            	lettersonly: "Ingrese solo letras y espacios"
			            },
			            dni: {
			                required: "Por favor complete su DNI",
			                number: "Ingrese sólo números"
			            },
			            fecha: {
							required: "Por favor seleccione una fecha"
				        }
			        },
			        submitHandler: function() { 
			        	$.ajax({ 
							type: "post", 
							url: "${ createLink(controller : 'Empleados', action : 'guardarEmpleado') }",
							data: $('#crearEmpleado').serialize(),
							success: function(){
			        			$( "#dialog" ).fadeIn('fast').delay(1000).fadeOut('fast');
			        			$('#crearEmpleado').trigger("reset");
							}
						});
					} 
				});
			});

			jQuery.validator.addMethod("lettersonly", function(value, element) {
			    return this.optional(element) || /^[a-z\s]+$/i.test(value);
			}, "Only alphabetical characters"); 
		</script>
		
		<style>
			#background {
				background-color: rgb(0, 158, 255);
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
				background-color: rgb(0, 158, 255);
				display: none;
			}
			
			label.error {
				color: rgba(255, 81, 81, 1);
	  			float: right;
			}	
			
			a:focus, a:hover {
				color: rgb(0, 158, 255);
			}
		</style>
	</head>
	<body>
		<g:set var="titulo" value="Nuevo empleado" scope="request"/>
		<div class="col-md-12 box">
			<form id="crearEmpleado" style="width: 350px; text-align: left; margin: auto;">
				<div class="form-group">
					<label for="inputNombre">Nombre</label>
					<input data-validation="required" class="form-control" id="input-nombre" name="nombre" placeholder="Nombre" />
				</div>
				<div class="form-group">
					<label for="inputNombre">Apellido</label>
					<input data-validation="required" class="form-control" id="input-apellido" name="apellido" placeholder="Apellido"/>
				</div>
				<div class="form-group">
					<label for="inputNombre">DNI</label>
					<input data-validation="required" class="form-control" id="input-dni" name="dni" placeholder="DNI"/>
				</div>
				<div class="form-group">
					<label for="inputNombre">Fecha de nacimiento</label>
					<input data-validation="required" class="form-control" placeholder="Fecha de nacimiento" type="text" id="input-fecha" name="fecha" readonly="readonly" />
				</div>
				<button id="btn-nuevo" class="btn btn-primary btn-crearEmpleado" style="text-align: center; width: 200px;" type="submit">Crear</button>
			 </form>
			<div id="dialog" class="alert-box">
				El usuario fue creado exitosamente
			</div>
		</div>
	</body>
</html>
