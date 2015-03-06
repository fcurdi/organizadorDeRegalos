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
	
	def elegirRegalo(){
		[regalos:Regalo.list()]
	}
	
	def eliminarRegalo(){
		def regalo=Regalo.get(params.idRegalo)
		regalo.removeFromEmpleado(regalo.empleado)
		redirect(controller:"index",action:"index")
	}
}