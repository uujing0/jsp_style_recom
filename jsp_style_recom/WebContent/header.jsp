<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="./js/jquery.js"></script>
<script src="./js/jquery-ui.js"></script>


<!-- session이 없으면(비로그인시) 디폴트 값으로 서울의 날씨 코드를 넣어준다. -->
<c:if test="${sessionScope.loc == null}">
	<c:set var="loc" value="1168066000" scope="session"></c:set>
</c:if>
<!-- gender 1:남자, 2:여자 -->

<c:if test="${sessionScope.gender == null }">
	<c:set var="gender" value="2" scope="session"></c:set>
</c:if>

<c:catch var="exception"> 
	<!-- 받은 지역코드에 맞는 날씨 데이터를 기상청에서 가져온다. -->
	<c:import var="xmldata" url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=${sessionScope.loc }" charEncoding="utf-8"></c:import>
	<x:parse var="doc" xml="${xmldata }"></x:parse>
	<x:set var="wf" select="$doc//*/data/wfKor"/>
	<x:set var="temp" select="$doc//*/data/temp"/>
	<x:set var="rp" select="$doc//*/data/pop"/>
</c:catch>

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
		if('<x:out select="$wf"/>'){
			weatherIcon('<x:out select="$wf"/>')	
		}
	})
	
	function weatherIcon(wf){//weather icon 추가
		var icon = null;
		switch(wf){
		case "맑음":   	icon="ico01.png"; break; 
		case "구름 조금":	icon="ico02.png"; break;
		case "구름 많음":	icon="ico03.png"; break;
		case "흐림": 		icon="ico04.png"; break;
		case "비": 		icon="ico05.png"; break;
		case "눈/비": 	icon="ico06.png"; break;
		case "눈": 		icon="ico07.png"; break;
		default: alert("날씨 데이터 없음")
		}
		document.getElementById("weather_icon").innerHTML = "<img alt='weather_pic' src='images/"+icon+"' id='weather_pic' height='50px' width='50px'>";
	}
	
	function logoutConfirm(){
		if(confirm("정말 로그아웃 하시겠습니까?") == true){
	        location.href='logout.do'
	    }
	    else{
	        return ;
	    }
	}
	
	function myCogiMenuControler(){
		
		if('${sessionScope.mem_id}'){
			location.href='weather.do?sido=${sessionScope.loc}'
		}else{
			alert("로그인 해주세요.")
			login()
		}
	}
	
	function searchWordAutoComplete(){
		/* int load = 0;
		
		if('${tagList }'){
			
			var autoList = '${tagList }'.split('[')[1].split(']')[0].split(',')
			
		    $("#search_word").autocomplete({
		        source: autoList,
		        select: function(event, ui) {
		            console.log(ui.item);
		        },
		        focus: function(event, ui) {
		            return false;
		        }
		
		    });			
		} */
	}
	
	function login() {
        window.open('loginForm.jsp','로그인','width=500,height=500,left=700,top=200,status=no,scrollbars=no')
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

/* icon */
#header_logo{
	text-align: center;
}
#header_logo_pic{
}
#sun_icon{
	border-radius: 5px;
	display: inline-block;
}

/* header section */
#header_top{

}
#header_center{
	margin-top: 0px; 
	background-color: #E55151;
	border-bottom: 2px solid #d5d5d5;
	/* height: 72px; */
}

/* weather_today */
#weather_today{
	margin-top: -100px;
	margin-right: 30px;
	float:right;
	color: #c3c3c3;
	font-size: 18px;
}
#weather_pic{
	margin-left: 10px;
	vertical-align: -15px; 
}

/* member_space */
#member_space{
	float:right;
	padding: 10px 10px 0px 0px;
	color: #373b43;
}

.top_left_button{
	background-color : #F9F7F6;
	border : none;
	font-size: 15px;
	cursor: pointer;
	font-weight: bold;
}
 
.top_right_button{
	background-color : #F9F7F6;
	border : none;
	font-size: 15px;
	cursor: pointer;
	font-weight: bold;
}

