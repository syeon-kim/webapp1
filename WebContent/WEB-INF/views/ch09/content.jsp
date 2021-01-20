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
						<h5> 파일 업로드 </h5>
						<div>
							<!-- <form method="post" enctype="multipart/form-data" action="fileupload">
									<input type="text" name="title"  placeholder="그림제목"/><br/>
									<input type="text" name="desc"  placeholder="그림설명" style="width: 500px;"/><br/>
									<input type="file" name="attach"  placeholder="파일선택"  multiple/><br/>
									<input type="submit" class="btn btn-primary btn-sm" value="사진올리기"/>
							</form>
							 -->
							<form method="post" enctype="multipart/form-data" action="photoupload">
									<input type="text" name="uid"  placeholder="아이디"/><br/>
									<input type="text" name="uname"  placeholder="이름" "/><br/>
									<input type="password" name="upassword"  placeholder="패스워드" /><br/>
									<input type="file" name="uphoto"/><br/>
									<input type="submit" class="btn btn-primary btn-sm" value="회원가입"/>
							</form>
							
						</div>
					</div>					
					
					
					<div class="sector">
						<h5> 파일 리스트 </h5>
						<div>
						
							<script type="text/javascript">
								$(function() {
									$.ajax({
										url:"photolist",
										success: function(data){
											//메소드가 안들어가면 겥방식임 생략 가능이거둔
											$("#photolist").html(data);
										}
									});
								});
							</script>
							<div id="photolist"></div>
							
						</div>
					</div>		

				<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
				</div>
			</div>
			
			
		</div>
	</body>
</html>