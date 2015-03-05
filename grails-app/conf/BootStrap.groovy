import organizadorderegalos.Empleado

class BootStrap {
	
	def crearEmpleados() {
		def emp1 = new Empleado(dni: "37345695", nombre: "Diego", apellido: "Garcia", fechaNacimiento: "04/03/1993")
		emp1.save()
	}
	
    def init = { servletContext ->
		crearEmpleados()
    }
	
    def destroy = {
    }
	
}
