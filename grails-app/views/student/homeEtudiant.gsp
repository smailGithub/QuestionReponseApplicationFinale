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
		Liste des questions cloturer :
		<br>
		<div id="listeQuestion">
		<g:each var="q" in="${Question.findAllByEtat("Cloturer")}">
		<ul>
		<li><g:link controller="Question" action="show" id="${q.id}">${q.question}</g:link></li>
		</ul>
		</g:each>
		</div>
		Liste des questions non cloturer :
		<br>
		<div id="listeQuestion">
		<g:each var="q" in="${Question.findAllByEtat("En cours")}">
		<ul>
		<li><g:link controller="Student" action="ajouterReponse" id="${q.id}">${q.question}</g:link></li>
		</ul>
		</g:each>
		</div>
		</div>
	</body>
</html>
