<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 페이지</title>
<script type="text/javascript">
	function clickbtn(gubun){

	var frameName =document.frames["iposition"];

	if(gubun=='Y'){
	    frameName.document.getElementById('main').style.visibility="hidden";  //div 감추기
	}else{
	   frameName.document.getElementById('main').style.visibility="visible";   //div 보여주기

	}
} 

</script>
<style type="text/css">
#detailproduct {
	margin-left: 100px;
	/*     margin-top: 550px;
 */
}

h2 {
	text-align: left;
	
}

#iposition {
	position: absolute;
	left: 400px;
}

.item {
	width: 200px;
	float: right;
	margin: 0 13px;
	text-align: center;
}

#product {
	position: relative;
	overflow: hidden;
	left: 500px;
}

.prdimg {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	max-width: 100%;
	height: auto;
}

#prdnametag { 
	padding: 10px; 
	text-decoration: none; 
	color: white; 
	font-weight: bold;
	display: block; 
	border-right: 30px solid transparent; 
	border-bottom: 60px solid #4c4c4c; 
	height: 0; 
	line-height: 75px; 
	font-size: 20pt;
	}

</style>
</head>
<%@include file="header.jsp"%>
<body>


	<h2>상품 상세</h2>
	<hr>
	<div id="product">
		<table style="margin: 0;">
			<tr>
				<td>
					<table border="0" id="prdinfo">
						<tr>
							<td>
								<table id="prdnametag">
									<tr align="center">
										
										<td> ${ Product.prd_name }</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td><img
								src="./images/product_images/${Product.prd_thumbnail }"
								width="500" height="auto" id="prdimg"></td>
						</tr>
					</table>
				</td>
				<td>
					<table id="detailproduct">
						
						<td style="padding: 10px; text-decoration: none; color: white; font-weight: bold;display: block; border-right: 30px solid transparent; border-bottom: 30px solid #4c4c4c; height: 0; line-height: 50px;">관련상품목록</td>
						<c:forEach var="i" begin="0" end="${fn:length(dp2)-1 }">
							<tr>
								<td>
								<c:if test="${dp[i] != Product.prd_id }">

									<a href="prddetail.do?prd_id=${dp[i] }"> <img
										src="./images/product_images/${dp2[i] }" width="250px"
										height="250px"></a>
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
 
	<iframe id="iposition" src="prd_detail2.jsp?url=${Product.prd_url }"
		width="1200" height="100%" scrolling="yes" frameborder="0" ></iframe>

</body>
</html>