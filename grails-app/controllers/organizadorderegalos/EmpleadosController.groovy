package organizadorderegalos

class EmpleadosController {

    def index() {
		[empleados: Empleado.list()]
	}
	
	def crearEmpleado(){
		
	}
	
	def guardarEmpleado(){
		Calendar c = Calendar.getInstance();
		def aniomesdia=params.fecha.split("-").collect{Integer.parseInt(it)};
		c.set(aniomesdia[0],aniomesdia[1],aniomesdia[2]);
		
		 Empleado nuevo=new Empleado(nombre:params.nombre,apellido:params.apellido,
			 dni:params.dni,fechaNacimiento:c);
		 nuevo.save();
	}
}
