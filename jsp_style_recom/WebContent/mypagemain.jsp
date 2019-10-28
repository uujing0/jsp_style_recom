<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.today {
	width: 40%;
	height: 500px;
	border: 1px solid;
	border-radius: 20px 20px;
	padding: 30px;
	margin-left: 60px;
	background-color: pink;
}

div.day {
	width: 40%;
	height: 220px;
	border: 1px solid;
	border-radius: 20px 20px;
	padding: 30px;
	margin: 2px;
}
table{
	
	width:1400px;
}
table td{
 	
}
</style>
</head>
<%@include file="/common/header.jsp"%>
<body>
	<%@include file="weatherForm.jsp"%>
	<table>
<tr>
<td rowspan="2">
	<div class="today"> 
		${day1 }<br> ${Temp1}&deg;C<br> 강수확률 : ${rs0 }%
	</div>
</td>
<td>
	<div class="day">
	${day2 }<br> 최고온도 : ${Tmx0}&deg;C<br> 최저온도 : ${Tmn0 }&deg;C<br> 강수확률 : ${rs1 }%
	</div>
</td>
<td>
	<div class="day">
	${day3 }<br> 최고온도 : ${Tmx0}&deg;C<br> 최저온도 : ${Tmn0 }&deg;C<br> 강수확률 : ${rs1 }%
	</div>
</td>

<td>
	<div class="day">
	${day4 }<br> 최고온도 : ${Tmx0}&deg;C<br> 최저온도 : ${Tmn0 }&deg;C<br> 강수확률 : ${rs1 }%
	</div>
</td>
</tr>
<tr>
<td>
	<div class="day">
	${day5 }<br> 최고온도 : ${Tmx0}&deg;C<br> 최저온도 : ${Tmn0 }&deg;C<br> 강수확률 : ${rs1 }%
	</div>
</td>
<td>
	<div class="day">
	${day6 }<br> 최고온도 : ${Tmx0}&deg;C<br> 최저온도 : ${Tmn0 }&deg;C<br> 강수확률 : ${rs1 }%
	</div>
</td>
<td>
	<div class="day">
	${day7 }<br> 최고온도 : ${Tmx0}&deg;C<br> 최저온도 : ${Tmn0 }&deg;C<br> 강수확률 : ${rs1 }%
	</div>
</td>
</tr>
	</table>
</body>
<%@include file="/common/footer.jsp"%>
</html>