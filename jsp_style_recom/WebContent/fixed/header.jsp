<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* header style start */
header{
	border: 1px solid;
	background-color: #5D5D5D;
	height: 130px;
	border-radius: 10px;
}

header a:link{color: white; text-decoration: none;}
header a:visited{color: white; text-decoration: none;}
header a:hover{color: black; text-decoration: none;}
header a:active{color: black; text-decoration: none;}

/* icon */
#dog_icon{
	border-radius: 15px;
	margin-top: 10px;
	margin-left: 10px;
}
#sun_icon{
	border-radius: 15px;
}

/* header section */
#header_left{
	float: left;
}
#header_center{
	margin-left: 140px;
	margin-right: 140px;
	text-align: center;
}
#header_right{
	float: right;
}

/* weather_today */
#weather_today{
	padding: 10px;
	float:right;
}

/* member_space */
#member_space{
	padding: 10px;
	float:right;
}

/* menu_bar */
#menu_bar{
	padding: 10px;
	display: inline-block;
}
#menu_bar_table{
	margin: auto;
	text-align: center;
}
#menu_bar_table td{
	padding: 5px 25px 5px 25px;
	font-size: 20px;
	border-radius: 15px;
	
}
#menu_bar_table td:hover {
	background-color: #EAEAEA;
	color: black;
}

.tag:hover{
	background-color: #8C8C8C;
	border-radius: 15px;
	color: white;
	padding: 5px;
	font-size: 20px;
}

/* search_bar */
#search_bar{
	padding: 10px;
	display: inline-block;
}

#search_button{
	border-radius: 15px;
}

#search_tag{
	background-color: #EAEAEA;
	border-radius: 15px;
	color: black; 
}

/* gender_selector */
#gender_selector{
	float: left;
}
#gender_selector_male:hover{
	background-color: #4374D9;
	border-radius: 15px;
	color: white;
	padding: 5px;
}

#gender_selector_male:active{
	
}

#gender_selector_female:hover{
	background-color: #CC3D3D;
	border-radius: 15px;
	color: white;
	padding: 5px;
}

/* header style end*/
</style>

</head>

<header>

<div id="header_left">
	<div id="header_logo">
		<a href="main.do">
			<img alt="dog_icon" src="images/dog_icon.png" id="dog_icon">
		</a>
	</div>
</div>

<div id="header_right">
	<div id="weather_today">
		<img alt="sun_icon" src="images/sun_icon.png" id="sun_icon"> 
	</div>
	<br>
	<div id="member_space">
		<button id="login">로그인</button>
		<button id="find_id/pw">회원가입</button>
		<button id="logout">로그아웃</button>
		<button id="my_page">마이페이지</button>
	</div>
</div>

<div id="header_center">
	<div id="menu_bar">
		<table id="menu_bar_table">
			<tr>
				<td><a href="main.do">메인메뉴</a></td>
				<td><a href="style.do">스타일 추천</a></td>
				<td><a href="board.do">게시판</a></td>
				<td><a href="member.do">회원관리</a></td>
			</tr>
		</table>
	</div>
	<br>
	<div id="search_bar">
		<form action="">
			<input type="submit" value="검색" id="search_button">
			<input type="text" id="search_word" value="">
		</form>
		<div id="search_tag">
			
			<div id="gender_selector">
				<span id="gender_selector_male">남</span>
				<span id="gender_selector_female">여</span>
			</div>	
			
			<span class="tag">#티셔츠</span>
			<span class="tag">#와이셔츠</span>
			<span class="tag">#청바지</span>
			
		</div>
	</div>
</div>



</header>
</html>