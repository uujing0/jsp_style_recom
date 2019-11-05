<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#iposition {
		position:absolute; top:840px; left:400px;
	}
	#prdinfo {
		position: absolute; top: 200px; left:600px;
	}
	.item {
		
		width: 200px;
		float: right;
		margin: 0 13px;
		text-align: center;
	}
</style>
</head>
<%@include file="header.jsp" %>
<body>
	<h2>상품 상세 페이지</h2>
    <iframe id="iposition" src="prd_Detail.html" width="1200" height="100%" scrolling="yes" frameborder="0"></iframe>
<table border="0" id="prdinfo">
	<tr>
		<td>
			<img src="{path}/images/${dao.prd_thumbnail }" width="340" height="300">
		</td>
		<td>
			<table border="1" >
				<tr align="center">
					<td style="font-size: 20px; height: 100px; width: 100px">상품명</td>
					<td style="height: 100px; width: 300px">${dao.prd_name }</td>
				</tr>
				<tr align="center">
					<td style="font-size: 20px; height: 100px; width: 100px" >상품 설명</td>
					<td style="height: 200px; width: 300px" >${dao.prd_id }</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<div>
<h2>관련 상품</h2>
	<c:forEach items="${newProductList }" var="product">
		<div class="item">
			<img src="product_images/${product.prd_thumbnail}" width="350px"/>
			<h3>${product.prd_name }</h3>
		</div>
	</c:forEach>
</div>
</body>
</html>