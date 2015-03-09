package organizadorderegalos

class Regalo {
	String titulo
	String url
	String thumbnail
	int	anio
	String idMLA //Me disculpo, esto es un asco. Culpen a sebas... ehhh no perdon yo soy sebas...creanme
	float costo
	static belongsTo = [empleado: Empleado]
	
    static constraints = {
    }
}
