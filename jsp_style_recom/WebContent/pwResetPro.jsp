<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
</head>
<body>
<c:if test="${result>0 }">
<script type="text/javascript">
		alert("패스워드 ${mem_pw}로 수정되었습니다."); 
		location.href="loginForm.do";
	</script>
</c:if>	
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("회원정보 수정 실패"); 
		location.href="loginForm.do";
	</script>
</c:if>
</body>
</html>