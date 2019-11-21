<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 등록 프로세스</title>
</head>
<body>

<c:if test="${result > 0 }">
	<script type="text/javascript">
		opener.document.location.reload();//팝업창닫으면서 원래창 새로고침
		self.close();
	</script>
</c:if>	
<c:if test="${result == 0 }">
	<script type="text/javascript">

		alert("입력오류");
		history.go(-1);
	</script>
</c:if>
</body>
</html>