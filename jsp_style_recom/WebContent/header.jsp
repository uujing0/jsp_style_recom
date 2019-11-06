<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="./js/jquery.js"></script>
<c:catch var="exception">
	<!-- 세션에 따라 다른 locCode로 다른 지역의 날씨 정보를 로드한다. -->
	<c:choose>
		<c:when test="${sessionScope.loc }=='서울특별시'"><c:set var="locCode" value="1159068000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='강원도'"><c:set var="locCode" value="4281025000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='경기북부'"><c:set var="locCode" value="4125053500"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='경기남부'"><c:set var="locCode" value="4111759600"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='경상남도'"><c:set var="locCode" value="4817074000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='경상북도'"><c:set var="locCode" value="4717069000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='광주광역시'"><c:set var="locCode" value="2920054000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='대구광역시'"><c:set var="locCode" value="2720065000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='대전광역시'"><c:set var="locCode" value="3023052000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='부산광역시'"><c:set var="locCode" value="2644058000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='세종특별자치시'"><c:set var="locCode" value="3611055000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='울산광역시'"><c:set var="locCode" value="3114056000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='인천광역시'"><c:set var="locCode" value="2871025000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='전라남도'"><c:set var="locCode" value="4681025000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='전라북도'"><c:set var="locCode" value="4579031000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='제주특별자치도'"><c:set var="locCode" value="5013025300"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='충청남도'"><c:set var="locCode" value="4480038000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='충청북도'"><c:set var="locCode" value="4376031000"></c:set></c:when>
		<c:otherwise><c:set var="locCode" value="1159068000"></c:set></c:otherwise>
	</c:choose>
	<c:import var="xmldata" url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=${locCode }" charEncoding="utf-8"></c:import>
	<x:parse var="doc" xml="${xmldata }"></x:parse>
	<%-- <x:out select="$doc//*/data/wfKor"/>
	<x:out select="$doc//*/data/temp"/>
	<x:out select="$doc//*/data/r12"/> --%>
</c:catch>

<script type="text/javascript">	
	//문서 시작시 적용
	$(function(){
		//로그인 상태가 아닐시 디폴트 loc 세션을 생성
		if(!sessionStorage.getItem('loc')){
			sessionStorage.setItem('loc',"서울특별시");	
		}
		var loc = sessionStorage.getItem('loc');
		//날씨 데이터를 세션에 저장한다.
		sessionStorage.setItem('wf','<x:out select="$doc//*/data/wfKor"/>');
		sessionStorage.setItem('temp','<x:out select="$doc//*/data/temp"/>');
		sessionStorage.setItem('r12','<x:out select="$doc//*/data/r12"/>');
		
		$("#weather_loc").html(loc);
  
		$("#top_login_button").click(function(){
			location.href = "loginForm.do";
		});
		
		$("#bottom_login_button").click(function(){
			location.href = "loginForm.do";
		});
		
		$("#top_signup_button").click(function(){
			location.href = "joinForm.do";
		});
		
		$("#bottom_signup_button").click(function(){
			location.href = "joinForm.do";
		});
		
		$("#top_my_page_button").click(function(){
			location.href = "weather.do?sido=1168066000";
		});
		
		$("#bottom_my_page_button").click(function(){
			location.href = "weather.do?sido=1168066000";
		});
		
		$("#top_logout_button").click(function(){
			sessionStorage.removeItem('mem_id');
			location.href = "main.do";
		})
		
		$("#bottom_logout_button").click(function(){
			sessionStorage.removeItem('mem_id');
			location.href = "main.do";
		})
		
		//sessionStorage.setItem('id',"asd");
		
		//로그인 상태에 따라 표기되는 버튼을 관리
		if(!sessionStorage.getItem('mem_id')){
			//로그아웃 상태일시 가리는 버튼
			$("#top_logout_button").hide();
			$("#top_my_page_button").hide();
			$("#bottom_logout_button").hide();
			$("#bottom_my_page_button").hide();
		}else{
			//로그인 상태일시 가리는 버튼
			$("#top_login_button").hide();
			$("#top_signup_button").hide();
			$("#bottom_login_button").hide();
			$("#bottom_signup_button").hide();
		}
		
	})
</script>

<style type="text/css">
/* theme color list
	#FFEEE4
	#F17F42
	#CE6D39
	black
 */

/* header style start */
header{
	border: 1px solid;
	background-color: #CE6D39;
	border: none;
	border-top: 35px solid #F17F42;
	border-bottom: 10px solid;
	border-bottom-color: black;
	height: 60px; 
}
  
