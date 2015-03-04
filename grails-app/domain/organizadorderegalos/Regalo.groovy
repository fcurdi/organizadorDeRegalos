package organizadorderegalos

class Regalo {
	String titulo
	String url
	String thumbnail
	Date fechaAgregado
	static belongsTo = [empleado: Empleado]
	
    static constraints = {
    }
}
