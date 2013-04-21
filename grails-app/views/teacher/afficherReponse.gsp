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
		<g:if test="${question?.type=="Simple"}">
		<g:form controller="Question" action="update" id="${question?.id}" version="${question?.version}">
		<table>
			<tr>
				<td>Ennonce de la question :</td><td>${question?.question}</td>
			</tr>
			<tr>
				<td>Type de la question :</td><td>${question?.type}</td>
			</tr>
			<g:if test="${question?.etat=="En cours"}">
			<tr>
				<input type="hidden" name="etat" value="Cloturer">
				<td colspan="2"><center><input type="submit" value="Cloturer"></center></td>
			</tr>
			</g:if>
			<g:if test="${question?.etat=="Cloturer"}">
			<tr>
				<td>Ajouter un commentaire : </td><td><input type="text" name="commentaire">&nbsp;<input type="submit" value="Ajouter le commentaire">
				<td colspan="2"><g:link controller="Teacher" action="afficherResultatSimple" id="${session.user.id}"><center>Visualiser les résultats</center></g:link></td>
			</tr>
			</g:if>
		</table>
		</g:form>
		</g:if>
		<g:if test="${question?.type=="TrueFalse"}">
		<g:form controller="Question" action="update" id="${question?.id}" version="${question?.version}">
		<table>
			<tr>
				<td>Ennonce de la question :</td><td>${question?.question}</td>
			</tr>
			<tr>
				<td>Type de la question :</td><td>${question?.type}</td>
			</tr>
			<g:if test="${question?.etat=="En cours"}">
			<tr>
				<input type="hidden" name="etat" value="Cloturer">
				<td colspan="2"><center><input type="submit" value="Cloturer"></center></td>
			</tr>
			</g:if>
			<g:if test="${question?.etat=="Cloturer"}">
			<tr>
				<td>Ajouter un commentaire : </td><td><input type="text" name="commentaire">&nbsp;<input type="submit" value="Ajouter le commentaire">
				<td colspan="2"><g:link controller="Teacher" action="afficherResultatTrueFalse" id="${session.user.id}"><center>Visualiser les résultats</center></g:link></td>
			</tr>
			</g:if>
		</table>
		</g:form>
		</g:if>
		<g:if test="${question?.type=="QCM"}">
		<g:form controller="Question" action="update" id="${question?.id}" version="${question?.version}">
		<table>
			<tr>
				<td>Ennonce de la question : </td><td>${question?.question}</td>
			</tr>
			<tr>
				<td>Type de la question :</td><td>${question?.type}</td>
			</tr>
			<tr>
				<td>Choix 1 : </td><td> ${question?.r1}</td>
			</tr>
			<tr>
				<td>Choix 2 : </td><td> ${question?.r2}</td>
			</tr>
			<tr>
				<td>Choix 3 : </td><td> ${question?.r3}</td>
			</tr>
			<tr>
				<td>Choix 4 : </td><td> ${question?.r4}</td>
			</tr>
			<g:if test="${question?.etat=="En cours"}">
			<tr>
				<input type="hidden" name="etat" value="Cloturer">
				<td colspan="2"><center><input type="submit" value="Cloturer"></center></td>
			</tr>
			</g:if>
			<g:if test="${question?.etat=="Cloturer"}">
			<tr>
				<td>Ajouter un commentaire : </td><td><input type="text" name="commentaire">&nbsp;<input type="submit" value="Ajouter le commentaire">
				<td colspan="2"><g:link controller="Teacher" action="afficherResultatQCM" id="${session.user.id}"><center>Visualiser les résultats</center></g:link></td>
			</tr>
			</g:if>
			</table>
		</g:form>
		</g:if>
		</div>
	</body>
</html>
