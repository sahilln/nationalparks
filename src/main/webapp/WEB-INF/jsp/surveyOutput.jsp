<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<div class = "main-section">

<div id=surveyTitle><c:out value= "Survey Results"/></div> <br><br>

<div class = "surveyTable">
<table>
	<tr>
		<th></th>
		<th>Park Name</th>
		<th>Number of Votes</th>
		<c:forEach var="park" items="${topParks}">
			<c:set var="parkCode" value="${park.parkCode}" />
			<c:set var="parkCodeLower" value="${fn:toLowerCase(parkCode)}" />




			<tr>
				<td><img id="surveyImage" src="img/parks/${parkCodeLower}.jpg"></td>
				<td>${park.parkName}</td>
				<td>${park.count }
			</tr>

		</c:forEach>
</table>
</div>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />