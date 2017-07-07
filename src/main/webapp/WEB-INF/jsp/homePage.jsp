<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<html>
<body>
	<div class = "main-section">
	<c:forEach var="park" items="${parkList}">

		<c:set var="parkCode" value="${park.parkCode}" />
		<c:set var="parkCodeLower" value="${fn:toLowerCase(parkCode)}" />
		
		<div id="parkInfo">
		<a href="parkDetail?parkCode=${park.parkCode}&celsius=${celsius}"><img id="homeImage" src="img/parks/${parkCodeLower}.jpg"></a>
		
		
		<p id="parkName"> ${park.parkName} </p>
		
		<p id="parkDescription"> ${park.parkDescription} </p>
		
		</div>
		
	</c:forEach>

	</div>


</body>
</html>