
<%@ page import="applicationquestionreponse.Simple" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'simple.label', default: 'Simple')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-simple" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-simple" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="commentaire" title="${message(code: 'simple.commentaire.label', default: 'Commentaire')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'simple.date.label', default: 'Date')}" />
					
						<th><g:message code="simple.enseignant.label" default="Enseignant" /></th>
					
						<g:sortableColumn property="etat" title="${message(code: 'simple.etat.label', default: 'Etat')}" />
					
						<g:sortableColumn property="question" title="${message(code: 'simple.question.label', default: 'Question')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'simple.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${simpleInstanceList}" status="i" var="simpleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${simpleInstance.id}">${fieldValue(bean: simpleInstance, field: "commentaire")}</g:link></td>
					
						<td><g:formatDate date="${simpleInstance.date}" /></td>
					
						<td>${fieldValue(bean: simpleInstance, field: "enseignant")}</td>
					
						<td>${fieldValue(bean: simpleInstance, field: "etat")}</td>
					
						<td>${fieldValue(bean: simpleInstance, field: "question")}</td>
					
						<td>${fieldValue(bean: simpleInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${simpleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
