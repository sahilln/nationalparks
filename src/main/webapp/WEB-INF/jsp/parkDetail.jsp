<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<html>
<body>
<div class = "main-section">
	<c:set var="parkCode" value="${park.parkCode}" />
	<c:set var="parkCodeLower" value="${fn:toLowerCase(parkCode)}" />
	<img id="detailImage" src="img/parks/${parkCodeLower}.jpg"><br>
	<br>
	<span id="parkName"><c:out value="${park.parkName}"/></span><br>
	
	<span id="parkState"><c:out value="${park.state}"/></span>
	<br>
	
	<br>
	<span id="quote"><c:out value="${park.inspirationalQuote}"/></span><br>
	<span id="quote"><c:out value=" -${park.inspirationalQuoteSrc}"/></span>
	<br>
	
	<span id="detailDescription"><p>${park.parkDescription} </p></span>
	<br>
	
	<span id="fun"><c:out value="Fun Facts:"/></span>
	<br>
	<table>
		<tr>
			<th>Acres</th>
			<th>Elevation</th>
			<th>Trail Miles</th>
			<th>Campsites</th>
			<th>Climates</th>
			<th>Year Founded</th>
			<th>Annual Visitors</th>
			<th>Entry Fee</th>
			<th>Number of Animal Species</th>
		</tr>
		<tr>
			<td>${park.acreage}</td>
			<td>${park.elevationInFeet}</td>
			<td>${park.milesOfTrails}</td>
			<td>${park.numOfCampsites}</td>
			<td>${park.climate}</td>
			<td>${park.yearFounded}</td>
			<td>${park.annualVisitors}</td>
			<td>${park.entryFee}</td>
			<td>${park.numAnimalSpecies}</td>
			
		
		</tr>	
			
	
	</table>
	
	<br>
<table>
	<tr>
		<th>Today</th>
		<th>Tomorrow</th>
		<th>Day 3</th>
		<th>Day 4</th>
		<th>Day 5</th>
	</tr>
	<tr>
	
	<c:forEach var="day" items="${fiveDayList}">
		<td>
		<img id="forecast-image" src="img/weather/${day.forecast}.png" />
		<c:choose>
			<c:when test="${celsius}">
				<p>Low: <fmt:formatNumber type = "number" maxIntegerDigits="2" value = "${(day.lowTemp - 32) * (5/9)}" />C</p>
				<p>High: <fmt:formatNumber type = "number" maxIntegerDigits="2" value = "${day.highTemp - 32 * (5/9)}" />C</p>
			</c:when>
			<c:otherwise>
				<p>Low: ${day.lowTemp}F</p>
				<p>High: ${day.highTemp}F</p>
			</c:otherwise>
		</c:choose>

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

		
		</td>
	</c:forEach>
	
	</tr>
	
</table>
<br>
<a id = "changeTemp" href="parkDetail?parkCode=${park.parkCode}&celsius=${!celsius}">Change Between Celsius and Fahrenheit</a>

</div>
</body>
</html>