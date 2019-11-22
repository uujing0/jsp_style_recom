<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script type="text/javascript">
	function chk() {
		var mem_id = document.getElementById("mem_id")
		var mem_pw = document.getElementById("mem_pw")
		
		if (!mem_id.value || !mem_pw.value) {
			alert("아이디 또는 패스워드를 입력하세요")
			return false
		}
		
		return true
	}
</script>
<style type="text/css">
h2.loginForm_title {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}

.loginForm_ul {
	list-style-type: none;
	padding: 0;
	width: 80%;
	margin-left: 10%;
}

.loginForm_ul li label {
	display: block;
  	color: #343A40;
  	padding: 10px 0px;
  	font-size: 15px;
}

.loginForm_ul li input {
	padding: 12px 10px;
	border: 1px solid #e0dcdc;
	width: -webkit-fill-available;
}

.loginForm_loginButton {
	border: solid 2px;
	border-bottom: solid 4px;
	border-color: #F9F7F6;
	background-color: #373B43;
	color: white;
	font-size: 15px;
	padding:12px 26px;
}

.loginForm_searchButton {
	font-size: 15px;
	color: #343A40;
	border: none;
	padding: 3px;
	margin: 0px 10px 0px 0px;
	background-color: #f9f7f6;
}

</style>
</head>

<body bgColor="#f9f7f6">
	<h2 class="loginForm_title">로그인</h2>
	<form action="loginPro.do" onsubmit="return chk()" >
		<ul class="loginForm_ul">
			<li class="list-item">
				<label>아이디</label>
				<input name="mem_id" type="text" required="required">
			</li>
			<li>
				<label>비밀번호</label>
				<input name="mem_pw" type="password" required="required">
			</li>
		</ul>
		
		<div style="text-align: center; margin: 30px 0px 40px 0px;">
			<input class="loginForm_loginButton" type="submit" value="LOGIN">
		</div>
		<div style="text-align: center;">
			<button class="loginForm_searchButton" onclick="location.href='idSrhForm.do'">아이디 찾기</button>
			&nbsp;|&nbsp;
			<button class="loginForm_searchButton" onclick="location.href='pwSrhForm.do'">비밀번호 찾기</button>
		</div>
	</form>
</body>
</html>