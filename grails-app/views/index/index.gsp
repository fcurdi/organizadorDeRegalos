<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="col-md-12">
			<g:set var="titulo" value="Home" scope="request"/>
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
						<g:if test="${ regalos.isEmpty() }">
						     </tbody>
						     </table>
						     <div id="error">
						     	No hay regalos aún
						     </div>
						</g:if>
						<g:else>
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
				</g:else>
			</div>
		</div>
	</body>
</html>
