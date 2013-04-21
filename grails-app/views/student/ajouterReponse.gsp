<%@ page import="applicationquestionreponse.Student" %>
<%@ page import="applicationquestionreponse.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'etudiant.label', default: 'Etudiant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style type="text/css" media="screen">
			#enTete{
					float:right;
					width:300px;
					height:50px;
			}
			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}
			#main{
				width:100%;
				height:100%;
			}
			#listeQuestion{
			margin:auto;
			width:40%;
			border:1px solid black;
			padding:10px;
			margin-bottom:10px;
			}
			#qcm{
			float:left;
			width:50%;

			}
			#question{
			float:right;
			width:40%;

			}
			#truefalse{
			float:right;
			width:40%;

			}
			#left{
			float:left;
			width:50%;
			}
			#righ{
			float:right;
			width:50%;
			}
		</style>
	</head>
	<body>
		<div id="enTete">
		 &lt;&lt;<g:link>${session.user.nom} ${session.user.prenom}</g:link>&gt;&gt; &nbsp; &lt;&lt;<g:link controller="User" action="logout">Déconnexion</g:link> &gt;&gt;
		</div>
		<div id="main">
		<g:form controller="Reponse" action="save">
		<input type="hidden" name="etudiant.id" value="${session.user.id}">
		<input type="hidden" name="question.id" value="${question?.id}">
		<g:if test="${question?.type=="Simple"}">
		<table>
			<tr>
				<td>Ennonce de la question :</td><td>${question?.question}</td>
			</tr>
			<tr>
				<td>Donnez votre reponse : </td><td><input type="text" name="reponse"></td>
			</tr>
			<tr>
				<td colspan="2"><center><input type="submit" value="Répondre"></center></td>
			</tr>
		</table>
		</g:if>
		<g:if test="${question?.type=="TrueFalse"}">
		<table>
			<tr>
				<td>Ennonce de la question :</td><td>${question?.question}</td>
			</tr>
			<tr>
				<td>Donnez votre reponse : </td><td><input type="radio" name="reponse" value="True">True<input type="radio" name="reponse" value="False">False</td>
			</tr>
			<tr>
				<td colspan="2"><center><input type="submit" value="Répondre"></center></td>
			</tr>
		</table>
		</g:if>
		<g:if test="${question?.type=="QCM"}">
		<table>
			<tr>
				<td>Ennonce de la question :</td><td>${question?.question}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="radio" name="reponse" value="r1">${question?.r1}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="radio" name="reponse" value="r2">${question?.r2}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="radio" name="reponse" value="r3">${question?.r3}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="radio" name="reponse" value="r4">${question?.r4}</td>
			</tr>
			<tr>
				<td colspan="2"><center><input type="submit" value="Répondre"></center></td>
			</tr>
		</table>
		</g:if>
		
		</g:form>
		</div>
	</body>
</html>
