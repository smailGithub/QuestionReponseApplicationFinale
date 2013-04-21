
<%@ page import="applicationquestionreponse.MCQ" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'MCQ.label', default: 'MCQ')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-MCQ" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-MCQ" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="commentaire" title="${message(code: 'MCQ.commentaire.label', default: 'Commentaire')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'MCQ.date.label', default: 'Date')}" />
					
						<th><g:message code="MCQ.enseignant.label" default="Enseignant" /></th>
					
						<g:sortableColumn property="etat" title="${message(code: 'MCQ.etat.label', default: 'Etat')}" />
					
						<g:sortableColumn property="question" title="${message(code: 'MCQ.question.label', default: 'Question')}" />
					
						<g:sortableColumn property="r1" title="${message(code: 'MCQ.r1.label', default: 'R1')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${MCQInstanceList}" status="i" var="MCQInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${MCQInstance.id}">${fieldValue(bean: MCQInstance, field: "commentaire")}</g:link></td>
					
						<td><g:formatDate date="${MCQInstance.date}" /></td>
					
						<td>${fieldValue(bean: MCQInstance, field: "enseignant")}</td>
					
						<td>${fieldValue(bean: MCQInstance, field: "etat")}</td>
					
						<td>${fieldValue(bean: MCQInstance, field: "question")}</td>
					
						<td>${fieldValue(bean: MCQInstance, field: "r1")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${MCQInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
