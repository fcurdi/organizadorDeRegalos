package organizadorderegalos
import com.testapp.User
import grails.plugin.springsecurity.annotation.*
import organizadorderegalos.Empresa
import com.testapp.Role
import com.testapp.UserRole
import grails.converters.JSON

@Secured(['ROLE_ADMIN'])
class AdministradoresController {

    def index() {
    	[listaAdmins: User.list(),listaEmpresas: Empresa.list()];
    }

    def crearAdmin(){

    	def miEmpresa = Empresa.get(params.long("idEmpresa"));
    	User admin = new User(username: params.input_nombre, password: params.input_password);
    	
    	miEmpresa.addToAdmins(admin);
    	miEmpresa.save(flush:true, fileOnError: true);
    	
    	admin.save(flush:true, fileOnError: true);

        Role r = Role.list().find{it.authority == "ROLE_EMPRESA"};
		UserRole.create(admin, r, true);

    	redirect(controller: "Administradores", action: "index");

    }


    def editarAdmin(long id){
    	User admin = User.get(id);
    	admin.username = params.input_nombre;
    	admin.password = params.input_password;
    	admin.save(flush: true, failOnError: true);
    	redirect(controller: "Administradores", action: "index" );
    }

    def eliminarAdmin(long id){
    	User admin = User.get(id);
    	UserRole.removeAll(admin, true);
    	admin.empresa.removeFromAdmins(admin);
    	admin.delete(flush: true, failOnError: true);
    	redirect(controller: "Administradores", action: "index" );

    }

    def datosAdmin(long id){
    	render User.get(id) as JSON;
    }


}
