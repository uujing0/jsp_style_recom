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
		오늘날씨상태 :${ wfKor[0]}<br>온도${Temp1}&deg;C<br>강수확률${rs[0]}%
	</p>
	<p class="dateweather">
		내일날씨상태 :
		${wfKor[1]}<br>최고온도${Tmx[0]}&deg;C<br>최저온도${Tmn[0]}&deg;C<br>강수확률${rs[1]}%
	</p>
	<p class="dateweather">
		모레날씨상태 :
		${wfKor[2]}<br>최고온도${Tmx[1]}&deg;C<br>최저온도${Tmn[1]}&deg;C<br>강수확률${rs[2]}%
	</p>
	<p class="dateweather">
		3일뒤날씨상태 :
		${wfKor[3]}<br>최고온도${Tmx[2]}&deg;C<br>최저온도${Tmn[2]}&deg;C<br>강수확률${rs[3]}%
	</p>
	<p class="dateweather">
		4일뒤날씨상태 :
		${wfKor[4]}<br>최고온도${Tmx[3]}&deg;C<br>최저온도${Tmn[3]}&deg;C<br>강수확률${rs[4]}%
	</p>
	<p class="dateweather">
		5일뒤날씨상태 :
		${wfKor[5]}<br>최고온도${Tmx[4]}&deg;C<br>최저온도${Tmn[4]}&deg;C<br>강수확률${rs[5]}%
	</p>
	<p class="dateweather">
		6일뒤날씨상태 :
		${wfKor[6]}<br>최고온도${Tmx[5]}&deg;C<br>최저온도${Tmn[5]}&deg;C<br>강수확률${rs[6]}%
	</p>
	</form>
</body>
</html>
