<%@ page import="applicationquestionreponse.Teacher" %>



<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="teacher.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${teacherInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="teacher.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${teacherInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'pwd', 'error')} ">
	<label for="pwd">
		<g:message code="teacher.pwd.label" default="Pwd" />
		
	</label>
	<g:textField name="pwd" maxlength="10" value="${teacherInstance?.pwd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="teacher.role.label" default="Role" />
		
	</label>
	<g:select name="role" from="${teacherInstance.constraints.role.inList}" value="${teacherInstance?.role}" valueMessagePrefix="teacher.role" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="teacher.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${teacherInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teacherInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="teacher.question.label" default="Question" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${teacherInstance?.question?}" var="q">
    <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="question" action="create" params="['teacher.id': teacherInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'question.label', default: 'Question')])}</g:link>
</li>
</ul>

</div>

