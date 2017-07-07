<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<html>
<body>

	<c:set var="parkCode" value="${park.parkCode}" />
	<c:set var="parkCodeLower" value="${fn:toLowerCase(parkCode)}" />
	<img src="img/parks/${parkCodeLower}.jpg">
	<br>

	<c:out value="${park.parkName}" />
	<br>
	<c:out value="Description: ${park.parkDescription}" />
	<br>
	<c:out value="State: ${park.state}" />
	<br>
	<c:out value="Acres: ${park.acreage}" />
	<br>
	<c:out value="Elevation: ${park.elevationInFeet}" />
	<br>
	<c:out value="Trail Miles: ${park.milesOfTrails}" />
	<br>
	<c:out value="Campsites: ${park.numOfCampsites}" />
	<br>
	<c:out value="Climate: ${park.climate}" />
	<br>
	<c:out value="Year Founded: ${park.yearFounded}" />
	<br>
	<c:out value="Annual Visitors: ${park.annualVisitors}" />
	<br>
	<c:out
		value="Quote: ${park.inspirationalQuote} by: ${park.inspirationalQuoteSrc}" />
	<br>
	<c:out value="Entry Fee: ${park.entryFee} dollars" />
	<br>
	<c:out value="Number of Animal Species: ${park.numAnimalSpecies}" />
	<br>

	<c:forEach var="day" items="${fiveDayList}">
		<c:out value="Day 1" />
		<c:out value="Low: ${day.lowTemp}F" />
		<c:out value="High: ${day.highTemp}F" />
		<img src="img/weather/${day.forecast}.png" />
		<br>

		<c:choose>
			<c:when test="${day.forecast == 'snow'}">
				<p>Pack your snowshoes!</p>
			</c:when>
			<c:when test="${day.forecast == 'rain'}">
				<p>Pack rain gear and wear waterproof shoes!</p>
			</c:when>
			<c:when test="${day.forecast == 'thunderstorms'}">
				<p>Seek shelter and avoid hiking on exposed ridges!</p>
			</c:when>
			<c:when test="${day.forecast == 'sun'}">
				<p>Pack sunblock!</p>
			</c:when>
		</c:choose>

		<c:if test="${day.highTemp > 75}">
			<p>Bring an extra gallon of water!</p>
		</c:if>

		<c:if test="${(day.highTemp - day.lowTemp) > 20}">
			<p>Wear breathable layers!</p>
		</c:if>

		<c:if test="${day.lowTemp < 20}">
			<p>Exposure to low temperatures can be dangerous!</p>
		</c:if>
		

	</c:forEach>

</body>
</html>