<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="./js/jquery.js"></script>

<!-- session이 없으면(비로그인시) 디폴트 값을 넣어준다. -->
<c:if test="${sessionScope.loc == null}">
	<c:set var="loc" value="서울특별시" scope="session"></c:set>
</c:if>
<!-- gender 1:남자, 2:여자 -->
<c:if test="${sessionScope.gender == null }">
	<c:set var="gender" value="2" scope="session"></c:set>
</c:if>

<c:catch var="exception">
	<!-- 세션에 따라 다른 locCode로 다른 지역의 날씨 정보를 로드한다. -->
	<c:choose>
		<c:when test="${sessionScope.loc }=='서울특별시'"><c:set var="locCode" value="1168066000"></c:set></c:when>
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
		<c:otherwise><c:set var="locCode" value="1168066000"></c:set></c:otherwise>
	</c:choose>
	<!-- 받은 지역코드에 맞는 날씨 데이터를 기상청에서 가져온다. -->
	<c:import var="xmldata" url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=${locCode }" charEncoding="utf-8"></c:import>
	<x:parse var="doc" xml="${xmldata }"></x:parse>
	<x:set var="wf" select="$doc//*/data/wfKor"/>
	<x:set var="temp" select="$doc//*/data/temp"/>
	<x:set var="rp" select="$doc//*/data/pop"/>
</c:catch>

<%-- <c:out value="${sessionScope.loc }"></c:out>
<c:out value="${sessionScope.gender }"></c:out>
<x:out select="$wf"></x:out>
<x:out select="$temp"></x:out>
<x:out select="$rp"></x:out> --%>

<script type="text/javascript">
	//문서 시작시 적용
	$(function(){
		var thisPage = window.location.href.split('jsp_style_recom/')[1];
		if(thisPage.split('?')[0] == "genderSelector.do"){
			history.pushState(null,null,window.location.href.split('thisPage=')[1]);
		}
		
		if(thisPage == "logout.do"){
			history.pushState(null,null,"main.do");
		}
	})
	
	function logoutConfirm(){
		if(confirm("정말 로그아웃 하시겠습니까?") == true){
	        location.href='logout.do'
	    }
	    else{
	        return ;
	    }
	}
	
	function login() {
        window.open('loginForm.jsp','로그인','width=500,height=400,left=700,top=200,status=no,scrollbars=no')
	}

</script>

<style type="text/css">
/* theme color list
	#E45151	
	#F9F7F6 background
	#373B43
	#F3F1F0
 */

/* header style start */
header{
	background-color : #F9F7F6;
	margin-top: 35px;
}
  
header a:link{color: #FFEEE4; text-decoration: none;}
header a:visited{color: #FFEEE4; text-decoration: none;}
header a:hover{text-decoration: none;}
header a:active{color: black; text-decoration: none;}

#header_root{
	margin-left: 0%;
	margin-right: 0%;
}

#logo_title{
	font-size: 50px;
	color: #FFEEE4; 
	padding-right: 15px;
	 
}
#header_logo{
	text-align: center;
}

/* icon */
#dog_icon{
	/* border-radius: 15px;
	margin-top: 10px;
	margin-left: 10px; */
	height: 300px;
	width: 300px;
	text-align: center;
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
	margin-top: 0px; 
	/* float: left; */
	/* text-align: center; */
	background-color: #E55151;
}
#header_right{
	float: right;
}

/* weather_today */
#weather_today{
	padding-top: 5px;
	float:right;
	color: gray;
}

/* member_space */
#member_space{
	/* padding-top: 5px; */
	float:right;
}

.top_left_button{
	color: black;
	background-color : #F9F7F6;
	border : none;
	font-size: 15px;
	cursor: pointer;
}
 
.top_right_button{
	color: black;
	background-color : #F9F7F6;
	border : none;
	font-size: 15px;
	cursor: pointer;
}

/* menu_bar */
#menu_bar{
	/* padding-top : 18px; 
	padding-right : 10px; */
	display: inline-block;
	cursor: pointer;
	color: white;
}
.menu_bar_table{
	text-align: center;
	background-color: #E55151;
}
.menu_bar_table td{
	padding: 25px;
	font-size: 20px;
/* 	background-color: #E45151;
 */	/* box-shadow: 2px 3px #5d5d5d; */
}
.menu_bar_table td:hover{
	border-bottom: 2px solid white;
}
.menu_bar_table td:first-child{
	padding: 25px 5px 25px 5px;
	background-color: #D34747;
	font-size: 30px;
}

/* search_bar */
#search_bar{
	padding: 0px;
	display: inline-block;
	float: right;
	border-bottom: 14px solid #D34747;
	
}

