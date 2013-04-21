
<%@ page import="applicationquestionreponse.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-question" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="commentaire" title="${message(code: 'question.commentaire.label', default: 'Commentaire')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'question.date.label', default: 'Date')}" />
					
						<th><g:message code="question.enseignant.label" default="Enseignant" /></th>
					
						<g:sortableColumn property="etat" title="${message(code: 'question.etat.label', default: 'Etat')}" />
					
						<g:sortableColumn property="question" title="${message(code: 'question.question.label', default: 'Question')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'question.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionInstanceList}" status="i" var="questionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "commentaire")}</g:link></td>
					
						<td><g:formatDate date="${questionInstance.date}" /></td>
					
						<td>${fieldValue(bean: questionInstance, field: "enseignant")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "etat")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "question")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
