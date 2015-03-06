<!DOCTYPE html>
<html>
	<head>
		<title>Organizador de Regalos</title>
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
		<div id="container">
			<div class="row">
				<div class="col-md-6">
					<div id="title" style="float: left;">
						Organizador de Regalos
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
				<div class="col-md-12">
					<div id="list-empleados">
						<table class="table table-hover ">
							<thead>
								<tr>
									<td>Nombre</td>
									<td>Cumpleaños</td>
									<td>Regalo</td>	
								</tr>
							</thead>
							<tbody>
								<g:each in="${ regalos }" var="regalo">
									<tr>
										<td>${ regalo.empleado.nombre }</td>
										<td>${ regalo.empleado.fechaNacimiento.format("dd/MM")}</td>
										<td>${ regalo.titulo }</td>
										<td><img src="${ regalo.thumbnail }"/></td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
