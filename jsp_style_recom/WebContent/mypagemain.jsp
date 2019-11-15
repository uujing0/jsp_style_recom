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


</head>

<%@include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="TH_style.css" />
<body>
<%@include file="weatherForm.jsp"%><pre style="font-size:18px;font-weight:bold;top:20px;">${city }날씨</pre>	
	<div id="content">
		<div id="side_left">
			<div id="head">마이페이지</div>
			<ul id="side_left">
			<li><a href="calendar.do">달력</a></li>
			
			<li><a href="updateForm.do">개인정보수정</a></li>
			
			<li><a href="myboard.do">내가 쓴 게시물</a></li>
			
			<li><a href="weather.do?sido=1168066000" style="background-color: #ccc">일주일 코디추천</a></li>
			</ul>
		</div>

	<div id="center">	
	<%@include file="weather.jsp"%>
	</div>
	<%@include file="recentStyle.jsp" %>
		<div id="bookmark">
			<div style="float:left;margin-top:10px;margin-bottom:10px;margin-left:3%;width:100%;">
			<span style="font-weight:bold;font-size:21px;">즐겨찾기</span>
			</div>
		<%@include file="bookmarkForm.jsp" %>
		</div>
	</div> 
	
</body>

<%@include file="footer.jsp"%>

</html>

