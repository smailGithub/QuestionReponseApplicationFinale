package applicationquestionreponse

import javax.persistence.criteria.CriteriaBuilder;

import org.springframework.dao.DataIntegrityViolationException

class TeacherController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [teacherInstanceList: Teacher.list(params), teacherInstanceTotal: Teacher.count()]
    }

    def create() {
        [teacherInstance: new Teacher(params)]
    }

    def save() {
        def teacherInstance = new Teacher(params)
        if (!teacherInstance.save(flush: true)) {
            render(view: "create", model: [teacherInstance: teacherInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'teacher.label', default: 'Teacher'), teacherInstance.id])
        redirect(action: "show", id: teacherInstance.id)
    }

    def show(Long id) {
        def teacherInstance = Teacher.get(id)
        if (!teacherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), id])
            redirect(action: "list")
            return
        }

        [teacherInstance: teacherInstance]
    }

    def edit(Long id) {
        def teacherInstance = Teacher.get(id)
        if (!teacherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), id])
            redirect(action: "list")
            return
        }

        [teacherInstance: teacherInstance]
    }

    def update(Long id, Long version) {
        def teacherInstance = Teacher.get(id)
        if (!teacherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (teacherInstance.version > version) {
                teacherInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'teacher.label', default: 'Teacher')] as Object[],
                          "Another user has updated this Teacher while you were editing")
                render(view: "edit", model: [teacherInstance: teacherInstance])
                return
            }
        }

        teacherInstance.properties = params

        if (!teacherInstance.save(flush: true)) {
            render(view: "edit", model: [teacherInstance: teacherInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'teacher.label', default: 'Teacher'), teacherInstance.id])
        redirect(action: "show", id: teacherInstance.id)
    }

    def delete(Long id) {
        def teacherInstance = Teacher.get(id)
        if (!teacherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), id])
            redirect(action: "list")
            return
        }

        try {
            teacherInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'teacher.label', default: 'Teacher'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'teacher.label', default: 'Teacher'), id])
            redirect(action: "show", id: id)
        }
    }
	def homeEnseignant(Long id){
		def teacherInstance = Teacher.get(id)
			 if (!teacherInstance) {
				 flash.message = message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), id])
				 redirect(view: "homeEntudiantt")
				 return
			 }
			 [teacherInstance: teacherInstance]
			 }
	def listeQuestion(){
		def questionInstance=criteria.list{
			'in'("teacher_id",question)
			teacher{
				idEq((long)teacherInstance.id)
			}
		render(view: "homeEnseignant", model: [teacherInstance: teacherInstance])
			
		}
	}
	def afficherQuestion(Long id){
		def question=Question.get(id)
		render(view:"afficherReponse", model:[question:question])
	}
	def afficherResultatQCM(Long id){
		def question=Question.get(id)
		render(view:"result", model:[question:question])
	}
	
	def afficherResultatTrueFalse(Long id){
		def question=Question.get(id)
		println question
		render(view:"result", model:[question:question])
	}
	def afficherResultatSimple(Long id){
		def question=Question.get(id)
		render(view:"result", model:[question:question])
	}

}
