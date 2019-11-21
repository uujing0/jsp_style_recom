<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 쓴 게시글</title>
<style type="text/css">
#board {
	margin-left:50px;
	position: relative;
	top: 50px;
	font-family: "나눔고딕", sans-serif;
	width: 500px;
	height: 1200px;
}

#bList {
	margin-bottom: 20%;
	float: left;
}

#bdcontent {
	border: 1px solid #4c4c4c;
	border-top: 3px solid #4c4c4c;
	padding-left: 20px;
	width:400px;
	height: 400px;
}
</style>
</head>

<body>
	<div id="board" style="height: 700px;">

		<table style="font: bold; float: left;" id="bList">
			<c:forEach var="board" items="${myList}" begin="0" end="2">
				<td>
					<div id="bdcontent">
						<a href="view.do?bd_id=${board.bd_id}">${board.popup }</a> 
						<a href="view.do?bd_id=${board.bd_id}">${board.bd_title}</a> 
						<a href="view.do?bd_id=${board.bd_id}">${board.mem_id}</a>
						<span style="color: #e55151"><c:if test="${board.staravg>0}">
							<c:if test="${board.staravg==1}">★</c:if>
							<c:if test="${board.staravg==2}">★★</c:if>
							<c:if test="${board.staravg==3}">★★★</c:if>
							<c:if test="${board.staravg==4}">★★★★</c:if>
							<c:if test="${board.staravg==5}">★★★★★</c:if>
							<c:if test="${board.staravg==6}">★★★★★★</c:if>
							<c:if test="${board.staravg==7}">★★★★★★★</c:if>
							<c:if test="${board.staravg==8}">★★★★★★★★</c:if>
							<c:if test="${board.staravg==9}">★★★★★★★★★</c:if>
							<c:if test="${board.staravg==10}">★★★★★★★★★</c:if>
						</c:if></span>
					</div>

				</td>
			</c:forEach>

		</table>
	</div>
</body>
</html>