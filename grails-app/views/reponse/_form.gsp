<%@ page import="applicationquestionreponse.Reponse" %>



<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'etudiant', 'error')} required">
	<label for="etudiant">
		<g:message code="reponse.etudiant.label" default="Etudiant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="etudiant" name="etudiant.id" from="${applicationquestionreponse.Student.list()}" optionKey="id" required="" value="${reponseInstance?.etudiant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="reponse.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${applicationquestionreponse.Question.list()}" optionKey="id" required="" value="${reponseInstance?.question?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'reponse', 'error')} ">
	<label for="reponse">
		<g:message code="reponse.reponse.label" default="Reponse" />
		
	</label>
	<g:textField name="reponse" value="${reponseInstance?.reponse}"/>
</div>

