<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<ul>
	<c:forEach var="fileName" items="${fileNames}">
		<div style="display: flex; justify-content: center; align-items: center; margin-bottom: 5px;"/>
			<img class="rounded-circle" src="photodownload?photo=${fileName}" width="40px" height="40px" style="margin-right:5px;">
			<!-- //서버에 내용을 요청하는거임 소스가 ~.jpg로 글어가야 하는거지 근대 들어가면 서버입장에서는 똑같다 이거야 
			// 요청맵핑메소드를 통해서 사진을 설정해서 꺼내오는거라고? -->
			<a href="photodownload?photo=${fileName}">${fileName}</a>
		</div>
<%-- 		<li>	
			<a href="photodownload?photo=${fileName}">${fileName}</a>
		</li> --%>
	</c:forEach>
</ul>

