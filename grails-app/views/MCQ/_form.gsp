<%@ page import="applicationquestionreponse.MCQ" %>



<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="MCQ.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textField name="commentaire" value="${MCQInstance?.commentaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="MCQ.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${MCQInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'enseignant', 'error')} required">
	<label for="enseignant">
		<g:message code="MCQ.enseignant.label" default="Enseignant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enseignant" name="enseignant.id" from="${applicationquestionreponse.Teacher.list()}" optionKey="id" required="" value="${MCQInstance?.enseignant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'etat', 'error')} ">
	<label for="etat">
		<g:message code="MCQ.etat.label" default="Etat" />
		
	</label>
	<g:textField name="etat" value="${MCQInstance?.etat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="MCQ.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${MCQInstance?.question}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'r1', 'error')} ">
	<label for="r1">
		<g:message code="MCQ.r1.label" default="R1" />
		
	</label>
	<g:textField name="r1" value="${MCQInstance?.r1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'r2', 'error')} ">
	<label for="r2">
		<g:message code="MCQ.r2.label" default="R2" />
		
	</label>
	<g:textField name="r2" value="${MCQInstance?.r2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'r3', 'error')} ">
	<label for="r3">
		<g:message code="MCQ.r3.label" default="R3" />
		
	</label>
	<g:textField name="r3" value="${MCQInstance?.r3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'r4', 'error')} ">
	<label for="r4">
		<g:message code="MCQ.r4.label" default="R4" />
		
	</label>
	<g:textField name="r4" value="${MCQInstance?.r4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'reponse', 'error')} ">
	<label for="reponse">
		<g:message code="MCQ.reponse.label" default="Reponse" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${MCQInstance?.reponse?}" var="r">
    <li><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reponse" action="create" params="['MCQ.id': MCQInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reponse.label', default: 'Reponse')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: MCQInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="MCQ.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${MCQInstance?.type}"/>
</div>

