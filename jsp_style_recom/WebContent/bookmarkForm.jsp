<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	table#bookmark{
		margin-top:0;
		margin-left: 5%;
		border: none;
		width:95%;
	}
	img{
		width:60%;

	}
</style>
<div>
<table id="bookmark">
	<tr>
		<td><c:if test="${stl_id1 != null}">
			<a href="/jsp_style_recom/styleDetail.do?stl_id=${stl_id1 }&onoff=1">
				<img src="./images/category_images/${stl_pic_url1 }">
			</a>
		</c:if></td>
		<td><c:if test="${stl_id2 != null}">
			<a href="/jsp_style_recom/styleDetail.do?stl_id=${stl_id2 }&onoff=1">
				<img src="./images/category_images/${stl_pic_url2 }">
			</a>
		</c:if></td>
		<td><c:if test="${stl_id3 != null}">
			<a href="/jsp_style_recom/styleDetail.do?stl_id=${stl_id3 }&onoff=1">
				<img src="./images/category_images/${stl_pic_url3 }">
			</a>
		</c:if></td>
		<td><c:if test="${stl_id4 != null}">
			<a href="/jsp_style_recom/styleDetail.do?stl_id=${stl_id4 }&onoff=1">
				<img src="./images/category_images/${stl_pic_url4 }">
			</a>
		</c:if></td>
		<td><c:if test="${stl_id5 != null}">
			<a href="/jsp_style_recom/styleDetail.do?stl_id=${stl_id5 }&onoff=1">
				<img src="./images/category_images/${stl_pic_url5 }">
			</a>
		</c:if></td>
		<td><c:if test="${stl_id6 != null}">
			<a href="/jsp_style_recom/styleDetail.do?stl_id=${stl_id6 }&onoff=1">
				<img src="./images/category_images/${stl_pic_url6 }">
			</a>
		</c:if></td>
		<td><c:if test="${stl_id7 != null}">
			<a href="/jsp_style_recom/styleDetail.do?stl_id=${stl_id7 }&onoff=1">
				<img src="./images/category_images/${stl_pic_url7 }">
			</a>
		</c:if></td>
		
	</tr>
</table>
</div>