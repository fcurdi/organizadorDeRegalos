import organizadorderegalos.Empleado

class BootStrap {
	
	private def crearEmpleados() {
		def emp1 = new Empleado(dni: "37345695", nombre: "Diego", apellido: "Garcia", fechaNacimiento: new Date())
		emp1.save(failOnError: true)
	}
	
    def init = { servletContext ->
		crearEmpleados()
    }
	
    def destroy = {
    }
	
}
