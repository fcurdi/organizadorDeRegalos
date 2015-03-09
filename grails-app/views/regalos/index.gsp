<html>
	<head>
		<meta charset="utf-8"/>
		<title>Regalos</title>
	</head>
	<body>
		<ul>
			<g:each in="${ regalos }" var="regalo">
				<li>
					${ regalo.titulo }
				</li>
			</g:each>
		</ul>
	</body>
</html>