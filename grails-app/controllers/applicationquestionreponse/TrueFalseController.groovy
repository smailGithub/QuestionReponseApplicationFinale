package applicationquestionreponse

import org.springframework.dao.DataIntegrityViolationException

class TrueFalseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [trueFalseInstanceList: TrueFalse.list(params), trueFalseInstanceTotal: TrueFalse.count()]
    }

    def create() {
        [trueFalseInstance: new TrueFalse(params)]
    }

    def save() {
		params.date = new Date()
        def trueFalseInstance = new TrueFalse(params)
        if (!trueFalseInstance.save(flush: true) || params.question==null) {
            //render(view: "create", model: [trueFalseInstance: trueFalseInstance])
			flash.message=="Erreur création de TrueFalse"
			return
        }

        //flash.message = message(code: 'default.created.message', args: [message(code: 'trueFalse.label', default: 'TrueFalse'), trueFalseInstance.id])
        //redirect(action: "show", id: trueFalseInstance.id)
		flash.message=="True False créer"
		redirect(controller :"Teacher", action :"homeEnseignant", id :params.enseignant.id)
    }

    def show(Long id) {
        def trueFalseInstance = TrueFalse.get(id)
        if (!trueFalseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trueFalse.label', default: 'TrueFalse'), id])
            redirect(action: "list")
            return
        }

        [trueFalseInstance: trueFalseInstance]
    }

    def edit(Long id) {
        def trueFalseInstance = TrueFalse.get(id)
        if (!trueFalseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trueFalse.label', default: 'TrueFalse'), id])
            redirect(action: "list")
            return
        }

        [trueFalseInstance: trueFalseInstance]
    }

    def update(Long id, Long version) {
        def trueFalseInstance = TrueFalse.get(id)
        if (!trueFalseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trueFalse.label', default: 'TrueFalse'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (trueFalseInstance.version > version) {
                trueFalseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'trueFalse.label', default: 'TrueFalse')] as Object[],
                          "Another user has updated this TrueFalse while you were editing")
                render(view: "edit", model: [trueFalseInstance: trueFalseInstance])
                return
            }
        }

        trueFalseInstance.properties = params

        if (!trueFalseInstance.save(flush: true)) {
            render(view: "edit", model: [trueFalseInstance: trueFalseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'trueFalse.label', default: 'TrueFalse'), trueFalseInstance.id])
        redirect(action: "show", id: trueFalseInstance.id)
    }

    def delete(Long id) {
        def trueFalseInstance = TrueFalse.get(id)
        if (!trueFalseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trueFalse.label', default: 'TrueFalse'), id])
            redirect(action: "list")
            return
        }

        try {
            trueFalseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'trueFalse.label', default: 'TrueFalse'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'trueFalse.label', default: 'TrueFalse'), id])
            redirect(action: "show", id: id)
        }
    }
}
