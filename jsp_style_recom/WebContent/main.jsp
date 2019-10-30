<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#hot_tag_list{
	float: right;
	border: 2px solid;
}
#hot_tag_list a:link{text-decoration: none; color: black;}
#hot_tag_list a:active{text-decoration: none; color: black;}
#hot_tag_list a:visited{text-decoration: none; color: black;}
#hot_tag_list a:hover{text-decoration: none; color: black;}

</style>
</head>
<%@include file="common/header.jsp" %>
<body>
	<h2>Main Page</h2>
	<div id="hot_tag_list">
		<span >@인기검색어@</span>
		<ol>
			<c:forEach var="list" items="${tagList }">
				<li><a href="search.do?search_word=${list }&search_target=0">${list }</a></li>
			</c:forEach>
		</ol>
	</div>
</body>
<%@include file="common/footer.jsp" %>
</html>