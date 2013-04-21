
<%@ page import="applicationquestionreponse.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-student" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list student">
			
				<g:if test="${studentInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="student.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${studentInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="student.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${studentInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.pwd}">
				<li class="fieldcontain">
					<span id="pwd-label" class="property-label"><g:message code="student.pwd.label" default="Pwd" /></span>
					
						<span class="property-value" aria-labelledby="pwd-label"><g:fieldValue bean="${studentInstance}" field="pwd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="student.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${studentInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="student.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${studentInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.reponse}">
				<li class="fieldcontain">
					<span id="reponse-label" class="property-label"><g:message code="student.reponse.label" default="Reponse" /></span>
					
						<g:each in="${studentInstance.reponse}" var="r">
						<span class="property-value" aria-labelledby="reponse-label"><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${studentInstance?.id}" />
					<g:link class="edit" action="edit" id="${studentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
