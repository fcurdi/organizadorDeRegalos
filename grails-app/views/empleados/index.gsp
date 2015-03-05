<html>
	<head>
		<meta charset="utf-8"/>
		<title>Empleados</title>
	</head>
	<body>
		<ul>
			<g:each in="${ empleados }" var="empleado">
				<li>
					${ empleado.nombre }
				</li>
			</g:each>
		</ul>
	</body>
</html>