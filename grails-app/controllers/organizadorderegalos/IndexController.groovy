package organizadorderegalos
import grails.plugin.springsecurity.annotation.*

@Secured(['ROLE_EMPRESA'])
class IndexController {

	def reporteService
	def springSecurityService

	@Secured(['permitAll'])
    def index() {

		def user = springSecurityService.currentUser;
		
		if(user != null) {
			Empresa empresaActual = user.empresa;

	    	def today = new Date()
			[regalos: Regalo.list().findAll{
				it.empleado.empresa.razon_social == empresaActual.razon_social &&
				it.anio==today.year+1900 &&
				it.empleado.fechaNacimiento.date==today.date &&
				it.empleado.fechaNacimiento.month==today.month},
			empleados: Empleado.list()]
		} else {
			def today = new Date()
			[regalos: Regalo.list().findAll{
				it.anio==today.year+1900 &&
				it.empleado.fechaNacimiento.date==today.date &&
				it.empleado.fechaNacimiento.month==today.month},
			empleados: Empleado.list()]
		}
	}

	def mandarMail(){
		reporteService.mandarMail()
	}
}
