<%@ page import="applicationquestionreponse.TrueFalse" %>



<div class="fieldcontain ${hasErrors(bean: trueFalseInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="trueFalse.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textField name="commentaire" value="${trueFalseInstance?.commentaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trueFalseInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="trueFalse.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${trueFalseInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: trueFalseInstance, field: 'enseignant', 'error')} required">
	<label for="enseignant">
		<g:message code="trueFalse.enseignant.label" default="Enseignant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enseignant" name="enseignant.id" from="${applicationquestionreponse.Teacher.list()}" optionKey="id" required="" value="${trueFalseInstance?.enseignant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trueFalseInstance, field: 'etat', 'error')} ">
	<label for="etat">
		<g:message code="trueFalse.etat.label" default="Etat" />
		
	</label>
	<g:textField name="etat" value="${trueFalseInstance?.etat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trueFalseInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="trueFalse.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${trueFalseInstance?.question}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trueFalseInstance, field: 'reponse', 'error')} ">
	<label for="reponse">
		<g:message code="trueFalse.reponse.label" default="Reponse" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${trueFalseInstance?.reponse?}" var="r">
    <li><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reponse" action="create" params="['trueFalse.id': trueFalseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reponse.label', default: 'Reponse')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: trueFalseInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="trueFalse.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${trueFalseInstance?.type}"/>
</div>