#search_target{
	/* margin-right: -4px; */
	border: none;
/* 	background-color: #D34747;
 */	font-size: 15px;
}
#search_input{
	border-bottom: 2px solid white;
}
#search_word{
	width: 300px;
	border: none;
	background-color: #E45151;
	color : white;
	font-size: 15px;
}
#search_word::placeholder{
	color: #D34747;
	font-weight: bold;
}

#search_button{
	height: 30px;
	width: 40px;
}
#search_radio{
	float: right;
	color: white;
}
/* #search_radio  */
input[type="radio"]{
	background-color: black;
}

#search_button:hover{
	/* border-radius: 5px;
	background-color: #F17F42;
	border: none; */
}

/* gender_selector */
#gender_selector{
	display: inline-block;
	color: #666666;
	cursor: pointer;
}
#gender_selector td{
	padding: 10px 25px 10px 25px;
}

/* header style end */
</style>

<header>

<div id="header_root">
	<div id="member_space">
		<c:if test="${empty sessionScope.mem_id }">
			<button id="top_login_button" class="top_left_button" onclick="login()">로그인</button>
			<button id="top_signup_button" class="top_right_button" onclick="location.href='joinForm.do'">회원가입</button>
		</c:if>
		<c:if test="${not empty sessionScope.mem_id }">
			<span>${sessionScope.mem_id }님 환영합니다!</span>
			<button id="top_logout_button" class="top_left_button" onclick="logoutConfirm()">로그아웃</button>
			<button id="top_my_page_button" class="top_right_button" onclick="location.href='weather.do?sido=${locCode }'" >마이코기</button>
		</c:if>
	</div>
	<div id="header_top">
		<div id="header_logo">
			<a href="main.do">
				<img alt="dog_icon" src="images/dog_icon.png" id="dog_icon">
			</a>
		</div>
		<div id="weather_today">
			<%-- <span id="weather_loc"><c:out value="${sessionScope.loc }"></c:out> </span> --%>
			<span id="weather_cloud">날씨 <x:out select="$wf"/></span>
			<span id="weather_tem"><x:out select="$temp"/>도</span>
			<%-- <span id="weather_rain">강수확률:<x:out select="$rp"/>%</span> --%>
			<!-- <img alt="sun_icon" src="images/sun_icon.png" id="sun_icon" height="50px" width="50px"> --> 
		</div>
	</div>
	<div id="header_left">
	</div>
	
	<div id="header_right">
	</div>
	
	<div id="header_center">
		<div id="menu_bar">
			<table class="menu_bar_table">
				<tr>
					<td onclick="location.href='main.do'">WELL-SEE COORDI</td>
					<td onclick="location.href='styleList.do?tagId=1&tagType=1'">스타일 추천</td>
					<td onclick="location.href='bbs.do'">게시판</td>
					<td onclick="location.href='weather.do?sido=${locCode }'">마이코기</td>
				</tr>
			</table>
		</div>
		<div id="search_bar">
			<form action="search.do" method="get">
				<div id="search_input">
					<input type="text" id="search_word" name="search_word" class= "search_word" value='' placeholder="SEARCH" autocomplete="off">
					<input type="image" alt="검색" id="search_button" src="images/search_button.png">
				</div>
				<br>
				<div id="search_radio">
					<input type="radio" id="search_style" name="search_target" value="0" checked><label for="search_style">스타일</label>
					<input type="radio" id="search_board" name="search_target" value="1"><label for="search_board">게시판</label>
				</div>
				<!-- <select id="search_target" name="search_target">
					<option value="0" selected="selected">스타일</option>
					<option value="1">게시판</option>
				</select> -->
			</form>
		</div>
	</div>
	<div id="header_bottom">
		<div id="gender_selector">
			<table>
				<tr>
					<c:if test="${sessionScope.gender == 1 }">
						<td id="male_selector" onclick="location.href='genderSelector.do?select=1&thisPage='+window.location.href.split('jsp_style_recom/')[1]" style="background-color: #E0DCDC">남자</td>
						<td id="female_selector" onclick="location.href='genderSelector.do?select=2&thisPage='+window.location.href.split('jsp_style_recom/')[1]">여자</td>
					</c:if>
					<c:if test="${sessionScope.gender == 2 }">
						<td id="male_selector" onclick="location.href='genderSelector.do?select=1&thisPage='+window.location.href.split('jsp_style_recom/')[1]">남자</td>
						<td id="female_selector" onclick="location.href='genderSelector.do?select=2&thisPage='+window.location.href.split('jsp_style_recom/')[1]" style="background-color: #E0DCDC">여자</td>
					</c:if>
				</tr>
			</table>
		</div>
	</div>
</div>


</header>
</html>