header a:link{color: #FFEEE4; text-decoration: none;}
header a:visited{color: #FFEEE4; text-decoration: none;}
header a:hover{text-decoration: none;}
header a:active{color: black; text-decoration: none;}

#header_root{
	margin-left: 10%;
	margin-right: 10%;
	height: 100%;
}

#logo_title{
	font-size: 50px;
	color: #FFEEE4; 
	padding-right: 15px;
	 
}

/* icon */
#dog_icon{
	border-radius: 15px;
	margin-top: 10px;
	margin-left: 10px;
	height: 50px;
	width: 50px;
}
#sun_icon{
	border-radius: 5px;
	display: inline-block;
}

/* header section */
#header_top{
	padding : 0 15px 25px 15px;
	margin-bottom: 3px;
	margin-top: -35px;

}
#header_left{
	float: left;
}
#header_center{
	margin-top: -13px; 
	float: left;
	text-align: center; 	
}
#header_right{
	float: right;
}

/* weather_today */
#weather_today{
	padding-top: 5px;
	float:right;
	color: white
}

/* member_space */
#member_space{
	padding-top: 5px;
	float:right;
}

#member_space button{
	background-color: white;
	color: black;
	border: none;
}

.left_button{
	margin-right: -3px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
}

.right_button{
	margin-left: -3px;
	border-bottom-right-radius: 5px;
	border-top-right-radius: 5px;
}

#top_login_button{
	background-color: white;
	border: none;
}

.top_label{
	color: white; 
}

/* menu_bar */
#menu_bar{
	padding-top : 18px; 
	padding-right : 10px;
	display: inline-block;
}
.menu_bar_table{
	/* margin: auto; */
	text-align: center;
}
.menu_bar_table td{
	padding: 5px 25px 5px 25px;
	font-size: 20px;
	background-color: #F17F42;
	box-shadow: 2px 3px #5d5d5d;
	
}

/* search_bar */
#search_bar{
	padding: 10px;
	display: inline-block; 
	
}

#search_target{
	margin-right: -4px;
	border: none;
}

#search_word{
	width: 300px;
	border: none;
	border-bottom: 5px solid black;
	background-color: #CE6D39;
}

#search_button{
	height: 30px;
	widows: 30px;
}

#search_button:hover{
	border-radius: 5px;
	background-color: #F17F42;
	border: none;
}

/* gender_selector */
#gender_selector{
	padding-top: 3px;
	margin-top: 2px;
	display: inline-block;
}

/* header style end */
</style>

<header>

<div id="header_root">
	<div id="header_top">
		<div id="member_space">
			<button id="top_login_button" class="left_button">로그인</button>
			<button id="top_signup_button" class="right_button">회원가입</button>
			<button id="top_logout_button" class="left_button">로그아웃</button>
			<button id="top_my_page_button" class="right_button">마이코기</button>
		</div>
	</div>
	<div id="header_left">
		<div id="header_logo">
			<a href="main.do">
				<img alt="dog_icon" src="images/dog_icon.png" id="dog_icon">
				<span id="logo_title">웰시코디</span>
			</a>
		</div>
	</div>
	
	<div id="header_right">
		<div id="gender_selector">
			<table class="menu_bar_table">
				<tr>
					<td><a href="">남</a></td>
					<td><a href="">여</a></td>
				</tr>
			</table>
		</div>
		<div id="weather_today">
			<span id="weather_loc">어디</span>
			<span id="weather_cloud"><x:out select="$doc//*/data/wfKor"/></span><br>
			<span id="weather_tem">온도:<x:out select="$doc//*/data/temp"/></span>
			<span id="weather_rain">강수량:<x:out select="$doc//*/data/r12"/></span> 
			<!-- <img alt="sun_icon" src="images/sun_icon.png" id="sun_icon" height="50px" width="50px"> --> 
		</div>
		<br>
	</div>
	
	<div id="header_center">
		<div id="menu_bar">
			<table class="menu_bar_table">
				<tr>
					<td><a href="styleList.do">스타일 추천</a></td>
					<td><a href="bbs.do">게시판</a></td>
					<td><a href="weather.do?sido=${locCode }">마이코기</a></td>
				</tr>
			</table>
		</div>
		<div id="search_bar">
			<form action="search.do" method="get">
				<select id="search_target" name="search_target">
					<option value="0" selected="selected">스타일</option>
					<option value="1">게시판</option>
				</select>
				<input type="text" id="search_word" name="search_word" class= "search_word" value="" autocomplete="off">
				<input type="image" alt="검색" id="search_button" src="images/search_button.png">
			</form>
		</div>
	</div>
</div>


</header>
</html>