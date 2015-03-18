package organizadorderegalos
import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole
import grails.plugin.springsecurity.annotation.*
import grails.converters.JSON

@Secured(['ROLE_ADMIN'])
class EmpresaController {


    def index() {
    	[lista_empresas: Empresa.list()]
    }

    def crearEmpresa() {
        def input_rs = params.input_rs as String;
    	def input_cuit = params.input_cuit as String;
    	def miEmpresa = new Empresa(razon_social: input_rs, cuit: input_cuit);
    	miEmpresa.save(flush: true, failOnError: true);

		def miEmpresaUser = new User(username: input_rs, password: "123456");
		miEmpresa.addToAdmins(miEmpresaUser);
        miEmpresa.save(flush: true, failOnError: true);

        miEmpresaUser.save(flush: true, failOnError: true);
        Role r = Role.list().find{it.authority == "ROLE_EMPRESA"};
		UserRole.create(miEmpresaUser, r, true);
    	redirect(controller: "Empresa", action: "index");

    }

    def datosEmpresa(long id) {
        render Empresa.get(id) as JSON;
    }

    def editarEmpresa(long id) {
        def miEmpresa = Empresa.get(id);
        miEmpresa.razon_social = params.input_rs;
        miEmpresa.cuit = params.input_cuit;
        miEmpresa.save(flush: true, failOnError: true);
        redirect(controller: "Empresa", action: "index");
    }

    def eliminarEmpresa(long id) {
        def miEmpresa = Empresa.get(id);
        //saco roles de los User (sino al eliminarlo trae problemas)
        //eliminar la empresa elimina todos los User (por el belongsTo y hasmany)
        for(admins in miEmpresa.admins){ 
            UserRole.removeAll(admins, true);
        }
        miEmpresa.delete(flush: true, failOnError: true);
        redirect(controller: "Empresa", action: "index");
    }
}
