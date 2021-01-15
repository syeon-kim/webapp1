<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 앞에는 c를 붙여라 그냥인가? -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=application.getContextPath() %>/resources/css/main.css">
	</head>
	
	
	<body>
		<div class="wrap">
			<%-- 헤더가 들어갈 자리임 --%>
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
			<%-- <%@ include file="/WEB-INF/views/include/header.jsp" %> --%>
			
			<%-- 내용! --%>
			<div class="mainCenter">
				<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
				
				<div class="content">
				
				<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
					<div class="sector">
						<h5> EL(Expressions Language) 를 이용해서 만든 모델의 값읽기 룰루랄랄</h5>
						<h5> 스칼라 값 읽기 (숫자, 문자열, 논리값)</h5>
						<div>
						<!-- 이게 어ㅓㄸㅎ게 가능한거지 시바 잘 생각해 보렴이거 복습 필수다 -->
							<div> 이름 : ${name} </div>
							<div> 나이 : ${age} </div>
							<div> 직업 : ${job} </div>
						</div>
					</div>					
					
					<div class="sector">
						<h5> 객체의 데이터 읽기</h5>
						<div>
						<!-- 음 이거 게터임! 프라이빗인데 접근 불가능하자나하지만 또 게터 하면 안댐 단순한 필드가 아니구~ 게터를 복사한 뭐시깽이다 -->
							<div> 번호 : ${board1.no} </div>
							<div> 제목 : ${board1.title} </div>
							<div> 내용 : ${board1.content} </div>
							<div> 작성자 : ${board1.writer} </div>
							<div> 날짜 : ${board1.date} </div>

						</div>
					</div>
					
					<div class="sector">
						<h5> 객체의 데이터 읽기</h5>
						<div><%-- 
							<%
								for(Board board : boardList){
									
								}
							%> --%>
							<!-- 이 코드를 사용하기 위해서 한고,,,,,,, 힘들다 -->
							<table class="table table-sm table-bordered" style="width: auto;">
								<tr style="background-color: orange; color: black;">
									<th>번호    :</th>
									<th>제목    :</th>
									<th>내용    :</th>
									<th>글쓴이  :</th>
									<th>날짜    : </th>
								</tr>
								
								<c:forEach var="board1" items="${boardList}">
									<tr>
										<td>${board1.no}</td>
										<td>${board1.title}</td>
										<td>${board1.content}</td>
										<td>${board1.writer}</td>
										<td><fmt:formatDate value="${board1.date}" pattern="yyyy-MM-dd"/> </td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>	
						
					
				<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
				</div>
			</div>
			
			
		</div>
	</body>
</html>