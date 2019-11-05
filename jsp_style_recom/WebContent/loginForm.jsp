<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디와 암호를 입력하세요</h1>
<form action="loginPro.do" name="frm" onsubmit="return chk()" >
	아이디 : <input type="text" name="mem_id"><p>
	암호 : <input type="password" name="mem_pw"><p>
	<input type="submit" value="입력완료">
</form>


</body>
</html>