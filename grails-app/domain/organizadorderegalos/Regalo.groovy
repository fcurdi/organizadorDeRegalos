package organizadorderegalos

class Regalo {
	String titulo
	String url
	String thumbnail
	int	anio
	static belongsTo = [empleado: Empleado]
	
    static constraints = {
    }
}
