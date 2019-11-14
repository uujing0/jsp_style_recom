<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.a {
	border-color: #FFBB00;
	border-width: 5px;
	box-shadow: 2px 2px 5px 2px gray;

</style>
</head>
<body>
	
			<form action="deletePro.do">
				<fieldset >
					<legend>
				<h1>회원 탈퇴</h1>
			        </legend>
					<!-- <label for="mem_pw">암호 : </label>  -->
					 <input type="hidden" name="mem_id" value="${mem_id}">
					 <h3>아이디:  ${mem_id}</h3>
			 		 <input type="password" name="mem_pw" required="required"  class="a" placeholder="암호 입력하세요" id="mem_pw"><p>		 	
			 		<input type="submit" value="확인">
				</fieldset>	
			</form>	
 

</body>
</html>