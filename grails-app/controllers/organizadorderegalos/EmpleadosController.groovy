package organizadorderegalos

class EmpleadosController {

    def index() {
		[empleados: Empleado.list()]
	}
	
	def crearEmpleado(){
		
	}
	
	def guardarEmpleado(){
		Calendar c = Calendar.getInstance();
		def aniomesdia=params.fecha.split("-").collect{Integer.parseInt(it)};
		c.set(aniomesdia[0],aniomesdia[1]-1,aniomesdia[2]);
		
		 Empleado nuevo=new Empleado(nombre:params.nombre,apellido:params.apellido,
			 dni:params.dni,fechaNacimiento:c);
		 nuevo.save();
	}
	
	def guardarEmpleadoEditado(){
		def empleado=Empleado.get(params.idEmpleado)
		if(params.nombre!="" && params.nombre!=null){
			empleado.nombre=params.nombre	
		}
		if(params.apellido!="" && params.apellido!=null){
			empleado.apellido=params.apellido
		}
		if(params.dni!="" && params.dni!=null){
			empleado.dni=params.dni
		}
		if(params.fecha!="" && params.fecha!=null){
			Calendar c = Calendar.getInstance()
			def aniomesdia=params.fecha.split("-").collect{Integer.parseInt(it)}
			c.set(aniomesdia[0],aniomesdia[1]-1,aniomesdia[2])
			empleado.fechaNacimiento=c
		}
		if(!empleado.save(flush: true, failOnError: true))println("se rompio loco, no pudo guardar el empleado editado")
		redirect(controller:"index",action:"index")
	}
	
	def elegirEmpleado(){
		[empleados:Empleado.list()]
	}
	
	def accionEmpleado(){
		switch(params.accion){
			case "editar":
				redirect(controller:"empleados",action:"editarEmpleado",params:params);
				break;
			case "eliminar":
				redirect(controller:"empleados",action:"eliminarEmpleado",params:params);
				break;
		}	
	}
	
	def eliminarEmpleado(){
		def empleado=Empleado.get(params.idEmpleado)
		empleado.delete(flush:true)
		redirect(controller:"index",action:"index")
	}
	
	def editarEmpleado(){
		[empleado:Empleado.get(params.idEmpleado)]
	}
}
