package organizadorderegalos

class RegalosController {

    def index() { }
	
	def crearRegalo(){
		[empleados:Empleado.list()]
	}
	
	def guardarRegalo(){
		Regalo nuevo=new Regalo(titulo:params.titulo,url:params.url,
			thumbnail:params.thumbnail,anio:params.anio);
		Empleado.get(params.idEmpleado).addToRegalos(nuevo);
		nuevo.save();
		
		redirect(controller:"index",action:"index");
	}
	
}
