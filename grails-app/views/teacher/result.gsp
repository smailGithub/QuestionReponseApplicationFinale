<%@ page import="applicationquestionreponse.Reponse" %>
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
		${question?.type}
		<g:if test="${question?.type=="QCM"}">
		<g:calculQCM attrs="${session.user.id}"></g:calculQCM>
		</g:if>
		<g:if test="${question?.type=="TrueFalse"}">
		<g:calculTrueFalse attrs="${session.user.id}"></g:calculTrueFalse>
		</g:if>
		<g:if test="${question?.type=="Simple"}">
		<g:calculSimple attrs="${session.user.id}"></g:calculSimple>
		<br>
		Choisir parmis ces réponses et créer un QCM : 
		<div id="qcm">
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
		
		</g:if>
		</div>
	</body>
</html>
