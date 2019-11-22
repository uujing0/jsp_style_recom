<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 쓴 게시글</title>
<style type="text/css">
#board {
	margin-left:50px;
	position: relative;
	top: 50px;
	font-family: "나눔고딕", sans-serif;
	width: 500px;
	height: 1200px;
}

#bList {
	margin-bottom: 20%;
	float: left;
}

#bdcontent {
	border: 1px solid #4c4c4c;
	border-top: 3px solid #4c4c4c;
	padding: 5px 10px 5px 10px;;
	width:400px;
	height: 400px;
}
.styleList_thumb { 
	position: relative;
	overflow: hidden; 
	height: 300px; 
	width: 400px; 
	margin: 0px;
	margin-top:5px;
} 

.styleList_thumb img { 
	position: absolute;
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
	width: 100%; 
	height: auto;
} 
</style>
<script src="./js/jquery.js"></script>
<script type="text/javascript">
$(window).load(function() {
	   /* 이미지 비율에 맞게 크롭*/
	   var divs = document.querySelectorAll('.styleList_thumb');

	   for (var i = 0; i < divs.length; ++i) {
	       var div = divs[i];
	       var divAspect = div.offsetHeight / div.offsetWidth;
	       div.style.overflow = 'hidden';
	       
	       var img = div.querySelector('img');
	       var imgAspect = img.height / img.width;
	   
	       if (imgAspect <= divAspect) {
	         // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
	         var imgWidthActual = div.offsetHeight / imgAspect;
	         var imgWidthToBe = div.offsetHeight / divAspect;
	         var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
	         img.style.cssText = 'width: auto; height: 100%; margin-left: '
	                         + marginLeft + 'px;'
	       } else {
	         // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
	         img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
	       }
	   } 
	})
</script>
</head>

<body>
	<div id="board" style="height: 700px;">

		<table style="font: bold; float: left;" id="bList">
			<c:forEach var="board" items="${myList}" begin="0" end="2">
				<td>
					<div id="bdcontent">
						<div class="styleList_thumb"><a href="view.do?bd_id=${board.bd_id}">${board.popup }</a></div> 
						<a href="view.do?bd_id=${board.bd_id}">${board.bd_title}</a> 
						<a href="view.do?bd_id=${board.bd_id}">${board.mem_id}</a>
						<span style="color: olive;"><c:if test="${board.staravg>0}">
							<c:if test="${board.staravg==1}">★</c:if>
							<c:if test="${board.staravg==2}">★★</c:if>
							<c:if test="${board.staravg==3}">★★★</c:if>
							<c:if test="${board.staravg==4}">★★★★</c:if>
							<c:if test="${board.staravg==5}">★★★★★</c:if>
							<c:if test="${board.staravg==6}">★★★★★★</c:if>
							<c:if test="${board.staravg==7}">★★★★★★★</c:if>
							<c:if test="${board.staravg==8}">★★★★★★★★</c:if>
							<c:if test="${board.staravg==9}">★★★★★★★★★</c:if>
							<c:if test="${board.staravg==10}">★★★★★★★★★</c:if>
						</c:if></span>
					</div>

				</td>
			</c:forEach>

		</table>
	</div>
</body>
</html>