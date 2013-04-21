<%@ page import="applicationquestionreponse.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enseignant.label', default: 'Enseignant')}" />
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
			#listeQuestionCloturer{
			margin:auto;
			width:40%;
			border:1px solid black;
			padding:10px;
			margin-bottom:10px;
			}
			#listeQuestionNonCloturer{
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
		Liste de vos questions cloturer :
		<br>
		<div id="listeQuestionCloturer">
		<g:each var="q" in="${teacherInstance.question}">
		<g:if test="${q.etat=="Cloturer"}">
		<ul>
		<g:link controller="Teacher" action="afficherQuestion" id="${q.id}">${q.question}</g:link></li>
		</ul>
		</g:if>
		</g:each>
		</div>
		Liste de vos questions non cloturer :
		<br>
		<div id="listeQuestionNonCloturer">
		<g:each var="q" in="${teacherInstance.question}">
		<g:if  test="${q.etat=="En cours" }">
		<ul>
		<g:link controller="Teacher" action="afficherQuestion" id="${q.id}">${q.question}</g:link></li>
		</ul>
		</g:if>
		</g:each>
		</div>
		<div id="message">
		${flash.message}
		</div>
		<div id="left">
		<div id="qcm">
		<center>Créer un QCM :</center>
		<g:form controller="MCQ" action="save">
		<input type="hidden" name="etat" value="En cours"/>
		<input type="hidden" name="commentaire" value="Pas de commentaire"/>
		<input type="hidden" name="enseignant.id" value="${session.user.id}"/>
		<input type="hidden" name="type" value="QCM"/>
		
		<table>
			<tr>
				<td>Question : </td><td><input type="text" name="question"/></td>
			</tr>
			<tr>
				<td>Réponse 1 : </td><td><input type="text" name="r1"/></td>
			</tr>
			<tr>
				<td>Réponse 2: </td><td><input type="text" name="r2"/></td>
			</tr>
			<tr>
				<td>Réponse 3 : </td><td><input type="text" name="r3"/></td>
			</tr>
			<tr>
				<td>Réponse 4 : </td><td><input type="text" name="r4"/></td>
			<tr><td colspan="2"><center><input type="submit" value="Ajouter QCM"></center></td></tr>
		</table>
		</g:form>
		</div>
		</div>
		<div id="right">
		<div id="question">
		<center>Question</center>
		<g:form controller="Simple" action="save">
		<input type="hidden" name="commentaire" value="Pas de commentaire"/>
		<input type="hidden" name="enseignant.id" value="${session.user.id}"/>
		<input type="hidden" name="etat" value="En cours"/>
		<input type="hidden" name="type" value="Simple"/>
		<table>
			<tr>
				<td>Question : </td><td><input type="text" name="question"></td>
			</tr>
			<tr><td colspan="2"><center><input type="submit" value="Ajouter Question"></center></td></tr>
		</table>
		</g:form>
		</div>
		<br>
		<div id="truefalse">
		<center>Question True/False : </center>
		<g:form controller="TrueFalse" action="save">
		<input type="hidden" name="commentaire" value="Pas de commentaire"/>
		<input type="hidden" name="etat" value="En cours"/>
		<input type="hidden" name="enseignant.id" value="${session.user.id}"/>
		<input type="hidden" name="type" value="TrueFalse"/>
		<table>
			<tr>
				<td>Question : </td><td><input type="text" name="question"></td>
			</tr>
			<tr><td colspan="2"><center><input type="submit" value="Ajouter True/False"></center></td></tr>
		</table>
		</g:form>
		</div>
		</div>
	</div>
	</body>
</html>
