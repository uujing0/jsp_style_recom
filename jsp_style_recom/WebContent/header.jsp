<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">	
	//문서 시작시 적용
	$(function(){
		
		$("#top_login_button").click(function(){
			sessionStorage.setItem('id',"asd");
			location.href = "loginForm.do";
			//location.href = "login.do";
		});
		
		$("#bottom_login_button").click(function(){
			sessionStorage.setItem('id',"asd");
			location.href = "loginForm.do";
			//location.href = "login.do";
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
			//세션 제거 필요
			sessionStorage.removeItem('id');
			location.href = "main.do";
		})
		
		$("#bottom_logout_button").click(function(){
			//세션 제거 필요
			sessionStorage.removeItem('id');
			location.href = "main.do";
		})
		
		//sessionStorage.setItem('id',"asd");
		
		//로그인 상태에 따라 표기되는 버튼을 관리
		if(!sessionStorage.getItem('id')){
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
/* theme color 
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
	padding-top: 8px;
	float:right;
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

</head>

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
			<img alt="sun_icon" src="images/sun_icon.png" id="sun_icon" height="50px" width="50px"> 
		</div>
		<br>
	</div>
	
	<div id="header_center">
		<div id="menu_bar">
			<table class="menu_bar_table">
				<tr>
					<td><a href="style.do">스타일 추천</a></td>
					<td><a href="board.do">게시판</a></td>
					<td><a href="member.do">마이코기</a></td>
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