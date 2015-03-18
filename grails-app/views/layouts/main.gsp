<!DOCTYPE html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Organizador de Regalos"/></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<asset:stylesheet src="application.css"/>
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,100' rel='stylesheet' type='text/css'>
		<g:layoutHead/>
	</head>
	<body>
		<div class='flogout'><g:message code="springSecurity.logout.header"/></div>
		<div id="background"></div>
		<div id="container" class="container">
			<div class="row">
				<div id="title" class="col-md-4	">
					${ titulo }
				</div>
				<div id="nav" class="col-md-8 vcenter">
					<ul> 
						<li><a href="${ createLink(controller:"Index",action:"index")}">HOME</a></li>
						<li><a href="${ createLink(controller:"Empleados",action:"crearEmpleado")}">NUEVO EMPLEADO</a></li>
						<li><a href="${ createLink(controller:"Regalos",action:"crearRegalo")}">NUEVO REGALO</a></li>	
						<li><a href="${ createLink(controller:"Index",action:"mandarMail")}">ENVIAR REPORTE</a></li>
						<li><a href="${ createLink(controller:"Empresa",action:"index")}"> EMPRESAS</a></li>
						<li><a href="${ createLink(controller:"Administradores",action:"index")}"> ADMINISTRADORES</a></li>
						<sec:ifLoggedIn>
							<li><a href="${ createLink(controller:"Logout",action:"index")}"> Logout</a></li>
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
							<li><a href="${ createLink(controller:"Login",action:"index")}"> Login</a></li>
						</sec:ifNotLoggedIn>
					</ul>
				</div>
			</div>
			<div class="row" style="overflow-y: auto; min-height: 400px;">
				<g:layoutBody/>
			</div>
		</div>
	</body>
</html>
