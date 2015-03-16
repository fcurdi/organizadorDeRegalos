package organizadorderegalos
import grails.plugin.springsecurity.annotation.*

@Secured(['ROLE_ADMIN'])
class EmpresaController {

    def index() { }

    def crearEmpresa() {}
}
