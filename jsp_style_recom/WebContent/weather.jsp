<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일주일 날씨받기</title>

</head>
<body>
	

	<!-- 	//날씨상태:wfkor 오늘온도:Temp1 최고온도:Tmx[] 최저온도:Tmn[] 강수확률:rs[]
 -->
 <form action="">
	<p class="dateweather">${getToday}<br>
		오늘날씨상태 :${ wfKor0}<br>온도${Temp1}&deg;C<br>강수확률${rs0}%
	</p>
	<p class="dateweather">
		내일날씨상태 :
		${wfKor1}<br>최고온도${Tmx0}&deg;C<br>최저온도${Tmn0}&deg;C<br>강수확률${rs1}%
	</p>
	<p class="dateweather">
		모레날씨상태 :
		${wfKor2}<br>최고온도${Tmx1}&deg;C<br>최저온도${Tmn1}&deg;C<br>강수확률${rs2}%
	</p>
	<p class="dateweather">
		3일뒤날씨상태 :
		${wfKor3}<br>최고온도${Tmx2}&deg;C<br>최저온도${Tmn2}&deg;C<br>강수확률${rs3}%
	</p>
	<p class="dateweather">
		4일뒤날씨상태 :
		${wfKor4}<br>최고온도${Tmx3}&deg;C<br>최저온도${Tmn3}&deg;C<br>강수확률${rs4}%
	</p>
	<p class="dateweather">
		5일뒤날씨상태 :
		${wfKor5}<br>최고온도${Tmx4}&deg;C<br>최저온도${Tmn4}&deg;C<br>강수확률${rs5}%
	</p>
	<p class="dateweather">
		6일뒤날씨상태 :
		${wfKor6}<br>최고온도${Tmx5}&deg;C<br>최저온도${Tmn5}&deg;C<br>강수확률${rs6}%
	</p>
	</form>
</body>
</html>
