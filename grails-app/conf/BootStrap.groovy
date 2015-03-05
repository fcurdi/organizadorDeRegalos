import organizadorderegalos.Empleado

class BootStrap {
	
	private def crearEmpleados() {
		Calendar c = Calendar.getInstance();
		c.set(1993, 2, 4);
		def emp1 = new Empleado(dni: "37345695", nombre: "Diego", apellido: "Garcia", fechaNacimiento: c)
		emp1.save(failOnError: true)
	}
	
    def init = { servletContext ->
		crearEmpleados()
    }
	
    def destroy = {
    }
	
}
