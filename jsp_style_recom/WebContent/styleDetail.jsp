<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천 스타일 상세</title>
<style type="text/css">
#buttons{
margin-left: 720px;
margin-top: 60px;
}
h2{
text-align: center;
}
#style_info{
margin-left: 300px;
}
#cc_icon{
margin-left: 100px;
display: inline-block;

}

#product_image{
margin-left: 280px;
width: 1500px;
height: 800px;

}
 
#pro1{
margin-right: 10px;
float: left;
width: 400px;
height: 300px;
background-color:gray;
}

#pro2{
margin-right: 10px;
float: left;
width: 400px;
height: 300px;
background-color:gray;
}

#pro3{
margin-right: 10px;
float: left;
width: 400px;
height: 300px;
background-color:gray;
}

#pro4{
margin-top: 30px;
margin-right: 10px;
float: left;
width: 400px;
height: 300px;
background-color:gray;
}

#pro5{
margin-top: 30px;
margin-right: 10px;
float: left;
width: 400px;
height: 300px;
background-color:gray;
}
</style>
</head>
<%@ include file="/common/header.jsp" %>

<body>
<h1>오늘의 추천 스타일</h1>
<hr>
<h2>
<img src="./images/hanger.png" height="40px" width="60px"> description</h2>

<div id="buttons">

<input type="button" value="즐겨찾기" id="mostsee_save">
<input type="button" value="URL복사" id="url_save">

</div>


<div id = "style_info">
<span id="main_image">

<img src="./images/category_images/${al[0] }" id="${al[0] }" height="740px" width="580px"> 

</span>

<div id ="cc_icon">

<table>
<tr><th>스타일 코디 아이템</th></tr>
<tr><td>겉옷          </td><td><img src="./images/clothes_category_icon/${al[1] }" id="${al[1] }" height="150px" width="150px"></td></tr>
<tr><td>상의          </td><td><img src="./images/clothes_category_icon/${al[2] }" id="${al[2] }" height="150px" width="150px"></td></tr>
<tr><td>하의          </td><td><img src="./images/clothes_category_icon/${al[3] }" id="${al[3] }" height="150px" width="150px"></td></tr>
<tr><td>오늘의 "IT"템          </td><td><img src="./images/clothes_category_icon/${al[4] }" id="${al[4] }" height="150px" width="150px"></td></tr>
</table>
</div>

</div>

<br><br><hr>

<div id="product_image">

<span id = "pro1">상품1</span>
<span id = "pro2">상품2</span>
<span id = "pro3">상품3</span>

<span id = "pro4">상품4</span>
<span id = "pro5">상품5</span>

</div>

</body>
<%@ include file="/common/footer.jsp" %>

</html>