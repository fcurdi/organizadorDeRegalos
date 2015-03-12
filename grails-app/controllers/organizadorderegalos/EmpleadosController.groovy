package organizadorderegalos

class EmpleadosController {

    def index() {
		[empleados: Empleado.list()]
	}
	
	def crearEmpleado(){
		
	}
	
	def guardarEmpleado(){
		if (!Empleado.findByDni(params.dni)){
			def aniomesdia=params.fecha.split("-").collect{Integer.parseInt(it)}
			def fecha=new Date()
			
			fecha.set(year:aniomesdia[0],month:aniomesdia[1]-1,date:aniomesdia[2])
			println fecha
			Empleado nuevo=new Empleado(nombre:params.nombre,apellido:params.apellido,
				dni:params.dni,fechaNacimiento:fecha)
			nuevo.save(flush: true, failOnError: true)
			println "erer"
		}
		redirect(controller:"index",action:"index")
	}
	
	def guardarEmpleadoEditado(){
		def empleado=Empleado.get(params.idEmpleado)
		if(params.nombre!="" && params.nombre!=null){
			empleado.nombre=params.nombre	
		}
		if(params.apellido!="" && params.apellido!=null){
			empleado.apellido=params.apellido
		}
		if(params.dni!="" && params.dni!=null && !Empleado.findByDni(params.dni)){
			empleado.dni=params.dni
		}
		if(params.fecha!="" && params.fecha!=null){
			def aniomesdia=params.fecha.split("-").collect{Integer.parseInt(it)}
			def fecha=new Date()
			fecha.set(year:aniomesdia[0],month:aniomesdia[1]-1,date:aniomesdia[2])
			empleado.fechaNacimiento=fecha
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
