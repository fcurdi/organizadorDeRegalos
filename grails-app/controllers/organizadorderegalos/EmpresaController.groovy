package organizadorderegalos
import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole
import grails.plugin.springsecurity.annotation.*

@Secured(['ROLE_ADMIN'])
class EmpresaController {

    def index() {
    	[lista_empresas: Empresa.list()]
    }

    def crearEmpresa() {
    	def input = params.input_rs as String;
    	def miEmpresa = new Empresa(razon_social: input);
    	miEmpresa.save(flush: true);

		def miEmpresaRole = new Role(authority: 'ROLE_ADMIN').save(flush: true);
		def miEmpresaUser = new User(username: input, password: "123456");
		miEmpresaUser.save(flush: true);

		UserRole.create(miEmpresaUser, miEmpresaRole, true);

    	redirect(controller: "Empresa", action: "index");
    }
}
