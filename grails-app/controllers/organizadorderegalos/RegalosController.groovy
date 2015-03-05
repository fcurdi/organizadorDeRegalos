package organizadorderegalos

class RegalosController {

    def index() { }
	
	def busqueda(){
		[empleados:Empleado.list()]
	}
	
}