/* menu_bar */
#menu_bar{
	display: inline-block;
	cursor: pointer;
}
.menu_bar_table{
	text-align: center;
	background-color: #E55151;
	color: white;
	border-spacing: 0px;
}
.menu_bar_table td{
	padding: 0px 30px;
	font-size: 20px; 
}
.menu_bar_table td:hover{
	box-shadow: 0px -2px white inset;
}
.menu_bar_table td:first-child{
	padding: 15px 30px 15px 30px;
	background-color: #D34747;
	font-size: 30px;
	font-weight: bold;
}

/* search_bar */
#search_bar{
	margin: 10px 29px 0px 0px;
	display: inline-block;
	float: right;
}
#search_target{
	border: none;
	font-size: 15px;
}
#search_input{
	border-bottom: 1px solid white;
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
	height: 23px;
	width: 30px;
}

#search_button:hover{
	border-radius: 5px;
	background-color: #D34747;
	border: none;
}

#search_radio{
	float: right;
	color: white;
	margin-top: 7px;
	font-size: 13px;
}

/* #search_radio  */
#search_radio input[type='radio'],
#search_radio input[type='radio']:checked {
  -webkit-appearance: none;
  width: 0.8rem;
  height: 0.8rem;
  border-radius: 100%;
  margin-right: 3px;
}

#search_radio input[type='radio'] {
  background-color: white;
}
#search_radio input[type='radio']:checked {
  background-color: #D34747;
    border: 3px solid white;
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

.ui-autocomplete{
	list-style: none;
	background-color: white;
	cursor: pointer;
}
/* hot_tag */

#hot_tag_list{ 
	position:absolute;
	/* border: 2px solid; */
	right: 50px;
	float: right;
	top: 400px;
	width: 170px;
	/*
	width: 10%;
	margin-top: 1%;
	margin-bottom: 2%; */

}

#hot_tag_Tic{ 
	padding-left: 10px;
    text-decoration: none;
    color: white;
    font-weight: bold;
    display: inline-block;
    border-right: 30px solid transparent;
    border-bottom: 30px solid #373b43;
    height: 0;
    line-height: 40px; 
}

#hot_tag_top10{
	border: 1px solid #B0B5BD;
	background-color: #f9f7f6;
	color: #666666;
}

#hot_tag_top10 ol li{
	margin: 0px 0px 10px 0px;
}

#hot_tag_list a:link{text-decoration: none; color: #666666;} 
#hot_tag_list a:active{text-decoration: none; color: #666666;}
#hot_tag_list a:visited{text-decoration: none; color: #666666;}
#hot_tag_list a:hover{text-decoration: none; color: #666666;}

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
			<button id="top_my_page_button" class="top_right_button" onclick="myCogiMenuControler()" >마이코기</button>
		</c:if>
	</div>
	<div id="header_top">
		<div id="header_logo">
			<a href="main.do">
				<img alt="logo" src="images/logo.jpg" id="header_logo_pic">
			</a>
		</div>
		<div id="weather_today">
			<span id="weather_cloud">날씨 <x:out select="$wf"/></span>
			<span id="weather_tem"><x:out select="$temp"/>도</span>
			<span id="weather_icon"></span>
		</div>
	</div>
	<div id="header_center">
		<div id="menu_bar">
			<table class="menu_bar_table">
				<tr>
					<td onclick="location.href='main.do'">WELL-SEE COORDI</td>
					<td onclick="location.href='styleList.do?tagId=1&tagType=1'">스타일 추천</td>
					<td onclick="location.href='bbs.do'">스타일 배틀</td>
					<td onclick="myCogiMenuControler()">마이코기</td>
				</tr>
			</table>
		</div>
		<div id="search_bar">
			<form action="search.do" method="get" id="search_form">
				<div id="search_input">
					<input type="text" id="search_word" name="search_word" class= "search_word" value='' placeholder="SEARCH" autocomplete="off" onkeydown="searchWordAutoComplete()">
					<input type="image" alt="검색" id="search_button" src="images/search_button.png">
				</div>
				<div id="search_radio">
					<input type="radio" id="search_style" name="search_target" value="0" checked><label for="search_style">스타일</label>
					<input type="radio" id="search_board" name="search_target" value="1"><label for="search_board">게시글</label>
				</div>
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