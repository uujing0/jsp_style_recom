<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table#calendar{
		margin:auto;
		border:3px solid black;
		border-radius: 8px;
	}
	th{border: 1px solid black; background-color: silver; padding: 1%; width: 130px;}
	td{border: 2px solid black; height: 60px; font-size:12pt; vertical-align:top;text-align: right;padding: 10px;}
</style>
</head>

<body>
	<table id="calendar">
		<tr>
			<td colspan="2" align="center" style="border:none;text-align: right;height: 40px;">
				<a href="?yy=${yy-1 }&mm=${mm}">◀</a>
				<a href="?yy=${yy }&mm=${mm-1}">◁</a>
			</td>
			<td colspan="3" align="center" style="border:none;text-align: center;height: 40px;font-size:18pt;">
				${yy }년 ${mm }월
			</td>
			<td colspan="2" align="center" style="border:none;text-align: left;height: 40px;">
				<a href="?yy=${ yy}&mm=${mm+1}">▷</a>
				<a href="?yy=${yy+1}&mm=${mm}">▶</a>
			</td>
		</tr>
		<tr>
			<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
		</tr>
		<tr>
			<c:forEach var="i" begin="1" end="${w-1 }" step="1">
				<td>&nbsp;</td>	
			</c:forEach>
			<c:forEach var="i" begin="1" end="${lastday }" step="1">
				<c:choose>
					<c:when test="${(w-2+i)%7 eq 0 }">
						<td style="cursor:pointer; color:red" OnClick="window.open('scheduleForm.jsp','dd=${i }&yy=${ yy}&mm=${mm}','width=280,height=340,location=no,status=no,scrollbars=no')">
							${i }
						</td>
					</c:when>
					<c:when test="${(w-2+i)%7 eq 6 }">
						<td style="cursor:pointer; color:blue" OnClick="window.open('scheduleForm.jsp','dd=${i }&yy=${ yy}&mm=${mm}','width=280,height=340,location=no,status=no,scrollbars=no')">
							${i }<br>${cal_contents }
						</td>	
							</tr>
						<c:if test="${lastday > i }">
							<tr>
						</c:if>
						</c:when>
					<c:otherwise>
						<td style="cursor:pointer;" OnClick="window.open('scheduleForm.jsp','dd=${i }&yy=${ yy}&mm=${mm}','width=280,height=340,location=no,status=no,scrollbars=no')">
							${i }
						</td>	
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${(w-2+lastday)%7 != 6}">
				<c:forEach begin="${(w-2+lastday)%7+1 }" end="6" step="1">
					<td>&nbsp;</td>
				</c:forEach>
					</tr>
			</c:if>	
	</table>
	<br>
	<br>
</body>
</html>