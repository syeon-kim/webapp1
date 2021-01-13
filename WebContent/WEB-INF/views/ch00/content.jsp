<%-- 주석 처리하기 --%>
<%-- 
page 지시자 
↓↓↓↓↓↓↓↓↓↓↓↓이게 조온나 중요함 ㄹㅇ 존나 개 애애애 중요함
(language="java") language:.jsp 파일에서 사용되는 프로그래밈 언어 이 안에서 사용되는건 자바밖에 없어서 (생략 가능함)
(pageEncoding="UTF-8"%) pageEncoding: .jsp 파일로 저장될때 사용되는 문자셋 (생략 가능함)
(contentType="text/html; charset=UTF-8") contentType: .jsp가 실행후 만들어지는 결과물의 종류
	MIME 타입을 지정
	text/html: 문자 내용으로 html태그로 구성된것 거의 고정적으로 들어감
	application/json: 문자 내용으로 json 표기로 구성된것
	img/jpeg: 이미지 내용으로 jpeg으로 인코딩 한것
	img/png: 이미지 내용으로 png로 인코딩한것
	*****charset=UTF-8: 문자셋 지정 *****
		중요함 외부파일로 보낼때 사용됨!? ,생략불가능
		브라우저로 전달할때 사용되는 문자셋(문자 내용은 반드시 기술을 해야함)
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%-- 이 괄호 안에 임포트 해도 된다 --%>
    
<%-- import 속성 --%>
<%@ page import="java.util.*,java.text.*" %>


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
						<h5> 스크립트립/ 표현식</h5>
						<div>
							<%-- Scriptlet(스크립트릿) --%> 
							<!-- 자바코드라서 무조건 세미콜론이 들어가야함 -->
							
							<%
							Date now = new Date(); 
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
							String strNow = sdf.format(now);
							%>
							
							<%-- Expressions(표현식) --%>
							오늘날짜: <%=strNow %><%-- <%=요자리%>요자리에 있는걸 여기에 넣겟다--%>
						</div>
					</div>
					
					<div class="sector">
						<h5> 날짜표현식/ 스크립트릿</h5>
						<div>
							<% for(int i = 1; i<=6; i++){%>
								<h <%=i%>> Hello JSP </h <%=i%>>
								<br/>
							<%}%>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>

	 
	</body>
</html>