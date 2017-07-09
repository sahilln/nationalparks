<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
 			
 			<c:url value="/homePage" var ="homePage"/>
 			
 			<h1>NATIONAL PARK SERVICE</h1>
 			
 			<%-- <c:url value="/homePage" var ="homePage"/>
     		<c:url value="/img/logo.png" var="logoSrc" />
       		<a href="${homePage}"><img id="logo" src="${logoSrc}"/></a> --%>
      	
      	</div>     
    </header>