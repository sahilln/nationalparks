<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<html>

<body>

<c:forEach var="park" items="${parkList}">

<c:set var="parkCode" value="${park.parkCode}"/>
<c:set var="parkCodeLower" value= "${fn:toLowerCase(parkCode)}"/>

<img src="img/parks/${parkCodeLower}.jpg">

</c:forEach>



</body>
</html>