package organizadorderegalos

import grails.rest.*
@Resource(uri="/api/regalos")
class Regalo {
	String titulo
	String url
	String thumbnail
	int	anio
	String idMLA 
	static belongsTo = [empleado: Empleado]
	
    static constraints = {
    	anio unique:'empleado'
    }
}
