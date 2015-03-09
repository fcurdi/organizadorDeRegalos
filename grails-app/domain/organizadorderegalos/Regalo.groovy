package organizadorderegalos

class Regalo {
	String titulo
	String url
	String thumbnail
	int	anio
	String idMLA //Me disculpo, esto es un asco
	static belongsTo = [empleado: Empleado]
	
    static constraints = {
		anio unique:true
    }
}
