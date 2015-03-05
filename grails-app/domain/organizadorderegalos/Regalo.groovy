package organizadorderegalos

class Regalo {
	String titulo
	String url
	String thumbnail
	String fechaAgregado
	static belongsTo = [empleado: Empleado]
	
    static constraints = {
    }
}
