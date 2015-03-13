import organizadorderegalos.Empleado
import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole

class BootStrap {
	
    def init = { servletContext ->
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

		def adminUser = new User(username: 'root', password: 'Meli2014')
		adminUser.save(flush: true)

		UserRole.create(adminUser, adminRole, true)
    }
	
    def destroy = {

    }
	
}
