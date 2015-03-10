<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="createLink(${})"/>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
		<link rel="stylesheet" href="/resources/demos/style.css">	
		
		<script>
		(function( $ ) {
			$.widget( "custom.combobox", {
				_create: function() {
					this.wrapper = $( "<span>" )
						.addClass( "custom-combobox" )
						.insertAfter( this.element );
					this.element.hide();
					this._createAutocomplete();
					//this._createShowAllButton();
				},
				_createAutocomplete: function() {
					var selected = this.element.children( ":selected" ),
					value = selected.val() ? selected.text() : "";
					this.input = $( "<input>" )
						.appendTo( this.wrapper )
						.val( value )
						.attr( "title", "")
						.attr("placeholder", "Buscar Empleado")
						.addClass( "form-control" )
						.autocomplete({
							delay: 0,
							minLength: 0,
							source: $.proxy( this, "_source" )
						})
						.tooltip({
							tooltipClass: "ui-state-highlight"
						});
					this._on( this.input, {
						autocompleteselect: function( event, ui ) {
							ui.item.option.selected = true;
							this._trigger( "select", event, {
								item: ui.item.option
							});
						},
						autocompletechange: "_removeIfInvalid"
					});
				},
				/*_createShowAllButton: function() {
					var input = this.input,
					wasOpen = false;
					$( "<a>" )
						.attr( "tabIndex", -1 )
						.tooltip()
						.appendTo( this.wrapper )
						.button({
							icons: {
								primary: "ui-icon-triangle-1-s"
							},
							text: false
						})
						.removeClass( "ui-corner-all" )
						.addClass( "custom-combobox-toggle ui-corner-right" )
						.mousedown(function() {
							wasOpen = input.autocomplete( "widget" ).is( ":visible" );
						})
						.click(function() {
							input.focus();
							// Close if already visible
							if ( wasOpen ) {
								return;
							}
							// Pass empty string as value to search for, displaying all results
							input.autocomplete( "search", "" );
						});
				},*/
				_source: function( request, response ) {
					var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
					response( this.element.children( "option" ).map(function() {
					var text = $( this ).text();
					if ( this.value && ( !request.term || matcher.test(text) ) )
						return {
							label: text,
							value: text,
							option: this
						};
					}) );
				},
				_removeIfInvalid: function( event, ui ) {
				// Selected an item, nothing to do
					if ( ui.item ) {
				 		return;
				 	}
					// Search for a match (case-insensitive)
					var value = this.input.val(),
				 		valueLowerCase = value.toLowerCase(),
				 		valid = false;
				 	this.element.children( "option" ).each(function() {
				 		if ( $( this ).text().toLowerCase() === valueLowerCase ) {
				 			this.selected = valid = true;
				 			return false;
				 		}
				 	});
					// Found a match, nothing to do
				 	if ( valid ) {
				 		return;
				 	}
				 	// Remove invalid value
				 	this.input
				 		.val( "" )
				 		.attr( "title", "El empleado "+ value + " no existe." )
				 		.tooltip( "open" );
				 	this.element.val( "" );
				 	this._delay(function() {
				 		this.input.tooltip( "close" ).attr( "title", "" );
				 	}, 2500 );
				 	this.input.autocomplete( "instance" ).term = "";
				},
				_destroy: function() {
				 	this.wrapper.remove();
				 	this.element.show();
				}
			});
		})( jQuery );
		$(function() {
			$( "#combobox" ).combobox();
			$( "#toggle" ).click(function() {
				$( "#combobox" ).toggle();
			});
		});
		</script>
	</head>
	
	<body>
		<div id="background"></div>
		<div id="container">
			<div class="row">
				<div class="col-md-6">
					<div id="title" style="float: left;">
						Nuevo Regalo
					</div>
				</div>
				<div id="nav" class="col-md-6">
					<ul>
						<li><a href="${ createLink(controller:"Index",action:"Index")}">Últimos Regalos</a></li>
						<li><a href="${ createLink(controller:"Empleados",action:"Index")}">Ver Empleados</a></li>
						<li><a href="${ createLink(controller:"Empleados",action:"crearEmpleado")}">Nuevo Empleado</a></li>
						<li><a href="${ createLink(controller:"Regalos",action:"crearRegalo")}">Nuevo Regalo</a></li>
						<li><a href="${ createLink(controller:"Empleados",action:"elegirEmpleado")}">Eliminar/Editar Empleado</a></li>
						<li><a href="${ createLink(controller:"Regalos",action:"elegirRegalo")}">Eliminar/Editar Regalo</a></li>	
						<li><a href="${ createLink(controller:"Index",action:"mandarMail")}">Mandar Mails</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					
						<!-- Adentro de este form hay que poner lo de los radio buttons -->
						<div style="text-align: center;">
							<span>Seleccione el empleado</span>
							<br>
							<select id="combobox" name="idEmpleado" class="form-control" style="width: 350px;
  margin-bottom: 40px;">
								 <option value="" disabled selected>Buscar Empleado</option>
								<g:each in="${empleados}" var="empleado">
									<option value="${empleado.id}">${empleado.nombre} ${empleado.apellido} ${empleado.dni} </option>
								</g:each>
							</select><br><br><br><br>
							<span>Seleccione el año del regalo</span><br>
							<input class="form-control" style="width: 100px; margin: auto; margin-bottom: 100px;" name="anio" placeholder="Ingrese año" id="input-anio"><br>
							<button class="btn btn-default" id="btn-guardar" style="
    background: rgb(255, 122, 82);
    font-size: 20px;
    color: white;
    width: 300px;
    height: 75px;
">Guardar regalo</button>
						</div>
				</div>
				<div class="col-md-6">
					<div id="list-regalo">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10" style="margin: auto; text-align: center;">
								<input id="search" style="margin: auto; display: inline; margin-bottom: 20px; width: 70%;" type="text" class="form-control" placeholder="Buscar Regalo">
								<button type="button" id="btn-buscar" class="btn btn-default" style="height: 34px; vertical-align: top;"><span class="glyphicon glyphicon-search"></span></button>
							</div>
							<div class="col-md-1"></div>
						</div>
						
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10"  style="overflow: auto; height: 360px; background-color: rgba(249, 103, 60, 0.1);">
								<table class="table table-hover" id="productos">
									<tbody><span style="
										    font-size: 20px;
										    position: absolute;
										    width: 400px;
										    margin: auto;
										    top: 160px;
										    left: 0;
										    right: 0;
										    text-align: center;
										    color: rgba(226, 136, 136, 0.57);
										">Por favor, busque un regalo</span></tbody>
								</table>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

<script type="text/javascript">
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
						    $(this).find('tr input:radio').prop('checked', true);
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
				    type: "POST", 
				    dataType: "JSON", 
				    url: "${createLink(controller: 'Regalos', action: 'guardarRegalo')}", 
				    data: { titulo : data.title, url : data.permalink, thumbnail : data.thumbnail, anio : anio, empleadoId: empleadoId ,idMLA:regaloSeleccionado, costo:data.price}, 
				    success: function(data) {
					    alert("guardado");
					} 
				});
			} 
		});
	}
	
</script>