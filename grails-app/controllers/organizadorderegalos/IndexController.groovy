package organizadorderegalos

class IndexController {

	def reporteService

    def index() {
    	def today = new Date()
		[regalos: Regalo.list().findAll{
			it.anio==today.year+1900 &&
			it.empleado.fechaNacimiento.date==today.date &&
			it.empleado.fechaNacimiento.month==today.month},
		empleados: Empleado.list()]
	}

	def mandarMail(){
		reporteService.mandarMail()
	}
}
