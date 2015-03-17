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

		def miEmpresaRole = new Role(authority: 'ROLE_ADMIN').save(flush: true);
		def miEmpresaUser = new User(username: input_rs, password: "123456");
		miEmpresaUser.save(flush: true, failOnError: true);

		UserRole.create(miEmpresaUser, miEmpresaRole, true);

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
        miEmpresa.delete(flush: true, failOnError: true);
        redirect(controller: "Empresa", action: "index");
    }
}
