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
				<jsp:include page="/WEB-INF/views/include/menu.jsp"></jsp:include>
				
				<div class="content">
				
				<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
					<div class="sector">
						<h5> 헤더값읽기 </h5>
						<div>
							<a class="btn btn-info  btn-sm" href="method1"> 브라우저 정보얻기 </a>
						</div>
					</div>					
					
					
					
					<div class="sector">
						<h5> HttpServletResponse를 이용해서 쿠키 보내기 </h5>
						<div>
							<a class="btn btn-info  btn-sm" href="method3"> 쿠키 생성 및 보내기 </a>
						</div>
					</div>	
					
					
					
					<div class="sector">
						<h5> HttpServletResponse를 이용해서 쿠키 보내기 </h5>
						<div>
							<a class="btn btn-info  btn-sm" href="method5"> 쿠키 읽기 쿠기냠! </a>
						</div>
					</div>
				<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
				</div>
			</div>
			
			
		</div>
	</body>
</html>