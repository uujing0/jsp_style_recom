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
margin-left: 420px;
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
#item1{
margin-left: 40px;
padding: 20px;
display: inline-block;
justify-content: center;
}
#item2{
margin-left: 40px;
padding: 20px;
display: inline-block;
justify-content: center;
}
#item3{
margin-left: 10px;
padding: 20px;
display: inline-block;
justify-content: center;
}
</style>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
//bookmark
/* $(function(){
	$('#submit').click(function(){
		alert("즐겨찾기 삽입 되니?");

		var member_id = sessionStorage.getItem();
		document.getElementById(bm_mem).val(member_id);
		$.post('bookmark_action.jsp', member_id, function(msg){
			$('#msg').html(msg);
		});
		return false;
	});
});
 */
 

/* function bm_in(){
	var mem_id = sessionStorage.getItem();
	var sty_id = $('#sty_id', frm_read).val();
	
	
} 
 */

 //url copy
var obj;
function urlClipCopy() {
    obj.select() ;
    document.execCommand("copy");
    alert("클립보드로 URL이 복사되었습니다.");
}
window.onload = function() {
    obj = document.getElementById('url');
    obj.value = location.href;
}
</script>
</head>
<%@ include file="header.jsp" %>


<body>
<h1>오늘의 추천 스타일</h1>
<hr>
<h2>
<img src="./images/hanger.png" height="40px" width="60px"> description</h2>

<div id="buttons">
<input type="text" id="url" class="input" size="35" /><button class="button" onclick="urlClipCopy()">URL복사</button>
<form action="">
<!-- <input type="hidden" value="" name="bm_mem" id="bm_mem"> 
<input type="hidden" value="" name="bm_style" id="bm_style"> 
<input type="submit" value="즐겨찾기" id="bm" onclick="bookmark()"> --><!-- 
<input type="button" value="즐겨찾기추가" id="bookmark_in" onclick="bm_in()">
<input type="button" value="즐겨찾기삭제" id="bookmark_out" onclick="bm_out()"> -->
</form>

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
<h3>관련 상품</h3>

<p>겉옷</p>
<c:forEach items ="${p_cc1 }" var="i" >
<span class="item1">
<img alt = "${i }" src="./images/product_images/${i}" width = "350px" height="380px">

</span>
</c:forEach> 


<p>상의</p>
<c:forEach items ="${p_cc2 }" var="i" >
<span class="item2">
<img alt = "${i }" src="./images/product_images/${i}" width = "350px" height="380px">

</span>
</c:forEach>

 
<p>하의</p>
<c:forEach items ="${p_cc3 }" var="i" >
<span class="item3">
<img alt = "${i }" src="./images/product_images/${i}" width = "350px" height="380px">

</span>
</c:forEach> 
</body>
<%@ include file="footer.jsp" %>

</html>