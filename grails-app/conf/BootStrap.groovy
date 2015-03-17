import organizadorderegalos.Empleado
import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole
import organizadorderegalos.Empresa

class BootStrap {
	
    def init = { servletContext ->

		def empresaRoot = new Empresa(razon_social: "ROOT SRL",cuit: 000000000);
		empresaRoot.save(flush: true,failOnError: true);

		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true,failOnError: true);
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
		def adminUser = new User(username: 'root', password: 'Meli2014');

		empresaRoot.addToAdmins(adminUser);
		empresaRoot.save(flush: true,failOnError: true);
		
		adminUser.save(flush: true,failOnError: true);
		UserRole.create(adminUser, adminRole, true);
    }
	
    def destroy = {

    }
	
}
