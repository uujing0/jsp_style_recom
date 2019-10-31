<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지_달력</title>
<link rel="stylesheet" type="text/css" href="TH_style.css" />
</head>
<%@include file="/common/header.jsp"%>
<body>
<div id="content">
<div id="side_left">
			<div id="head">마이페이지</div>
			<div id="page"><a href="calendar.do">달력</a></div>
			
			<div id="page"><a href="myInfo.do">내정보</a></div>
			
			<div id="page"><a href="board.do">내가 쓴 게시물</a></div>
			
			<div id="page"><a href="bookmark.do">즐겨찾기</a></div>
		</div>

<div id="center">	

<%@include file="calendarForm.jsp"%>

</div>
	<div id="recent_style">
			<div id="head">최근본옷</div><br>
			<div id="style">스타일1</div><br><br><br>
			<div id="style">스타일2</div><br><br><br>
			<div id="style">스타일3</div><br><br><br>
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
<%@include file="/common/footer.jsp"%>
</html>