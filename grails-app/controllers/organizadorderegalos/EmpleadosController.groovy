package organizadorderegalos

class EmpleadosController {

    def index() {
		[empleados: Empleado.list()]
	}
	
	def busqueda(){
		
	}
	
	def crearEmpleado(){
		
	}
	
	def guardarEmpleado(){
		 Empleado nuevo=new Empleado(nombre:params.nombre,apellido:params.apellido,
			 dni:params.dni,fechaNacimiento:params.fecha);
		 nuevo.save();
	}
}
