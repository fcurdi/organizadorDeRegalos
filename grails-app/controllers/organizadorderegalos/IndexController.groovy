package organizadorderegalos

class IndexController {

    def index() {
		[regalos: Regalo.list(), empleados: Empleado.list()]
	}
	
	def mandarMail(){
		def hoy=new Date()
		def gasto=Regalo.list().findAll{it.empleado.fechaNacimiento.get(Calendar.MONTH)==(hoy.month) && 
			it.anio==(hoy.getYear())+1900}.sum{it.costo}
		if(gasto==null)gasto=0;
		println gasto
		sendMail {
			to "eric.brandwein@mercadolibre.com"
			subject "Gasto de dinero en regalos Mes "+((new Date()).month+1)
			body ('Este mes se gastaran '+gasto.toString())
		  }
		println hoy.getYear()+1900
		//Regalo.list().each{println it.empleado.fechaNacimiento.get(Calendar.MONTH)}
		println hoy.month
	}
}
