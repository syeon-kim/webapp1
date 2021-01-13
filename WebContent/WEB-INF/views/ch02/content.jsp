<%@ page  contentType="text/html; charset=UTF-8"%>

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
				<%--공통메뉴 --%>
				<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
				<div class="content">
					<div class="sector">
						<h5> Request Mapping 요청 맵핑</h5>
						<div>
							GET 방식 :&nbsp;
							<a class="btn btn-info btn-sm" href="getMethod">request1</a> <!-- ch02까지 생략 -->
							<!-- <a class="btn btn-info btn-sm" href="request2">request2</a> --> <!-- 겥방식이다 -->
							<br/>
							POST 방식 :
							<form method="post" action="postMethod" style="display: inline-block;">
								<button class="btn btn-info btn-sm">request1</button>
							</form>
						</div>
					</div>
					
					<div class="sector">
						<h5> 요청 방식별 회원 가입 처리</h5>
						<div>
							GET 방식 :&nbsp;
							<a class="btn btn-info btn-sm" 
								href="<%=application.getContextPath() %>/ch02/join">회원가입</a> <!-- ch02까지 생략 , 상대경로 절대경로 비교하는거 확인해보기 -->
							<!-- <a class="btn btn-info btn-sm" href="request2">request2</a> --> <!-- 겥방식이다 -->
							<br/>
						
						</div>
					</div>
					
					<div class="sector">
						<h5> 비동기 처리</h5>
						<div>
							GET 방식 :&nbsp;	<a class="btn btn-info btn-sm" href="javascript:fun1()">회원가입</a> 
							<script type="text/javascript">
								function fun1(){
									$.ajax({
										url:"joinAsync",
										method: "get",
										success: (data) => {
											$("#joinForm").html(data);
										}
									}); //객체를 집어 넣겠다 라는 뜻	
								};
							</script>
							<div id="joinForm"></div>
							<br/>
						
						</div>
					</div>					
					
				</div>
			</div>
			
			
		</div>
	</body>
</html>