<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 페이지</title>

<style type="text/css">
    #detailproduct{
    margin-left: 100px;
    margin-top: 550px;
    }
    h2{
    text-align: left;
    }
	#iposition {
		position:absolute; top:1550px; left:400px;
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
  	

<h2>상품 상세</h2> 	
<hr>
<div id = "product">			
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
</div>


<div id= "detailproduct">
<hr>
<h4>관련상품목록</h4>

<c:forEach var="i" begin="0" end="${fn:length(dp2)-1 }">
<span>
<c:if test="${dp[i] != Product.prd_id }">

<a href="prddetail.do?prd_id=${dp[i] }">
<img src="./images/product_images/${dp2[i] }" width="250px" height="250px"></a>
</c:if>
</span>
</c:forEach>
</div>

<iframe id="iposition" src="prd_detail2.jsp?url=${Product.prd_url }" 
    width="1200" height="100%" scrolling="yes" frameborder="0" ></iframe>

</body>
</html>
