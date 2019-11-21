<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 처음 접속 주소(서울을 defalut값으로 지정)weather.do?sido=1168066000 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypage</title>
<script src="./js/jquery.js"></script>
<script type="text/javascript">
	if('${sessionScope.mem_id}'){
		
	}
	else{
		alert("로그인 해주세요.");
		history.go(-1);
		login();
	}
	function login() {
        window.open('loginForm.jsp','로그인','width=500,height=400,left=700,top=200,status=no,scrollbars=no')
	}
	
</script>

</head>

<%@include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="TH_style.css" />
<body bgcolor="#f9f7f6">
<%-- <pre style="font-size:18px;font-weight:bold;top:20px;">${city }날씨</pre> --%>	
	<div id="content">
		<div id="side_left">
			<ul id="side_left">
			<li><a href="calendar.do">달력</a></li>
			
			<li><a href="memUpForm.do">개인정보수정</a></li>
			
			<li><a href="myboard.do">내가 쓴 게시물</a></li>
			
			<li><a href="weather.do?sido=1168066000" style="background-color: #e55151">일주일 코디추천</a></li>
			</ul>
		</div>

	<div id="center" style="padding:0;">
	<%@include file="weatherForm.jsp"%>	
	<%@include file="weather.jsp"%>
	</div>
	<%@include file="recentStyle.jsp" %>
		
		<%@include file="bookmarkForm.jsp" %>
		
	</div> 
	
</body>

<%@include file="footer.jsp"%>

</html>

