<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("탈퇴 되었습니다. 이용해 주셔서 감사 합니다!");  
		sessionStorage.removeItem('mem_id');
		location.href="main.do";
	</script>
	
</c:if>
<c:if test="${result <= 0 }">  
	<script type="text/javascript">
		alert("탈퇴 실패입니다.");  
		location.href="main.do";
	</script>
</c:if>



</body>
</html>