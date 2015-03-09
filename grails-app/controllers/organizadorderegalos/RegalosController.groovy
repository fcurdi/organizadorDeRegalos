package organizadorderegalos

class RegalosController {

    def index() { }
	
	def crearRegalo(){
		[empleados:Empleado.list()]
	}
	
	def guardarRegalo(){
		
		Regalo nuevo=new Regalo(titulo : params.titulo, url : params.url,
			thumbnail : params.thumbnail, anio : params.anio, empleado_id: params.empleadoId);
		Empleado.get(params.empleadoId).addToRegalos(nuevo);
		nuevo.save();
		println nuevo;
		
	}
	
	def editarRegalo(){
		[regalo:Regalo.get(params.idRegalo)]
	}
	
	def elegirRegalo(){
		[regalos:Regalo.list()]
	}
	
	def accionRegalo(){
		switch(params.accion){
			case "editar":
				redirect(controller:"regalos",action:"editarRegalo",params:params);
				break;
			case "eliminar":
				redirect(controller:"regalos",action:"eliminarRegalo",params:params);
				break;
		}
	}
	
	def eliminarRegalo(){
		def regalo=Regalo.get(params.idRegalo)
		regalo.removeFromEmpleado(regalo.empleado)
		redirect(controller:"index",action:"index")
	}
}