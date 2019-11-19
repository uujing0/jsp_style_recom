<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#bmMore{
	margin-left: 70px; 
	margin-top : 60px;
	font-size: 16px;
}
#bmMore_hr hr {
	width: 1320px;
	border: none;
	border: 0.6px solid #E7E2E1;
	margin-top : 80px;
	margin-left: 20px;
}
</style>

</head>


<body>
<div id ="bmMore">
<h1>${mem_id }님의 즐겨찾기 목록</h1>
</div>
<div id = "bmMore_hr">
<hr>
</div>
<c:forEach var ="i" begin="0" end="${fn:length(stylePicture)-1 }">
<a href="styleDetail.do?stl_id=${bookmark[i] }&onoff=1">
<img alt="${stylePicture[i] }" src="./images/category_images/${stylePicture[i] }" width="300px" height="300px" 
style="padding: 16px">
</a>
</c:forEach>

</body>


</html>