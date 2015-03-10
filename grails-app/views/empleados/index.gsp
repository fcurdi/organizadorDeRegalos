<html>
	<head>
		<meta charset="utf-8"/>
		<title>Empleados</title>
	</head>
	<body>
		<a href="${ createLink(controller:"Index",action:"Index")}">Volver a la página principal</a>
		<ul>
			<g:each in="${ empleados }" var="empleado">
				<li>
					${ empleado.nombre }
				</li>
			</g:each>
		</ul>
	</body>
</html>