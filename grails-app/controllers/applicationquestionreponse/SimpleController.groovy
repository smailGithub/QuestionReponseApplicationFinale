package applicationquestionreponse

import org.springframework.dao.DataIntegrityViolationException

class SimpleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [simpleInstanceList: Simple.list(params), simpleInstanceTotal: Simple.count()]
    }

    def create() {
        [simpleInstance: new Simple(params)]
    }

    def save() {
		params.date = new Date()
        def simpleInstance = new Simple(params)
        if (!simpleInstance.save(flush: true) ||params.question==null) {
            //render(view: "create", model: [simpleInstance: simpleInstance])
			flash.message=="Erreur création de Question Simple"
			return
        }

        //flash.message = message(code: 'default.created.message', args: [message(code: 'simple.label', default: 'Simple'), simpleInstance.id])
        //redirect(action: "show", id: simpleInstance.id)
		flash.message=="Question Simple créer"
		redirect(controller :"Teacher", action :"homeEnseignant", id :params.enseignant.id)
    }

    def show(Long id) {
        def simpleInstance = Simple.get(id)
        if (!simpleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'simple.label', default: 'Simple'), id])
            redirect(action: "list")
            return
        }

        [simpleInstance: simpleInstance]
    }

    def edit(Long id) {
        def simpleInstance = Simple.get(id)
        if (!simpleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'simple.label', default: 'Simple'), id])
            redirect(action: "list")
            return
        }

        [simpleInstance: simpleInstance]
    }

    def update(Long id, Long version) {
        def simpleInstance = Simple.get(id)
        if (!simpleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'simple.label', default: 'Simple'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (simpleInstance.version > version) {
                simpleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'simple.label', default: 'Simple')] as Object[],
                          "Another user has updated this Simple while you were editing")
                render(view: "edit", model: [simpleInstance: simpleInstance])
                return
            }
        }

        simpleInstance.properties = params

        if (!simpleInstance.save(flush: true)) {
            render(view: "edit", model: [simpleInstance: simpleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'simple.label', default: 'Simple'), simpleInstance.id])
        redirect(action: "show", id: simpleInstance.id)
    }

    def delete(Long id) {
        def simpleInstance = Simple.get(id)
        if (!simpleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'simple.label', default: 'Simple'), id])
            redirect(action: "list")
            return
        }

        try {
            simpleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'simple.label', default: 'Simple'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'simple.label', default: 'Simple'), id])
            redirect(action: "show", id: id)
        }
    }
}
