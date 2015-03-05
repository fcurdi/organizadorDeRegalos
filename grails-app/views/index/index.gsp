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
				line-height: 1.42857143;
				color: #37474f;
				background-color: #F4F4F4;
			}
			
			#header {
				width: 100%;
				height: 200px;
				background-color: rgb(255, 232, 0);
			}
			
			#container {
				position: absolute;
				top: 50px;
				bottom: 50px;
				left: 50px;
				right: 50px;
				background-color: rgb(253, 253, 253);
				box-shadow: 0px 2px 12px #B2B2B2;
				min-width: 1200px;
				min-height: 500px;
			}
			
			#title {
				font-size: 40px;
				font-weight: 100;
				padding: 30px;
			}
			
			nav {
				float: right;
				padding: 45px;
				font-size: 20px;
			}
			
			a:hover { text-underline: none; border-bottom: 1px solid red; }
			ul { text-align : center }
			ul li { display: inline; white-space: nowrap; margin-right: 20px; }
		</style>
	</head>
	<body>
		<header>
			<div id="header"></div>
		</header>
		<div id="container">
			<div id="title" style="float: left;">Organizador de Regalos</div>
			<nav>
				<ul>
					<li><a href="">Últimos Regalos</a></li>
					<li><a href="">Nuevo Empleado</a></li>
					<li><a href="">Nuevo Regalo</a></li>
				</ul>
			</nav>
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
	</body>
</html>
