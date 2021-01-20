<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<h5> HttpSession 객체를 이용한 스칼라값 전달 </h5>
						<div>
							<a class="btn btn-info  btn-sm" href="method1"> 데이터전달 </a>
						</div>
					</div>					
					
					<div class="sector">
						<h5> HttpSession 객체를 이용한 객체 전달 </h5>
						<div>
							<a class="btn btn-info  btn-sm" href="method2"> 데이터전달 </a>
						</div>
					</div>
					
					<div class="sector">
						<h5> HttpSession 객체를 이용한 컬렉션 전달 </h5>
						<div>
							<a class="btn btn-info  btn-sm" href="method3"> 데이터전달 </a>
						</div>
					</div>
					
					
					<div class="sector">
						<h5> HttpSession 객체를 이용한 로그인 </h5>
						<div>
							<c:if test="${loginStatus == null}"> <!-- 얘가 도대체 어디서 가져오는건지를 모르겟네 -->
								<div>
									<form method="post" action="login"> 
										<input type="text" name="uid" placeholder="아이디"/> <br/>
										<input type="password" name="upassword" placeholder="패스워드"/> <br/>
										<button class="btn btn-success btn-sm">로그인</button>
									</form>
								</div>
							</c:if>
							
							<c:if test="${loginStatus != null}">
								<div>
									<a class="btn btn-danger btn-sm" href="logout">로그아웃</a>
								</div>
							</c:if>
							
						</div>
					</div>
					
					
					<c:if test="${loginStatus !=null }">
						<div class="sector">
							<h5> 게시물 입력 </h5>
							<div>
								<form method="post" action="boardWrite">
									<input type="text" name="title" placeholder="제목" /><br/>
									<textarea rows ="5" cols ="100"  name="content" placeholder="내용"></textarea>
									<br/>
									<button class="btn btn-info btn-sm">저장</button>
								</form>
							</div>
						</div>
					</c:if>
					
					
				<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
				</div>
			</div>
			
			
		</div>
	</body>
</html>