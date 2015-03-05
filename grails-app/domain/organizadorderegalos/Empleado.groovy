package organizadorderegalos

class Empleado {
	String dni
	String nombre
	String apellido
	Date fechaNacimiento
	static hasMany = [regalos: Regalo]
	
    static constraints = {
    }
	
}