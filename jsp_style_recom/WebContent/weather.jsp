<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		
		<div id="today">
			<p style="font-size:25px;">오늘</p><span style="font-size:25px;">${day0 }</span><br><br>
			<img alt="" src="${imgWfKor0 }" align="left">
			<span style="font-size:23px">${wfKor0 }</span><br>${Temp1}&deg;C<br>강수확률<br>${rs0 }%<br>
			<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id0 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url0 }" style="margin:0;width:270px;height: 320px;padding-top:55px;padding-bottom:55px">
			</a>
		</div>
		<div id="day">
			<div id="day_top">
				<span style="font-size:16px;">${day1 }</span><br>
				<img alt="" src="${imgWfKor1 }" align="left">
				<span style="font-size:16px">${wfKor1 }</span><br>
				<span style="color:red;">${Tmx0}&deg;C</span><br><span style="color:blue;">${Tmn0 }&deg;C</span>
				<br> 강수확률<br>${rs1 }%<br> 
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id1 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url1 }" style="width:160px;height: 192px;padding:5px;">
			</a>

			</div>

			<div id="day_top">
				<span style="font-size:16px;">${day2 }</span><br>
				<img alt="" src="${imgWfKor2 }" align="left">
				<span style="font-size:16px">${wfKor2 }</span><br>
				<span style="color:red;">${Tmx1}&deg;C</span><br><span style="color:blue;">${Tmn1 }&deg;C</span>
				<br> 강수확률<br>${rs2 }%<br> 
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id2 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url2 }" style="width:160px;height: 192px;padding:5px;">
			</a>
			</div>

			<div id="day_top">
				<span style="font-size:16px;">${day3 }</span><br>
				<img alt="" src="${imgWfKor3 }" align="left">
				<span style="font-size:16px">${wfKor3 }</span><br>
				<span style="color:red;">${Tmx2}&deg;C</span><br><span style="color:blue;">${Tmn2 }&deg;C</span>
				<br> 강수확률<br>${rs3 }%<br> 
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id3 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url3 }" style="width:160px;height: 192px;padding:5px;">
			</a>
			</div>

			<div id="day_bottom">
				<span style="font-size:16px;">${day4 }</span><br>
				<img alt="" src="${imgWfKor4 }" align="left">
				<span style="font-size:16px">${wfKor4 }</span><br>
				<span style="color:red;">${Tmx3}&deg;C</span><br><span style="color:blue;">${Tmn3 }&deg;C</span>
				<br> 강수확률<br>${rs4 }%<br> 
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id4 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url4 }" style="width:160px;height: 192px;padding:5px;">
			</a>
			</div>

			<div id="day_bottom">
				<span style="font-size:16px;">${day5 }</span><br>
				<img alt="" src="${imgWfKor5 }" align="left">
				<span style="font-size:16px">${wfKor5 }</span><br>
				<span style="color:red;">${Tmx4}&deg;C</span><br><span style="color:blue;">${Tmn4 }&deg;C</span>
				<br> 강수확률<br>${rs5 }%<br> 
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id5 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url5 }" style="width:160px;height: 192px;padding:5px;">
			</a>
			</div>

			<div id="day_bottom">
				<span style="font-size:16px;">${day6 }</span><br>
				<img alt="" src="${imgWfKor6 }" align="left">
				<span style="font-size:16px">${wfKor6 }</span><br>
				<span style="color:red;">${Tmx5}&deg;C</span><br><span style="color:blue;">${Tmn5 }&deg;C</span>
				<br> 강수확률<br>${rs6 }%<br> 
				<a href="/jsp_style_recom/styleDetail.do?stl_id=${rec_stl_id6 }&onoff=0">
				<img alt="" src="./images/category_images/${rec_stl_pic_url6 }" style="width:160px;height: 192px;padding:5px;">
			</a>
			</div>
		</div>


