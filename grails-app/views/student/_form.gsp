<%@ page import="applicationquestionreponse.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="student.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${studentInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="student.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${studentInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'pwd', 'error')} ">
	<label for="pwd">
		<g:message code="student.pwd.label" default="Pwd" />
		
	</label>
	<g:textField name="pwd" maxlength="10" value="${studentInstance?.pwd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="student.role.label" default="Role" />
		
	</label>
	<g:select name="role" from="${studentInstance.constraints.role.inList}" value="${studentInstance?.role}" valueMessagePrefix="student.role" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="student.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${studentInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'reponse', 'error')} ">
	<label for="reponse">
		<g:message code="student.reponse.label" default="Reponse" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.reponse?}" var="r">
    <li><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reponse" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reponse.label', default: 'Reponse')])}</g:link>
</li>
</ul>

</div>

