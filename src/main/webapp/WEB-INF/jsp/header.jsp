<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>National Park Geek</title>
<c:url value="/css/npgeek.css" var="cssHref" />
<link rel="stylesheet" href="${cssHref}">
</head>

<body>
	<header>
		<div id="header">

			<c:url value="/homePage" var="homePage" />

			<h1>NATIONAL PARKS</h1>
			<h3>Your guide to exploring America's protected lands.</h3>
	
			
			<c:url value="/homePage" var="homePage" />
			<c:url value="/surveyInput" var="survey" />

			<nav id="navbar">
				<ul id="links">

					<li><a href="${homePage}">Home</a></li>
					<li><a href="${survey}">Survey</a></li>

				</ul>
			</nav>

		</div>
	</header>