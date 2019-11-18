<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

table#bookmark tr {
	padding:10px;
}
table#bookmark td {
	padding:30px;
}
img#bmg {
	height: 180px;
}
</style>
<div class="bookmark">

	<label id="bookmarkhead"> 즐겨찾기 </label>
		<table id="bookmark">
			<tr>
				<c:forEach var="a" items="${BookMap}">
					<td><c:if test="${a.key != null}">
							<a
								href="/jsp_style_recom/styleDetail.do?stl_id=${a.key }&onoff=1">
								<img id="bmg" src="./images/category_images/${a.value }">
							</a>
						</c:if></td>
				</c:forEach>
				<c:if test="${count > 4 }">
					<td><a href="/jsp_style_recom/bookMarkMore.do?onoff=1"> <img  
							src="./images/more.png" style="width: 50px; height: 50px">
					</a></td>
				</c:if>
			</tr>
		</table>
	</div>
