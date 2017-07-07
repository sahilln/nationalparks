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
    		
    		<c:url value="/img/logo.png" var="logoSrc" />
       
        		<img id="logo" src="${logoSrc}"  />
      
 	
 		<c:url value="/homePage" var ="homePage"/>
        <c:url value="/surveyInput" var ="survey"/>
        
          
    </header>
    <nav id="navbar">
        <ul id="links">
            <li><a href="${homePage }">Home</a></li>
            <li><a href="${survey}">Survey</a></li>
       
        </ul>
    </nav>