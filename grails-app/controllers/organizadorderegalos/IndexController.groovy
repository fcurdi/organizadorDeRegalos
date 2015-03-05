package organizadorderegalos

class IndexController {

    def index() {
		[regalos: Regalo.list(), empleados: Empleado.list()]
	}
}
