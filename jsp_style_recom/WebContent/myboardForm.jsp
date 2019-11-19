<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#board {
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
	padding: 20px;
}
</style>
</head>

<body>
	<div id="board" style="height: 700px;">

		<table style="font: bold; float: left;" id="bList">
			<c:forEach var="board" items="${myList}" begin="0" end="2">
				<td>
					<div id="bdcontent">
						<a href="view.do?bd_id=${board.bd_id}">${board.popup }</a> <a
							href="view.do?bd_id=${board.bd_id}">${board.bd_title}</a> <a
							href="view.do?bd_id=${board.bd_id}">${board.mem_id}</a>
						<%--                 	 --%>
					</div>

				</td>
			</c:forEach>

		</table>
	</div>
</body>
</html>