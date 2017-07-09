<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>National Park Survey Results</h2>

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

<c:import url="/WEB-INF/jsp/footer.jsp" />