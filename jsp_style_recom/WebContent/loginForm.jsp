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
<link rel="stylesheet" type="text/css" href="HJ_style.css">
</head>
<body>
	<div class="content">
	<br>
		<div class="agree">
			<ul class="idpwSrh">
				<li>
					<div class="srhBox br">
						<div class="srhTop">
						<h1>로그인</h1>
						<br/>
						로그인 하시려면 아이디와 비밀번호를 입력하세요.
						<br/>
						</div>
						<div class="info">
	<form action="loginPro.do" onsubmit="return chk()" >
		<fieldset></fieldset>
			<legend>로그인 폼</legend>
			<p>
			<label>아&nbsp;이&nbsp;디</label><label><input type="text" name="mem_id" required="required"/></label>
			</p>
			<br/>
			<br/>
			<p>
			<label>비밀번호</label><label><input type="password" name="mem_pw" required="required"/></label>
			</p>
			<br/>
			<br/>
			<button type="submit">로그인</button>
			<br/>
			<br/>
					&nbsp;&nbsp;<a href="idSrhForm.do">아이디 찾기</a>
					&nbsp;/&nbsp;
					&nbsp;<a href="pwSrhForm.do">비밀번호 찾기</a>
	<br/>
	</fieldset>
	</form>
	</div>
	</div>
	</li>
	</ul>
	</div>
	</div>
</body>
</html>