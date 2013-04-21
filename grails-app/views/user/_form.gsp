<%@ page import="applicationquestionreponse.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="user.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${userInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="user.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${userInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'pwd', 'error')} ">
	<label for="pwd">
		<g:message code="user.pwd.label" default="Pwd" />
		
	</label>
	<g:textField name="pwd" maxlength="10" value="${userInstance?.pwd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="user.role.label" default="Role" />
		
	</label>
	<g:select name="role" from="${userInstance.constraints.role.inList}" value="${userInstance?.role}" valueMessagePrefix="user.role" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="user.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${userInstance?.mail}"/>
</div>

