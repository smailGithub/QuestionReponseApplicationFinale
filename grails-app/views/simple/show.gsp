
<%@ page import="applicationquestionreponse.Simple" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'simple.label', default: 'Simple')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-simple" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-simple" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list simple">
			
				<g:if test="${simpleInstance?.commentaire}">
				<li class="fieldcontain">
					<span id="commentaire-label" class="property-label"><g:message code="simple.commentaire.label" default="Commentaire" /></span>
					
						<span class="property-value" aria-labelledby="commentaire-label"><g:fieldValue bean="${simpleInstance}" field="commentaire"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${simpleInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="simple.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${simpleInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${simpleInstance?.enseignant}">
				<li class="fieldcontain">
					<span id="enseignant-label" class="property-label"><g:message code="simple.enseignant.label" default="Enseignant" /></span>
					
						<span class="property-value" aria-labelledby="enseignant-label"><g:link controller="teacher" action="show" id="${simpleInstance?.enseignant?.id}">${simpleInstance?.enseignant?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${simpleInstance?.etat}">
				<li class="fieldcontain">
					<span id="etat-label" class="property-label"><g:message code="simple.etat.label" default="Etat" /></span>
					
						<span class="property-value" aria-labelledby="etat-label"><g:fieldValue bean="${simpleInstance}" field="etat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${simpleInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="simple.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${simpleInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${simpleInstance?.reponse}">
				<li class="fieldcontain">
					<span id="reponse-label" class="property-label"><g:message code="simple.reponse.label" default="Reponse" /></span>
					
						<g:each in="${simpleInstance.reponse}" var="r">
						<span class="property-value" aria-labelledby="reponse-label"><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${simpleInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="simple.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${simpleInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${simpleInstance?.id}" />
					<g:link class="edit" action="edit" id="${simpleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
