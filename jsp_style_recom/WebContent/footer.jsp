<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 -->
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
	color: white;
	background-color: #d5d5d5;
	border: none;
	float: right;
}
#project_desc{
	float: left;
}

</style>
<footer>
	<div id="footer_root">
		<div id="footer_right">
			<div>
				<button id="go_to_top_button">To top</button>
			</div>
			<br>
			<div id="member_space">
				<button id="bottom_login_button" class="left_button">로그인</button>
				<button id="bottom_signup_button" class="right_button">회원가입</button>
				<button id="bottom_logout_button" class="left_button">로그아웃</button>
				<button id="bottom_my_page_button" class="right_button">마이코기</button>
			</div>
		</div>
		<div id="footer_left">
			<div>이용약관</div>
			<br>
			<div id="project_desc">이 부분은 프로젝트 소개 글입니다.</div>
		</div>
		<div id="footer_center">
		</div>
	</div>
</footer>
</html>