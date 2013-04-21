
<%@ page import="applicationquestionreponse.Teacher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teacher.label', default: 'Teacher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-teacher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-teacher" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'teacher.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="prenom" title="${message(code: 'teacher.prenom.label', default: 'Prenom')}" />
					
						<g:sortableColumn property="pwd" title="${message(code: 'teacher.pwd.label', default: 'Pwd')}" />
					
						<g:sortableColumn property="role" title="${message(code: 'teacher.role.label', default: 'Role')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'teacher.mail.label', default: 'Mail')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${teacherInstanceList}" status="i" var="teacherInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${teacherInstance.id}">${fieldValue(bean: teacherInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: teacherInstance, field: "prenom")}</td>
					
						<td>${fieldValue(bean: teacherInstance, field: "pwd")}</td>
					
						<td>${fieldValue(bean: teacherInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: teacherInstance, field: "mail")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${teacherInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
