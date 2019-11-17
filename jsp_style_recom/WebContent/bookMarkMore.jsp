<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>


<body>

<h1><em>${mem_id }</em>님의 즐겨찾기 목록</h1>
<br>
<c:forEach var ="i" begin="0" end="${fn:length(stylePicture)-1 }">
<a href="styleDetail.do?stl_id=${bookmark[i] }&onoff=1">
<img alt="${stylePicture[i] }" src="./images/category_images/${stylePicture[i] }" width="300px" height="300px">
</a>
</c:forEach>

</body>


</html>