<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table#title{
		margin:auto;
		border:3px solid #d5d5d5;
		border-radius: 8px;
		border-bottom-left-radius:0px;
		border-bottom-right-radius:0px;
		border-bottom: none;

	}
	#title th{
		border: 1px solid #d5d5d5; 
		background-color: #ccc; 
		padding: 1%; width: 150px;
	}
	#title td{
		border: 2px solid #d5d5d5; height: 80px; font-size:15pt; 
		vertical-align:top; text-align: right; padding: 10px; width:337.04px;
	}
	table#calendar{
		margin:auto;
		border:3px solid #d5d5d5;
		border-radius: 8px;
		border-top-left-radius:0px;
		border-top-right-radius: 0px;
	}
	#calendar th{
		border: 1px solid #d5d5d5; background-color: #ccc;
		padding: 1%; width: 150px;
		}
	#calendar td{
		border: 2px solid #d5d5d5; height: 80px; font-size:15pt; 
		vertical-align:top; text-align: right; padding: 10px;}
	#calendar td:hover{ background-color: #ccc;
	}
	
</style>
<script type="text/javascript">

</script>
</head>

<body>
	<table id="title">
		<tr>
			<td colspan="2" align="center" style="border:none;text-align: right;height: 40px;">
				<a href="?yy=${yy-1 }&mm=${mm}">◀</a>
				<a href="?yy=${yy }&mm=${mm-1}">◁</a>
			</td>
			<td id="d" colspan="3" align="center" style="border:none;text-align: center;height: 40px;font-size:18pt;font-weight:bold;">
				${yy }년 ${mm }월
			</td>
			<td colspan="2" align="center" style="border:none;text-align: left;height: 40px;">
				<a href="?yy=${ yy}&mm=${mm+1}">▷</a>
				<a href="?yy=${yy+1}&mm=${mm}">▶</a>
			</td>
		</tr>
		</table>
		<table id="calendar">
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
						<td style="cursor:pointer; color:red" OnClick="window.open('scheduleForm.do?dd=${i }&yy=${ yy}&mm=${mm}&mem_id=${sessionScope.mem_id }','일정등록','width=280,height=360,left=100,top=120,status=no,scrollbars=no')">
							${i }<br><span style="color:black;font-weight:bold;">
							<c:forEach var="a" items="${CalMap}">
							<c:choose>
								<c:when test="${i eq a.key}">${a.value }</c:when>		
							</c:choose>
							</c:forEach>
							</span>
						</td>
					</c:when>
					<c:when test="${(w-2+i)%7 eq 6 }">
						<td style="cursor:pointer; color:blue" OnClick="window.open('scheduleForm.do?dd=${i }&yy=${ yy}&mm=${mm}&mem_id=${sessionScope.mem_id }','일정등록','width=280,height=360,left=500,top=200,status=no,scrollbars=no')">
							${i }<br>
							<span style="color:black;font-weight:bold;">
								<c:forEach var="a" items="${CalMap}">
									<c:choose>
										<c:when test="${i eq a.key}">${a.value }</c:when>		
									</c:choose>
								</c:forEach>
							</span>
						</td>	
							</tr>
						<c:if test="${lastday > i }">
							<tr>
						</c:if>
						</c:when>
					<c:otherwise>
						<td style="cursor:pointer;" OnClick="window.open('scheduleForm.do?dd=${i }&yy=${ yy}&mm=${mm}&mem_id=${sessionScope.mem_id }','일정등록','width=280,height=360,left=500,top=200,status=no,scrollbars=no')">
							${i }<br>
							<span style="color:black;font-weight:bold;">
								<c:forEach var="a" items="${CalMap}">
									<c:choose>
										<c:when test="${i eq a.key}">${a.value }</c:when>		
									</c:choose>
								</c:forEach>
							</span>
							
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