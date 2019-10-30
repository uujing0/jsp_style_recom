<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인</h2>
	<!-- TODO: 값 없을 경우 alert -->
	<form action="loginPro.do">
		<table>
			<tr>
				<td><input type="text" name="mem_id" required="required"></td>
			</tr>
			<tr>
				<td><input type="password" name="mem_pw" required="required"> </td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="아이디 찾기" onclick="location.href='idSearchForm.jsp'">
				</td>
				<td>
					<input type="button" value="비밀번호 찾기" onclick="location.href='pwSearchForm.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>