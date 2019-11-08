<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	$(function(){
		$('#go_to_top_button').click(function(){
			var offset = $("#header_logo").offset(); //선택한 태그의 위치를 반환
	        $('html').animate({scrollTop : offset.top}, 400);//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
		});
	})
</script>

<style type="text/css">
footer{
	padding: 4%;
	display: flow-root;
	margin-top: 2%;
}

#footer_root{
	margin-left: 10%;
	margin-right: 10%;
	padding: 6%;
	background-color: #d5d5d5;
}

#footer_right{
	float: right;
	margin-top: -60px;
	margin-right: -60px;
}
#footer_left{
	float: left;
	margin-top: -60px;
	margin-left: -50px;
}
#footer_center{
	margin-left: 140px;
	margin-right: 140px;
	text-align: center;
}

#go_to_top_button{
	color: #5d5d5d; 
	background-color: #d5d5d5;
	border : none;
	border-bottom: solid 2px #5d5d5d;
	float: right;
	cursor: pointer;
	padding: 1px;
}
#project_desc{
	color: #5d5d5d;
	font-size: 0.7em; 
}

#bottom_member_space{
	border: none;
	border-bottom: solid 2px #5d5d5d;
}
.bottom_left_button{
	background-color: #d5d5d5;
	border: none;
	padding: 2px;
	cursor: pointer;
	color: #5d5d5d;
}
.bottom_right_button{
	background-color: #d5d5d5;
	border: none;
	padding: 2px;
	cursor: pointer;
	color: #5d5d5d; 
}
</style>

<footer>
	<div id="footer_root">
		<div id="footer_right">
			<div>
				<button id="go_to_top_button">To top</button>
			</div>
			<br>
			<div id="bottom_member_space">
				<c:if test="${empty sessionScope.mem_id }">
					<button id="bottom_login_button" class="bottom_left_button" onclick="location.href='loginForm.do'">Login</button>
					<button id="bottom_signup_button" class="bottom_right_button" onclick="location.href='joinForm.do'">Sign_up</button>
				</c:if>
				<c:if test="${not empty sessionScope.mem_id }">
					<button id="bottom_logout_button" class="bottom_left_button" onclick="location.href='logout.do'">Logout</button>
					<button id="bottom_my_page_button" class="bottom_right_button" onclick="location.href='weather.do?sido=${locCode }'" >MY Corgi</button>
				</c:if>
			</div>
		</div>
		<div id="footer_left">
			<div id="project_desc">
				<div><h4>프로젝트 소개</h4>
					<span>프로젝트 웰시코디는 사용자의 다양한 상황을 분석하여</span><br>
					<span>상황에 적절한 스타일 코디를 추천해주는 웹 사이트 구축을 목표로 만들어진 프로젝트입니다.</span> 
				</div>
				<br>
				<div>
					<h4>이용약관</h4>
					<span>본 프로젝트는 상업용으로 개발되지 않은 오픈소스 프로젝트입니다.</span><br>
					<span>프로젝트 소스 운용상의 모든 책임은 사용자 본인에게 있습니다.</span>
				</div>
			</div>
		</div>
		<div id="footer_center">
		</div>
	</div>
</footer>
</html>