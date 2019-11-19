<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
</script>
</head>
<body>
	<c:if test="${result == 1}">
		<c:set var="mem_id" value="${mem_id}"/>
		<script type="text/javascript">
			alert("로그인을 성공하였습니다.")
<<<<<<< HEAD
			opener.document.location.reload(); //팝업창닫으면서 원래창 새로고침
            self.close();
=======
			sessionStorage.setItem('mem_id', getParameterByName('mem_id'));
			sessionStorage.setItem('mem_name', getParameterByName('mem_name'));
			sessionStorage.setItem('mem_phone', getParameterByName('mem_phone'));
			sessionStorage.setItem('mem_email', getParameterByName('mem_email'));
			location.href = "main.do"
			//window.close();
>>>>>>> refs/remotes/origin/HJ
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호를 확인해주세요")
			history.go(-1)
		</script> 
	</c:if>
</body>
</html>