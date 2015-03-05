package organizadorderegalos

class RegalosController {

    def index() { }
	
	def busqueda(){
		[empleados:Empleado.list()]
	}
	
	def guardarRegalo(){
		Calendar c =(new Date()).toCalendar();
		Regalo nuevo=new Regalo(titulo:params.titulo,url:params.url,
			thumbnail:params.thumbnail,fechaAgregado:c);
		nuevo.addToEmpleado(params.idEmpleado);
		nuevo.save();
	}
	
}
