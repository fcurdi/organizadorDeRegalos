package organizadorderegalos
import grails.rest.*

@Resource(uri="/api/empleados")
class Empleado {
	String dni
	String nombre
	String apellido
	Date fechaNacimiento

	static hasMany = [regalos: Regalo]
	static belongsTo = [empresa: Empresa]
	
    static constraints = {
		dni unique:true
		dni size:7..8
		nombre validator:{
			it==~/^[A-Za-z\s]+$/
		}
		apellido validator:{
			it==~/^[A-Za-z\s]+$/
		}
    }
	
}