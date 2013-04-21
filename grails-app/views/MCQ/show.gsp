
<%@ page import="applicationquestionreponse.MCQ" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'MCQ.label', default: 'MCQ')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-MCQ" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-MCQ" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list MCQ">
			
				<g:if test="${MCQInstance?.commentaire}">
				<li class="fieldcontain">
					<span id="commentaire-label" class="property-label"><g:message code="MCQ.commentaire.label" default="Commentaire" /></span>
					
						<span class="property-value" aria-labelledby="commentaire-label"><g:fieldValue bean="${MCQInstance}" field="commentaire"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="MCQ.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${MCQInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.enseignant}">
				<li class="fieldcontain">
					<span id="enseignant-label" class="property-label"><g:message code="MCQ.enseignant.label" default="Enseignant" /></span>
					
						<span class="property-value" aria-labelledby="enseignant-label"><g:link controller="teacher" action="show" id="${MCQInstance?.enseignant?.id}">${MCQInstance?.enseignant?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.etat}">
				<li class="fieldcontain">
					<span id="etat-label" class="property-label"><g:message code="MCQ.etat.label" default="Etat" /></span>
					
						<span class="property-value" aria-labelledby="etat-label"><g:fieldValue bean="${MCQInstance}" field="etat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="MCQ.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${MCQInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.r1}">
				<li class="fieldcontain">
					<span id="r1-label" class="property-label"><g:message code="MCQ.r1.label" default="R1" /></span>
					
						<span class="property-value" aria-labelledby="r1-label"><g:fieldValue bean="${MCQInstance}" field="r1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.r2}">
				<li class="fieldcontain">
					<span id="r2-label" class="property-label"><g:message code="MCQ.r2.label" default="R2" /></span>
					
						<span class="property-value" aria-labelledby="r2-label"><g:fieldValue bean="${MCQInstance}" field="r2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.r3}">
				<li class="fieldcontain">
					<span id="r3-label" class="property-label"><g:message code="MCQ.r3.label" default="R3" /></span>
					
						<span class="property-value" aria-labelledby="r3-label"><g:fieldValue bean="${MCQInstance}" field="r3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.r4}">
				<li class="fieldcontain">
					<span id="r4-label" class="property-label"><g:message code="MCQ.r4.label" default="R4" /></span>
					
						<span class="property-value" aria-labelledby="r4-label"><g:fieldValue bean="${MCQInstance}" field="r4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.reponse}">
				<li class="fieldcontain">
					<span id="reponse-label" class="property-label"><g:message code="MCQ.reponse.label" default="Reponse" /></span>
					
						<g:each in="${MCQInstance.reponse}" var="r">
						<span class="property-value" aria-labelledby="reponse-label"><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${MCQInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="MCQ.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${MCQInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${MCQInstance?.id}" />
					<g:link class="edit" action="edit" id="${MCQInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
