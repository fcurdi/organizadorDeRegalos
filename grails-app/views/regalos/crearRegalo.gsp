<html>
	<head>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
		<link rel="stylesheet" href="/resources/demos/style.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,100' rel='stylesheet' type='text/css'>
		
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
				background-color: rgb(249, 103, 60);
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
			::-webkit-scrollbar {
			    width: 10px;
			}
			 
			/* Handle */
			::-webkit-scrollbar-thumb {
			    background: rgba(200,0,0,0.1); 
			}
			
			::-moz-scrollbar {
			    width: 10px;
			}
			 
			/* Handle */
			::-moz-scrollbar-thumb {
			    background: rgba(200,0,0,0.1); 
			}
			
.custom-combobox {
position: relative;
display: inline-block;
}
.custom-combobox-toggle {
position: absolute;
top: 0;
bottom: 0;
margin-left: -1px;
padding: 0;
}
.custom-combobox-input {
margin: 0;
padding: 5px 10px;
}
</style>
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
						<li><a href="">Últimos Regalos</a></li>
						<li><a href="">Nuevo Empleado</a></li>
						<li><a href="">Nuevo Regalo</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					
					<form action="${ createLink(controller:"Regalos",action:"guardarRegalo")}" method="post">
						<!-- Adentro de este form hay que poner lo de los radio buttons -->
						<div>
							<select id="combobox" name="idEmpleado" class="form-control">
								 <option value="" disabled selected>Buscar Empleado</option>
								<g:each in="${empleados}" var="empleado">
									<option value="${empleado.id}">${empleado.nombre} ${empleado.apellido} ${empleado.dni} </option>
								</g:each>
							</select><br>
							<input name="anio" placeholder="Ingrese año" id="input-anio"><br>
							<button id="btn-guardar" type="submit">Guardar regalo</button>
						</div>
					</form>
				</div> 
				<div class="col-md-6">
					<div id="list-regalo">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10" style="margin: auto; text-align: center;">
								<input id="search" style="margin: auto; display: inline; margin-bottom: 20px; width: 70%;" type="text" class="form-control" placeholder="Buscar Regalo">
								<button id="btn-buscar" class="btn btn-default" style="height: 34px; vertical-align: top;"><span class="glyphicon glyphicon-search"></span></button>
							</div>
							<div class="col-md-1"></div>
						</div>
						
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10"  style="overflow: scroll;height: 380px;">
								<table class="table table-hover" id="productos">
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
	function getProductos(){
		$("#productos").html("");
		var regalo = $("#search").val();
		if(regalo == ""){
			alert("Ingrese algún regalo");
		}else{
			$.ajax({
				url: "https://api.mercadolibre.com/sites/MLA/search?q="+regalo+"&limit=10",
				dataType:"json",
				type:"GET",
				success:function(data){
					for(var i=0;i<data.results.length;i++){
						$("#productos").append(
							"<tr style=\"cursor: pointer;\">"+
							"<td>"+
								"<img src="+data.results[i].thumbnail+"></td>"
							+"<td><a href="+data.results[i].permalink+">"+data.results[i].title+
							"</a></td><tr>"
						);
					}
				}
			});
		}
	}
	
</script>