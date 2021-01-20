<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="mainHeader">
	<h3>Spring Framework</h3>
	<div class="loginBox">
		
		<c:if test="${loginStatus == null}">
			
			<a class="btn btn-info btn-sm" href="<%= application.getContextPath() %>/ch08/content" >Login</a>
		</c:if>
		
		<c:if test="${loginStatus != null}">
			<img  src="<%=application.getContextPath()%>/resources/img/myphoto.png" width="50px" class="rounded-circle">
			<a class="btn btn-danger btn-sm" href="<%= application.getContextPath() %>/ch08/logout">Logout</a>
		</c:if>
	</div>
</div>