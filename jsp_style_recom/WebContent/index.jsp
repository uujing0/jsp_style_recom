<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.item {
		width: 400px;
		float: left;
		margin: 0.13px;
		text-align: center;
	}
</style>
<script type="text/javascript">
	location.href = "main.do"
</script>
</head>
<body>
<<<<<<< HEAD
	
=======
	<h2>New Item</h2>
		<c:forEach items="${newProductList }" var="productVO"></c:forEach>
>>>>>>> branch 'WY' of https://github.com/uujing0/jsp_style_recom.git
</body>
</html>