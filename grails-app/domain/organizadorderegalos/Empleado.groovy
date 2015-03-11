package organizadorderegalos

import grails.rest.*
@Resource(uri="/api/empleados")
class Empleado {
	String dni
	String nombre
	String apellido
	Calendar fechaNacimiento
	static hasMany = [regalos: Regalo]
	
    static constraints = {
		dni unique:true
    }
	
}