
<%@ page import="applicationquestionreponse.Teacher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teacher.label', default: 'Teacher')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-teacher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-teacher" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list teacher">
			
				<g:if test="${teacherInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="teacher.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${teacherInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teacherInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="teacher.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${teacherInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teacherInstance?.pwd}">
				<li class="fieldcontain">
					<span id="pwd-label" class="property-label"><g:message code="teacher.pwd.label" default="Pwd" /></span>
					
						<span class="property-value" aria-labelledby="pwd-label"><g:fieldValue bean="${teacherInstance}" field="pwd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teacherInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="teacher.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${teacherInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teacherInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="teacher.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${teacherInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teacherInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="teacher.question.label" default="Question" /></span>
					
						<g:each in="${teacherInstance.question}" var="q">
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${teacherInstance?.id}" />
					<g:link class="edit" action="edit" id="${teacherInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
