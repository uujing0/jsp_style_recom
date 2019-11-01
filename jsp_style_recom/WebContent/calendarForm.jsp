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
						<td style="cursor:pointer; color:red" OnClick="window.open('scheduleForm.do?dd=${i }&yy=${ yy}&mm=${mm}&mem_id=aaa','일정등록','width=280,height=360,left=500,top=200,status=no,scrollbars=no')">
							${i }<br><span style="color:black">
							<c:choose>
								<c:when test="${i eq 1}">${cal_title1 }</c:when>
								<c:when test="${i eq 2}">${cal_title2 }</c:when>
								<c:when test="${i eq 3}">${cal_title3 }</c:when>
								<c:when test="${i eq 4}">${cal_title4 }</c:when>
								<c:when test="${i eq 5}">${cal_title5 }</c:when>
								<c:when test="${i eq 6}">${cal_title6 }</c:when>
								<c:when test="${i eq 7}">${cal_title7 }</c:when>
								<c:when test="${i eq 8}">${cal_title8 }</c:when>
								<c:when test="${i eq 9}">${cal_title9 }</c:when>
								<c:when test="${i eq 10}">${cal_title10 }</c:when>
								<c:when test="${i eq 11}">${cal_title11 }</c:when>
								<c:when test="${i eq 12}">${cal_title12 }</c:when>
								<c:when test="${i eq 13}">${cal_title13 }</c:when>
								<c:when test="${i eq 14}">${cal_title14 }</c:when>
								<c:when test="${i eq 15}">${cal_title15 }</c:when>
								<c:when test="${i eq 16}">${cal_title16 }</c:when>
								<c:when test="${i eq 17}">${cal_title17 }</c:when>
								<c:when test="${i eq 18}">${cal_title18 }</c:when>
								<c:when test="${i eq 19}">${cal_title19 }</c:when>
								<c:when test="${i eq 20}">${cal_title20 }</c:when>
								<c:when test="${i eq 21}">${cal_title21 }</c:when>
								<c:when test="${i eq 22}">${cal_title22 }</c:when>
								<c:when test="${i eq 23}">${cal_title23 }</c:when>
								<c:when test="${i eq 24}">${cal_title24 }</c:when>
								<c:when test="${i eq 25}">${cal_title25 }</c:when>
								<c:when test="${i eq 26}">${cal_title26 }</c:when>
								<c:when test="${i eq 27}">${cal_title27 }</c:when>
								<c:when test="${i eq 28}">${cal_title28 }</c:when>
								<c:when test="${i eq 29}">${cal_title29 }</c:when>
								<c:when test="${i eq 30}">${cal_title30 }</c:when>
								<c:when test="${i eq 31}">${cal_title31 }</c:when>
							</c:choose></span>
						</td>
					</c:when>
					<c:when test="${(w-2+i)%7 eq 6 }">
						<td style="cursor:pointer; color:blue" OnClick="window.open('scheduleForm.do?dd=${i }&yy=${ yy}&mm=${mm}&mem_id=aaa','일정등록','width=280,height=360,left=500,top=200,status=no,scrollbars=no')">
							${i }<br><span style="color:black">
							<c:choose>
								<c:when test="${i eq 1}">${cal_title1 }</c:when>
								<c:when test="${i eq 2}">${cal_title2 }</c:when>
								<c:when test="${i eq 3}">${cal_title3 }</c:when>
								<c:when test="${i eq 4}">${cal_title4 }</c:when>
								<c:when test="${i eq 5}">${cal_title5 }</c:when>
								<c:when test="${i eq 6}">${cal_title6 }</c:when>
								<c:when test="${i eq 7}">${cal_title7 }</c:when>
								<c:when test="${i eq 8}">${cal_title8 }</c:when>
								<c:when test="${i eq 9}">${cal_title9 }</c:when>
								<c:when test="${i eq 10}">${cal_title10 }</c:when>
								<c:when test="${i eq 11}">${cal_title11 }</c:when>
								<c:when test="${i eq 12}">${cal_title12 }</c:when>
								<c:when test="${i eq 13}">${cal_title13 }</c:when>
								<c:when test="${i eq 14}">${cal_title14 }</c:when>
								<c:when test="${i eq 15}">${cal_title15 }</c:when>
								<c:when test="${i eq 16}">${cal_title16 }</c:when>
								<c:when test="${i eq 17}">${cal_title17 }</c:when>
								<c:when test="${i eq 18}">${cal_title18 }</c:when>
								<c:when test="${i eq 19}">${cal_title19 }</c:when>
								<c:when test="${i eq 20}">${cal_title20 }</c:when>
								<c:when test="${i eq 21}">${cal_title21 }</c:when>
								<c:when test="${i eq 22}">${cal_title22 }</c:when>
								<c:when test="${i eq 23}">${cal_title23 }</c:when>
								<c:when test="${i eq 24}">${cal_title24 }</c:when>
								<c:when test="${i eq 25}">${cal_title25 }</c:when>
								<c:when test="${i eq 26}">${cal_title26 }</c:when>
								<c:when test="${i eq 27}">${cal_title27 }</c:when>
								<c:when test="${i eq 28}">${cal_title28 }</c:when>
								<c:when test="${i eq 29}">${cal_title29 }</c:when>
								<c:when test="${i eq 30}">${cal_title30 }</c:when>
								<c:when test="${i eq 31}">${cal_title31 }</c:when>
							</c:choose></span>
						</td>	
							</tr>
						<c:if test="${lastday > i }">
							<tr>
						</c:if>
						</c:when>
					<c:otherwise>
						<td style="cursor:pointer;" OnClick="window.open('scheduleForm.do?dd=${i }&yy=${ yy}&mm=${mm}&mem_id=aaa','일정등록','width=280,height=360,left=500,top=200,status=no,scrollbars=no')">
							${i }<br>
							<c:choose>
								<c:when test="${i eq 1}">${cal_title1 }</c:when>
								<c:when test="${i eq 2}">${cal_title2 }</c:when>
								<c:when test="${i eq 3}">${cal_title3 }</c:when>
								<c:when test="${i eq 4}">${cal_title4 }</c:when>
								<c:when test="${i eq 5}">${cal_title5 }</c:when>
								<c:when test="${i eq 6}">${cal_title6 }</c:when>
								<c:when test="${i eq 7}">${cal_title7 }</c:when>
								<c:when test="${i eq 8}">${cal_title8 }</c:when>
								<c:when test="${i eq 9}">${cal_title9 }</c:when>
								<c:when test="${i eq 10}">${cal_title10 }</c:when>
								<c:when test="${i eq 11}">${cal_title11 }</c:when>
								<c:when test="${i eq 12}">${cal_title12 }</c:when>
								<c:when test="${i eq 13}">${cal_title13 }</c:when>
								<c:when test="${i eq 14}">${cal_title14 }</c:when>
								<c:when test="${i eq 15}">${cal_title15 }</c:when>
								<c:when test="${i eq 16}">${cal_title16 }</c:when>
								<c:when test="${i eq 17}">${cal_title17 }</c:when>
								<c:when test="${i eq 18}">${cal_title18 }</c:when>
								<c:when test="${i eq 19}">${cal_title19 }</c:when>
								<c:when test="${i eq 20}">${cal_title20 }</c:when>
								<c:when test="${i eq 21}">${cal_title21 }</c:when>
								<c:when test="${i eq 22}">${cal_title22 }</c:when>
								<c:when test="${i eq 23}">${cal_title23 }</c:when>
								<c:when test="${i eq 24}">${cal_title24 }</c:when>
								<c:when test="${i eq 25}">${cal_title25 }</c:when>
								<c:when test="${i eq 26}">${cal_title26 }</c:when>
								<c:when test="${i eq 27}">${cal_title27 }</c:when>
								<c:when test="${i eq 28}">${cal_title28 }</c:when>
								<c:when test="${i eq 29}">${cal_title29 }</c:when>
								<c:when test="${i eq 30}">${cal_title30 }</c:when>
								<c:when test="${i eq 31}">${cal_title31 }</c:when>
							</c:choose>
							
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
</body>
</html>