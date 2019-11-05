<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 정보</title>
</style>
</head>
<body>
<h2>상품 상세 정보</h2>
<table border="1">
	<tr>
		<td>
			<img src="{path}/images/${vo.productUrl }" width="340" height="300">
		</td>
		<td>
			<table border="1" style="height: 300px; width: 400px">
				<tr align="center">
					<td>상품명</td>
					<td>${vo.productName }</td>
				</tr>
				<tr align="center">
					<td>상품 설명</td>
					<td>${vo.productInfo }</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<form name="form1" method="post" action="${path}/shop/mypage/insert.do">
						<input type="hidden" name="productId" value="${vo.productId}">
						<input type="submit" value="즐겨찾기">	
						</form>
					</td>
				</tr>	
			</table>
		</td>
	</tr>
</table>
</body>
</html>