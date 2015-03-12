package organizadorderegalos

class IndexController {

	def reporteService

    def index() {
		[regalos: Regalo.list(), empleados: Empleado.list()]
	}

	def mandarMail(){
		reporteService.mandarMail()
	}
}
