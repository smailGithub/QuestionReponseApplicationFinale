<%@ page import="applicationquestionreponse.Simple" %>



<div class="fieldcontain ${hasErrors(bean: simpleInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="simple.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textField name="commentaire" value="${simpleInstance?.commentaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: simpleInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="simple.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${simpleInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: simpleInstance, field: 'enseignant', 'error')} required">
	<label for="enseignant">
		<g:message code="simple.enseignant.label" default="Enseignant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enseignant" name="enseignant.id" from="${applicationquestionreponse.Teacher.list()}" optionKey="id" required="" value="${simpleInstance?.enseignant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: simpleInstance, field: 'etat', 'error')} ">
	<label for="etat">
		<g:message code="simple.etat.label" default="Etat" />
		
	</label>
	<g:textField name="etat" value="${simpleInstance?.etat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: simpleInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="simple.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${simpleInstance?.question}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: simpleInstance, field: 'reponse', 'error')} ">
	<label for="reponse">
		<g:message code="simple.reponse.label" default="Reponse" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${simpleInstance?.reponse?}" var="r">
    <li><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reponse" action="create" params="['simple.id': simpleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reponse.label', default: 'Reponse')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: simpleInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="simple.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${simpleInstance?.type}"/>
</div>

