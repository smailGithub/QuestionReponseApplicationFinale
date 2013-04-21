package applicationquestionreponse

import org.springframework.dao.DataIntegrityViolationException

class MCQController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [MCQInstanceList: MCQ.list(params), MCQInstanceTotal: MCQ.count()]
    }

    def create() {
        [MCQInstance: new MCQ(params)]
    }

    def save() {
		params.date=new Date()
        def MCQInstance = new MCQ(params)
        if (!MCQInstance.save(flush: true || params.question==null)) {
            //render(view: "create", model: [MCQInstance: MCQInstance])
            flash.message=="Erreur création de QCM"
			return
        }

        //flash.message = message(code: 'default.created.message', args: [message(code: 'MCQ.label', default: 'MCQ'), MCQInstance.id])
		flash.message=="QCM créer"
		//redirect(action: "show", id: MCQInstance.id)
		redirect(controller :"Teacher", action :"homeEnseignant", id :params.enseignant.id)
    }

    def show(Long id) {
        def MCQInstance = MCQ.get(id)
        if (!MCQInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'MCQ.label', default: 'MCQ'), id])
            redirect(action: "list")
            return
        }

        [MCQInstance: MCQInstance]
    }

    def edit(Long id) {
        def MCQInstance = MCQ.get(id)
        if (!MCQInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'MCQ.label', default: 'MCQ'), id])
            redirect(action: "list")
            return
        }

        [MCQInstance: MCQInstance]
    }

    def update(Long id, Long version) {
        def MCQInstance = MCQ.get(id)
        if (!MCQInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'MCQ.label', default: 'MCQ'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (MCQInstance.version > version) {
                MCQInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'MCQ.label', default: 'MCQ')] as Object[],
                          "Another user has updated this MCQ while you were editing")
                render(view: "edit", model: [MCQInstance: MCQInstance])
                return
            }
        }

        MCQInstance.properties = params

        if (!MCQInstance.save(flush: true)) {
            render(view: "edit", model: [MCQInstance: MCQInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'MCQ.label', default: 'MCQ'), MCQInstance.id])
        redirect(action: "show", id: MCQInstance.id)
    }

    def delete(Long id) {
        def MCQInstance = MCQ.get(id)
        if (!MCQInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'MCQ.label', default: 'MCQ'), id])
            redirect(action: "list")
            return
        }

        try {
            MCQInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'MCQ.label', default: 'MCQ'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'MCQ.label', default: 'MCQ'), id])
            redirect(action: "show", id: id)
        }
    }
}
