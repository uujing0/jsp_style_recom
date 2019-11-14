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
<link rel="stylesheet" type="text/css" href="TH_style.css" />

</head>

<%@include file="header.jsp"%>

<body>
<%@include file="weatherForm.jsp"%><pre style="font-size:18px;font-weight:bold;">                      ${city }날씨</pre>	
	<div id="content">
		<div id="side_left">
			<div id="head">마이페이지</div>
			<ul id="side_left">
			<li><a href="calendar.do">달력</a></li>
			
			<li><a href="myInfo.do">개인정보수정</a></li>
			
			<li><a href="myboard.do">내가 쓴 게시물</a></li>
			
			<li><a href="weather.do?sido=1168066000">일주일 코디추천</a></li>
			</ul>
		</div>

	<div id="center">	
	<%@include file="weather.jsp"%>
	</div>

<div id="recent_style">
			<div id="head">최근본옷</div><br>
			
			<div id="style">스타일1</div><br><br><br>
			<div id="style">스타일2</div><br><br><br>
			<div id="style">스타일3</div><br><br><br>
			<div id="style">스타일4</div><br><br><br>
			<div id="style">스타일4</div><br><br><br>
			<div id="style">스타일5</div><br><br><br>
			<div id="style">스타일6</div><br><br><br>
			
	</div>
		<div id="bookmark"><p style="font-weight:bold;font-size:21px;">즐겨찾기</p>
			<pre>스         타          일                                                                         코              디            </pre><br><br>
			<pre>    사           진                                                                                사              진       </pre>
		</div>
	</div>
	
</body>

<%@include file="footer.jsp"%>

</html>

