<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function genderSelectorMale(){
		document.getElementById("gender_selector_male").style.backgroundColor="#4374D9";
		document.getElementById("gender_selector_male").style.color="white";
		document.getElementById("gender_selector_female").style.backgroundColor="#FFD8D8";
		document.getElementById("gender_selector_female").style.color="black";
		$("#search_tag").empty();
		for(var i = 1 ; i <= 10 ; i++){
			$("#search_tag").append("#<span class='tag'>"+i+"번바지 </span>");
			if(i == 5){
				$("#search_tag").append("<br>");
			}
		}
		//남성복 태그를 불러오는 코드
	}
	
	function genderSelectorFemale(){
		document.getElementById("gender_selector_male").style.backgroundColor="#B2CCFF";
		document.getElementById("gender_selector_male").style.color="black";
		document.getElementById("gender_selector_female").style.backgroundColor="#CC3D3D";
		document.getElementById("gender_selector_female").style.color="white";
		$("#search_tag").empty();
		for(var i = 1 ; i <= 10 ; i++){
			$("#search_tag").append("#<span class='tag'>"+i+"번옷 </span>");
			if(i == 5){
				$("#search_tag").append("<br>");
			}
		}
		//여성복 태그를 불러오는코드
	}

	$(function(){
		
		genderSelectorMale()//시작시 남성 태그를 불러온다
		
		$(".tag").click(function(){
			$("#search_word").val(this.innerHTML);
		});
		
		$("#gender_selector_male").click(function(){
			genderSelectorMale()
		})
		
		$("#gender_selector_female").click(function(){
			genderSelectorFemale()
		})
		
		$("#logout").hide();
		$("#my_page").hide();
	})
</script>

<style type="text/css">
/* header style start */
header{
	border: 1px solid;
	background-color: #5D5D5D;
	height: 130px;
	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 30px;
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
	border-radius: 5px;
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

/* menu_bar */
#menu_bar{
	padding: 10px;
	display: inline-block;
	margin-bottom: -20px;
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
}

#search_button{
	border-radius: 5px;
	background-color: #EAEAEA;
	border: none;
}

#search_button:hover{
	border-radius: 5px;
	background-color: #FFE08C;
	border: none;
}

#search_tag{
	background-color: #EAEAEA;
	border-radius: 10px;
	color: black;
	margin-top: 5px; 
}

.tag:hover{
	background-color: #8C8C8C;
	border-radius: 15px;
	color: white;
	padding: 5px;
}

/* gender_selector */
#gender_selector{
	float: left;
}

#gender_selector button{
	background-color: #EAEAEA;
	border: none;
}

#gender_selector_male{
	margin-right: -3px;
	border-radius: 15px;
}

/* #gender_selector_male:hover{
	background-color: #4374D9;
	color: white;
	margin-right: -4px;
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
}

#gender_selector_male:active{
	background-color: #4374D9;
	color: white;
	margin-right: -4px;
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
} */

#gender_selector_female{
	margin-left: -3px;
	border-radius: 15px;
}

/* #gender_selector_female:hover{
	background-color: #CC3D3D;
	color: white;
	margin-left: -3px;
	border-top-right-radius: 15px;
	border-bottom-right-radius: 15px;
}
#gender_selector_female:active{
	background-color: #CC3D3D;
	color: white;
	margin-left: -3px;
	border-top-right-radius: 15px;
	border-bottom-right-radius: 15px;
}*/



/* header style end */
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
		<img alt="sun_icon" src="images/sun_icon.png" id="sun_icon" height="50px" width="50px"> 
	</div>
	<br>
	<div id="member_space">
		<button id="login" class="left_button">로그인</button>
		<button id="find_id/pw" class="right_button">회원가입</button>
		<button id="logout" class="left_button">로그아웃</button>
		<button id="my_page" class="right_button">마이페이지</button>
	</div>
</div>

<div id="header_center">
	<div id="menu_bar">
		<table id="menu_bar_table">
			<tr>
				<td><a href="main.do">메인메뉴</a></td>
				<td><a href="style.do">스타일 추천</a></td>
				<td><a href="bbs.do">게시판</a></td>
				<td><a href="member.do">회원관리</a></td>
				<td><a href="member.do">메뉴바미확정</a></td>
			</tr>
		</table>
	</div>
	<br>
	<div id="search_bar">
		<form action="">
			<input type="submit" value="검색" id="search_button">
			<select id="search_target">
				<option value="0">스타일</option>
				<option value="1">게시판</option>
			</select>
			<input type="text" id="search_word" class= "search_word" value="">
		</form>
		<div id="gender_selector">
			<button id="gender_selector_male">남</button>
			<button id="gender_selector_female">여</button>
		</div>
		<div id="search_tag">
			#<span class="tag">티셔츠</span>
			#<span class="tag">와이셔츠</span>
			#<span class="tag">청바지</span>
			#<span class="tag">면바지</span>
			#<span class="tag">면바지</span>
			<br>
			#<span class="tag">티셔츠</span>
			#<span class="tag">와이셔츠</span>
			#<span class="tag">청바지</span>
			#<span class="tag">면바지</span>
			#<span class="tag">면바지</span>
		</div>
	</div>
</div>
</header>
</html>