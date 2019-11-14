<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 페이지</title>

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
 		      	<iframe id="iposition" src="prd_detail2.jsp?url=${Product.prd_url }" width="1200" height="100%" scrolling="yes" frameborder="0" ></iframe>
			
<table border="0" id="prdinfo">
	<tr>
		<td>
			<img src="./images/product_images/${Product.prd_thumbnail }" width="500" height="500" id="prdimg"
			>
		</td>
		<td>
			<table border="1" >
				<tr align="center">
					<td style="font-size: 20px; height: 100px; width: 100px">상품명</td>
					<td style="height: 100px; width: 300px">${Product.prd_name }</td>
				</tr>
			</table>
		</td>
	</tr>

</table>
 <div>
<div>관련 상품</div>
	<c:forEach items="${product}" var="rprd">
		<div class="item">
			<img src="./images/product_images/${rprd.prd_thumbnail}" width="350px" height="350px">
		</div>
	</c:forEach>
</div>
	

</body>
</html>