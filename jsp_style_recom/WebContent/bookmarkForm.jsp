<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

table#bookmark tr {
	padding:10px;

}
table#bookmark td {
	padding-left:30px;
	/* padding-right:0; */
}
.styleList_thumb_bk { 
	position: relative;
	overflow: hidden; 
	height: 180px; 
	width: 180px; 
	margin:0;
} 

.styleList_thumb_bk img { 
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
	   var divs = document.querySelectorAll('.styleList_thumb_bk');

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
<div class="bookmark">

	<label id="bookmarkhead"> 즐겨찾기 </label>
		<table id="bookmark">
			<tr>
				<c:forEach var="a" items="${BookMap}">
					<td><c:if test="${a.key != null}">
					<div class="styleList_thumb_bk">
							<a
								href="/jsp_style_recom/styleDetail.do?stl_id=${a.key }&onoff=1">
								<img id="bmg" src="./images/category_images/${a.value }">
							</a>
					</div>
						</c:if></td>
				</c:forEach>
				<c:if test="${count > 5 }">
					<td style="padding-left:40px;padding-right:20px;"><a href="/jsp_style_recom/bookMarkMore.do?onoff=1"> <img  
							src="./images/more.png" style="width: 50px; height: 50px">
					</a></td>
				</c:if>
			</tr>
		</table>
	</div>
