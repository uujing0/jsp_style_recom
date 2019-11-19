<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지_달력</title>
<link rel="stylesheet" type="text/css" href="TH_style.css" />
</head>
<%@include file="header.jsp"%>
<body>

<div id="content">
		<div id="side_left">
			<div id="head">마이페이지</div>
			<ul>
			<li><a href="calendar.do?">달력</a></li>
			
			<li><a href="memUpForm.do">개인정보수정</a></li>
			
			<li><a href="myboard.do">내가 쓴 게시물</a></li>
			
			<li><a href="weather.do?sido=1168066000">일주일 코디추천</a></li>
			</ul>
		</div>

<div id="center">	

<%@include file="calendarForm.jsp"%> 
</div>
<%@include file="recentStyle.jsp" %>
		<div id="bookmark"><p style="font-weight:bold;font-size:21px;">즐겨찾기</p>
			<%@include file="bookmarkForm.jsp" %>
		</div>
</div>
</body>
<%@include file="footer.jsp"%>
</html>