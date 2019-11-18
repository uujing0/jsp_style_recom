<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title></head><body>
	<c:if test="${mem_pw != null }">
		<script type="text/javascript">
			alert("당신의 패스워드는 ${mem_pw} 입니다.");  
			location.href="loginForm.do";
		</script>
	</c:if>
	<c:if test="${mem_pw == null }">  
		<script type="text/javascript">
			alert("존재하지 않는 회원이거나 탈퇴한 회원입니다.");  
			location.href="loginForm.do";
		</script>
	</c:if>
</body>
</html>