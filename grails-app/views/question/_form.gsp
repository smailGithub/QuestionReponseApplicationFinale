<%@ page import="applicationquestionreponse.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="question.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textField name="commentaire" value="${questionInstance?.commentaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="question.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${questionInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'enseignant', 'error')} required">
	<label for="enseignant">
		<g:message code="question.enseignant.label" default="Enseignant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enseignant" name="enseignant.id" from="${applicationquestionreponse.Teacher.list()}" optionKey="id" required="" value="${questionInstance?.enseignant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'etat', 'error')} ">
	<label for="etat">
		<g:message code="question.etat.label" default="Etat" />
		
	</label>
	<g:textField name="etat" value="${questionInstance?.etat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="question.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${questionInstance?.question}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'reponse', 'error')} ">
	<label for="reponse">
		<g:message code="question.reponse.label" default="Reponse" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.reponse?}" var="r">
    <li><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reponse" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reponse.label', default: 'Reponse')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="question.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${questionInstance?.type}"/>
</div>

