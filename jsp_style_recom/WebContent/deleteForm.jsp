<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>




<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1.deleteForm_title {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}

h3.align-center {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}



.deleteForm_ul {
	list-style-type: none;
	 /*  text-align: center;  */ 
	padding: 0;
	width: 80%;
	 margin-left: 38%; 
} 

 
 
.deleteForm_ul li input {
	padding: 20px 0px;
	border: 1px solid #e0dcdc;
	width: 30%;  
} 

.deleteForm_deleteButton {
	border: solid 2px;
	border-bottom: solid 4px;
	border-color: #F9F7F6;
	background-color: #373B43;
	color: white;
	font-size: 15px;
	padding:12px 26px; 
	width: 30%; 
	
} 

.element{
  font-size: 20px;
  font-weight:bold;
}
</style>




</head>
<%@include file="header.jsp" %>
<body bgColor="#f9f7f6">
	<h1 class="deleteForm_title">회원탈퇴</h1>
    <h3 class="align-center"> 회원 탈퇴를 위해서 비밀번호를 확인합니다. </h3>
	  <form action="deletePro.do">
		<ul class="deleteForm_ul">
			<li>
									
				<input type="hidden" name="mem_id" value="${mem_id}"> <br />
				<input type="password" name="mem_pw" required="required" placeholder="암호 입력하세요" id="mem_pw"><br>
				<input class="deleteForm_deleteButton" type="submit" value="탈퇴하기">
		    </li>				
		
		</ul>
	</form>
</body>
<%@include file="footer.jsp" %>
</html>