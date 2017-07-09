<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="main-section">
	<c:set var="parkCode" value="${park.parkCode}" />
	<c:set var="parkCodeLower" value="${fn:toLowerCase(parkCode)}" />
	<img id="detailImage" src="img/parks/${parkCodeLower}.jpg"><br>
	
	<div id="parkDetailName"><c:out value="${park.parkName}" /></div>
	<div id="parkState"><c:out value="${park.state}" /></div> <br> <br>
	
	<div id="quote"><c:out value="${park.inspirationalQuote}" /></div>
	<div id="quote"><c:out value=" -${park.inspirationalQuoteSrc}" /></div><br> 
	<div id="detailDescription"><p>${park.parkDescription}</p></div> <br> 
	
	<div id="parkDetailTable">
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
			<th>Animal Species</th>
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
	</div>
	
	<br><br><br>
	
	<p id="fiveday"> 5 Day Forecast </p>
	
	<div id="fiveDayTable">
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
				<td><img id="forecast-image"
					src="img/weather/${day.forecast}.png" /> <c:choose>
						<c:when test="${celsius}">
							<p>
								Low:
								<fmt:formatNumber type="number" maxIntegerDigits="2"
									value="${(day.lowTemp - 32) * (5/9)}" />
								C
							</p>
							<p>
								High:
								<fmt:formatNumber type="number" maxIntegerDigits="2"
									value="${day.highTemp - 32 * (5/9)}" />
								C
							</p>
						</c:when>
						<c:otherwise>
							<p>Low: ${day.lowTemp}F</p>
							<p>High: ${day.highTemp}F</p>
						</c:otherwise>
					</c:choose> <c:choose>
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
					</c:choose> <c:if test="${day.highTemp > 75}">
						<p>Bring an extra gallon of water!</p>
					</c:if> <c:if test="${(day.highTemp - day.lowTemp) > 20}">
						<p>Wear breathable layers!</p>
					</c:if> <c:if test="${day.lowTemp < 20}">
						<p>Exposure to low temperatures can be dangerous!</p>
					</c:if></td>
			</c:forEach>

		</tr>

	</table>
	</div>
	<br> 
	<div id="changeTemp"><a href="parkDetail?parkCode=${park.parkCode}&celsius=${!celsius}">F/C</a></div>
<br>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />