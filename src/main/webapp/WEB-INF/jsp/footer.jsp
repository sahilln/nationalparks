<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div class="footer">
		
	<c:url value="/homePage" var ="homePage"/>
    <c:url value="/surveyInput" var ="survey"/>
        	
	<nav id="navbar">
        <ul id="links">
            
            <li><a href="${homePage}">Home</a></li>
            <li><a href="${survey}">Survey</a></li>
       
        </ul>
    	</nav>
    	
	</div>

</body>
</html>