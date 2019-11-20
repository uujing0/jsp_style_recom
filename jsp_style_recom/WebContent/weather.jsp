<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="./js/jquery.js"></script>
<style type="text/css">
.styleList_thumb { 
	position: relative;
	overflow: hidden; 
	height: 340px; 
	width: 280px; 
	margin: 40px 0px 20px 33px;
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
		<div id="today">
			<p style="font-size:25px;">오늘</p><span style="font-size:25px;">${day0 }</span><br><br>
			<img alt="" src="${imgWfKor0 }" align="left" style="width: 103.922px;height: 104.656px;">
			<span style="font-size:23px">${wfKor0 }</span><br>${Temp1}&deg;C<br>강수확률<br>${rs0 }%<br>

			 <div class="styleList_thumb">
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id0 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url0 }">
			</a>
             </div>
		</div>
		<div id="day">
			<div id="day_top">
				<span style="font-size:16px;">${day1 }</span><br>
				<img alt="" src="${imgWfKor1 }" align="left">
				<span style="font-size:16px">${wfKor1 }</span><br>
				<span style="color:red;">${Tmx0}&deg;C</span><br><span style="color:blue;">${Tmn0 }&deg;C</span>
				<br> 강수확률<br>${rs1 }%<br> 
				<div class="styleList_thumb" style="height: 180px;width: 170px; margin:20px 0px 0px 40px;">
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id1 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url1 }">
			</a>
			</div>

			</div>

			<div id="day_top">
				<span style="font-size:16px;">${day2 }</span><br>
				<img alt="" src="${imgWfKor2 }" align="left">
				<span style="font-size:16px">${wfKor2 }</span><br>
				<span style="color:red;">${Tmx1}&deg;C</span><br><span style="color:blue;">${Tmn1 }&deg;C</span>
				<br> 강수확률<br>${rs2 }%<br> 
				<div class="styleList_thumb" style="height: 180px;width: 170px; margin:20px 0px 0px 40px;">
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id2 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url2 }">
			</a>
			</div>
			</div>

			<div id="day_top">
				<span style="font-size:16px;">${day3 }</span><br>
				<img alt="" src="${imgWfKor3 }" align="left">
				<span style="font-size:16px">${wfKor3 }</span><br>
				<span style="color:red;">${Tmx2}&deg;C</span><br><span style="color:blue;">${Tmn2 }&deg;C</span>
				<br> 강수확률<br>${rs3 }%<br> 
				<div class="styleList_thumb" style="height:180px;width: 170px; margin:20px 0px 0px 40px;">
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id3 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url3 }">
			</a>
			</div>
			</div>

			<div id="day_bottom">
				<span style="font-size:16px;">${day4 }</span><br>
				<img alt="" src="${imgWfKor4 }" align="left">
				<span style="font-size:16px">${wfKor4 }</span><br>
				<span style="color:red;">${Tmx3}&deg;C</span><br><span style="color:blue;">${Tmn3 }&deg;C</span>
				<br> 강수확률<br>${rs4 }%<br> 
				<div class="styleList_thumb" style="height: 180px;width: 170px; margin:20px 0px 0px 40px;">
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id4 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url4 }">
			</a>
			</div>
			</div>

			<div id="day_bottom">
				<span style="font-size:16px;">${day5 }</span><br>
				<img alt="" src="${imgWfKor5 }" align="left">
				<span style="font-size:16px">${wfKor5 }</span><br>
				<span style="color:red;">${Tmx4}&deg;C</span><br><span style="color:blue;">${Tmn4 }&deg;C</span>
				<br> 강수확률<br>${rs5 }%<br> 
				<div class="styleList_thumb" style="height: 180px;width: 170px; margin:20px 0px 0px 40px;">
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id5 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url5 }">
			</a>
			</div>
			</div>

			<div id="day_bottom">
				<span style="font-size:16px;">${day6 }</span><br>
				<img alt="" src="${imgWfKor6 }" align="left">
				<span style="font-size:16px">${wfKor6 }</span><br>
				<span style="color:red;">${Tmx5}&deg;C</span><br><span style="color:blue;">${Tmn5 }&deg;C</span>
				<br> 강수확률<br>${rs6 }%<br> 
				<div class="styleList_thumb" style="height: 180px;width: 170px; margin:20px 0px 0px 40px;">
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id6 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url6 }">
			</a>
			</div>
			</div>
		</div>


