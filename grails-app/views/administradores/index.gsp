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

			.ocultar {
				display: none;
			}

			#background {
				background-color: #607D8B;
			}

			.btn-crearAdmin {
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
				background-color: #607D8B;
				display: none;
			}
			
			label.error {
				color: rgba(255, 81, 81, 1);
	  			float: right;
			}	
			
			a:focus, a:hover {
				color: #607D8B;
			}
		</style>
		<g:set var="titulo" value="Nuevo administrador" scope="request"/>
		
		<!-- DIV PARA MOSTRAR EMPRESAS -->
		<div class="col-md-6">
			<div class="col-md-11" style="margin: auto; text-align: center;">
				<label>Administradores</label>
			</div>
			<div style="text-align: center; margin: auto; margin-bottom: 30px;">
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10"  style="overflow: auto; height: 380px; background-color: #CFD8DC;">
					<table class="table" id="tabla_empresas">
						<thead>
							<tr>
								<th>Nombre de usuario</th><th>Empresa</th><th>Editar</th><th>Eliminar</th>
							</tr>
						</thead>
						<div>
							<g:each in="${listaAdmins}" var="admin">
								<g:if test="${admin.id > 1}">
									<tr id="${admin.id}">
										<td>${admin.username}</td>
										<td>${admin.empresa.razon_social}</td>
										<td><button onclick="editarAdmin(${admin.id})" class="glyphicon glyphicon-edit" aria-hidden="true"></button></td>
										<td><button onclick="eliminarAdmin(${admin.id})" class="glyphicon glyphicon-trash" aria-hidden="true"></button></td>
									</tr>
								</g:if>
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
					<form action="${createLink(action: 'crearAdmin', controller: 'administradores')}" method="post" style="width: 350px; text-align: left; margin: auto;">
						<div class="form-group">
							<label for="inputNombre">Nombre de usuario</label>
							<input class="form-control" id="input_nombre" name="input_nombre" type="text" placeholder="Nombre de usuario"/>
						</div>
						<div class="form-group">	
							<label for="inputNombre">Contraseña</label>
							<input class="form-control" id="input_password" name="input_password" type="password" placeholder="Contraseña"/>
						</div>

						<div id="combobox" class="form-group">						
							<label for="inputNombre">Seleccione Empresa</label>	
							<select name="idEmpresa" class="form-control" style="width: 350px; margin: auto;">
								<option value="" disabled selected>Empresa</option>
								<g:each in="${listaEmpresas}" var="empresa">
									<g:if test="${empresa.id > 1}">
										<option value="${empresa.id}"> ${empresa.razon_social} </option>
									</g:if>
								</g:each>
							</select>
						</div>
						<button id="btn-crear" class="btn btn-primary btn-crearAdmin" style="text-align: center; width: 200px;" type="submit">Crear</button>
					 </form>
						<button id="btn-editar" class="ocultar" style="text-align: center; width: 200px;" type="submit">Guardar cambios</button>
				</div>
			</div>
		</div>

		<div id="dialog" class="alert-box">
			El administrador fue creado exitos	amente.
		</div>

		<script type="text/javascript">
			$("#btn-crear").click(function (){
				$("#dialog").fadeIn('fast').delay(5000).fadeOut('fast');
				$("#tabla_empresas").empty();
			});

			function eliminarAdmin (id) {
				var promise = $.ajax({ 
						type: "delete", 
						url: "/organizadorDeRegalos/administradores/eliminarAdmin/" + id,
					});
				promise.done(function(){
					window.location.replace("/organizadorDeRegalos/administradores/index");
				});
			};
			
			function editarAdmin (id) {
				var promise = $.ajax({ 
						type: "get", 
						url: "/organizadorDeRegalos/administradores/datosAdmin/" + id,
					});

					promise.done(function(admin){
						$("#input_nombre").val(admin.username);
						$("#input_password").val(admin.password);
						$("#combobox").attr("class", "ocultar");
						$("#btn-editar").attr("class", "btn btn-primary btn-crearAdmin");
						$("#btn-crear").attr("class", "ocultar");

						$("#btn-editar").click(function() {
							var promise_editar = $.ajax({ 
								type: "put", 
								url: "/organizadorDeRegalos/administradores/editarAdmin/" + id + "/?input_nombre=" + $("#input_nombre").val() + "&input_password=" + $("#input_password").val()
								});

							promise_editar.done(function (){
								$("#btn-editar").attr("class", "ocultar");
								$("#btn-crear").attr("class", "btn btn-primary btn-crearAdmin");
								$("#input-cuit").val("");
								$("#input-nombre").val("");
								$("#tabla_empresas").empty();
								$("#combobox").attr("class", "form-control");
								window.location.replace("/organizadorDeRegalos/administradores/index");
							});
						});
					});


			};


		</script>	
	</body>	
</html>