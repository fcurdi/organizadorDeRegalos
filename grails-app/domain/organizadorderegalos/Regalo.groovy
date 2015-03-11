package organizadorderegalos

class Regalo {
	String titulo
	String url
	String thumbnail
	int	anio
	String idMLA 
	static belongsTo = [empleado: Empleado]
	
    static constraints = {
    }
}
