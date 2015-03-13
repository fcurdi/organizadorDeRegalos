<html>
	<head>
		<meta name="layout" content="main" />
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
		
		<style>
			 #background {
				background-color: rgb(255, 97, 40);
			 }
		
			.bg {
				background-color: rgba(249, 103, 60, 0.1);
			}
			
			.info-search {
				text-align: center;
				padding-top: 50px;
				font-size: 20px;
				color: rgb(205, 157, 157);
			}
			
			a:hover, a:focus {
				color: rgb(255, 97, 40);
			}

			.table>a {
				color: red;
			}

			.table>tbody>tr:hover {
				background: rgba(255, 58, 0, 0.20);
			}

			.table>tbody>tr>td {
				vertical-align: middle;
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
				padding: 30px;
				background-color: rgb(255, 97, 40);
				display: none;
			}

		</style>
	</head>
	
	<body>
		<g:set var="titulo" value="Nuevo regalo" scope="request"/>
		
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12" style="margin: auto; text-align: center;">
					<input id="search" style="margin: auto; display: inline; margin-bottom: 20px; width: 70%;" type="text" class="form-control" placeholder="Buscar Regalo">
					<button type="button" id="btn-buscar" class="btn btn-default" style="height: 34px; vertical-align: top;"><span class="glyphicon glyphicon-search"></span></button>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10"  style="overflow: auto; height: 360px; background-color: rgba(255, 58, 0, 0.12);">
					<table class="table table-hover" id="productos">
						<div id="info-search" class="info-search">Por favor, busque un regalo</div>
						<tbody></tbody>
					</table>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>

		<div class="col-md-6">
			<div style="text-align: center; margin: auto; margin-top: 30px; margin-bottom: 30px;">
				<div class="form-group">
					<label for="inputNombre">Seleccione el empleado</label>
					<select id="combobox" name="idEmpleado" class="form-control" style="width: 300px; margin: auto;">
						<option value="" disabled selected>Buscar Empleado</option>
						<g:each in="${empleados}" var="empleado">
							<option value="${empleado.id}">${empleado.nombre} ${empleado.apellido} ${empleado.dni} </option>
						</g:each>
					</select>
				</div>
				
				<div class="form-group">
					<label for="inputNombre">Año del regalo</label>
					<input class="form-control" style="width: 100px; margin: auto;" name="anio" placeholder="Ingrese año" id="input-anio">
				</div>
				
				<button class="btn btn-default" id="btn-guardar" onClick="guardarRegalo"
				style="background: rgb(249, 116, 68); font-size: 16px; color: white; width: 150px; height: 50px;">Guardar regalo</button>
			</div>
		</div>
		<div id="dialog" class="alert-box">
			Regalado!
		</div>
		<script>
			$("#btn-buscar").click(getProductos);
			$("#btn-guardar").click(guardarRegalo);
			
			function getProductos(){
				$("#productos").html("");
				var regalo = $("#search").val();
				if(regalo == ""){
					alert("Ingrese algún regalo");
				}else{
					$.ajax({
						url: "https://api.mercadolibre.com/sites/MLA/search?q='"+regalo+"'&limit=10",
						dataType:"json",
						type:"GET",
						success:function(data){
							$("#info-search").hide();
							$("#productos").append("<tbody>");
							for(var i=0;i<data.results.length;i++){
								$("#productos tbody").append(
									"<tr id="+i+" style=\"cursor: pointer;\">"+
									"<td>"+
										"<img src="+data.results[i].thumbnail+"></td>"
									+"<td><a href="+data.results[i].permalink+">"+data.results[i].title+
									"</a></td><td><input name=\"regaloSeleccionado\" id=\"regaloSeleccionado_"+i+"\" type='radio' value='"+data.results[i].id+"'></td><tr>"
								);
							}
							$("#productos").append("</tbody>");
							$('#productos tbody tr').on('click', function () {
								$(this).closest('table').find('td').removeClass('bg');
						        $(this).find('td').addClass('bg');
							    $(this).find('input:radio').prop('checked', true);
							});
						}
					});
				}
			}
		
			function guardarRegalo(){
				var regaloSeleccionado = $("input[name=regaloSeleccionado]:checked").val();
				var empleadoId = $("#combobox").val();
				var anio = $("#input-anio").val();
				$.ajax({ 
				    type: "get", 
				    dataType: "JSON", 
				    url: "https://api.mercadolibre.com/items/"+regaloSeleccionado, 
				    success: function(data){ 
				    	$.ajax({ 
						    type: "post", 
						    url: "${ createLink(controller: 'Regalos', action: 'guardarRegalo') }", 
						    data: { titulo : data.title, url : data.permalink, thumbnail : data.thumbnail, anio : anio, empleadoId: empleadoId, idMLA : regaloSeleccionado}, 
						    success: function(data) {
								$( "#dialog" ).fadeIn('fast').delay(1000).fadeOut('fast');
							} 
						});
					} 
				});
			}
		</script>
	</body>	
	
</html>

