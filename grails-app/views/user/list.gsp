
<%@ page import="applicationquestionreponse.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'user.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="prenom" title="${message(code: 'user.prenom.label', default: 'Prenom')}" />
					
						<g:sortableColumn property="pwd" title="${message(code: 'user.pwd.label', default: 'Pwd')}" />
					
						<g:sortableColumn property="role" title="${message(code: 'user.role.label', default: 'Role')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'user.mail.label', default: 'Mail')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: userInstance, field: "prenom")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "pwd")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "mail")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
