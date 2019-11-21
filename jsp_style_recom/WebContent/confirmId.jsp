<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function wincl() {
		opener.document.frm.mem_id.value="${param.mem_id}";
	window.close();
	}
</script>
<style type="text/css">

h3.align-center {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}



.a {
    padding: 20px 10px;
	width: 50%; 
} 

.confirm_Button {
	border: solid 2px;
	border-bottom: solid 4px;
	border-color: #F9F7F6;
	background-color: #373B43;
	color: white;
	font-size: 15px;
	padding:12px 26px; 
	
}


</style>
</head>
<body bgColor="#f9f7f6">
 <c:if test="${result==-1}">
	<h3 class="a"> ${param.mem_id} 는 사용해도 좋습니다</h3><p>
	<form>
	<input  class="confirm_Button" type="button" value="닫기" onclick="wincl()">
	</form>
</c:if>

<c:if test="${result==1}">  
	<script type="text/javascript">
		alert("이미 존재하는 아이디 입니다.");  
		/* location.href="joinForm.do"; */
	  </script>
	   <h3 class="align-center">다른 아이디를 입력해 주세요</h3><p>
	   <h3>아이디</h3>	
	  <form>
	    <input class="a" type="text" name="mem_id"><p>
		<input class="confirm_Button" type="submit" value="확인">
     </form>
   
 </c:if>

<c:if test="${result==0}">  
	<script type="text/javascript">
		alert("${param.mem_id} 아이디는 3년간 사용할 수 없으니 다른 아이디로 가입해 주시면 감사하겠습니다.");  
		/* location.href="joinForm.do"; */
	  </script>
	   <h3 class="align-center">다른 아이디를 입력해 주세요</h3><p>
	   <h3>아이디</h3>	
      <form>
		<input class="a" type="text" name="mem_id"><p>
		<input class="confirm_Button" type="submit" value="확인">
     </form>
</c:if>

</body>
</html>