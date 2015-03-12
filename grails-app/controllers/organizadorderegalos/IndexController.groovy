package organizadorderegalos

import groovy.json.JsonSlurper

class IndexController {

    def index() {
    	def today = new Date()
		[regalos: Regalo.list().findAll{
			it.anio==today.year &&
			it.empleado.fechaNacimiento.date==today.date &&
			it.empleado.fechaNacimiento.month==today.month},
		empleados: Empleado.list()]
	}
	
	def mandarMail(){
		def hoy=new Date()
		def regalosDelMes=Regalo.list().findAll{it.empleado.fechaNacimiento.get(Calendar.MONTH)==(hoy.month) && 
			it.anio==(hoy.getYear())+1900}
		def gasto=regalosDelMes.collect{regalo ->
			def json =new URL("https://api.mercadolibre.com/items/"+regalo.idMLA)
				.getText(requestProperties:[Accept: "application/json"])
			def precio=new JsonSlurper().parseText(json).price
			return precio
		}.sum{it}
		if(gasto==null)gasto=0;
		println gasto
		sendMail {
			to "eric.brandwein@mercadolibre.com"
			subject "Gasto de dinero en regalos Mes "+((new Date()).month+1)
			body ('Este mes se gastaran '+gasto.toString())
		  }
		println hoy.getYear()+1900
		println hoy.month
	}
}
