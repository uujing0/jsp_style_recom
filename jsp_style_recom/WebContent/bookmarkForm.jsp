<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table#bookmark {
	margin-top: 0;
	margin-left: 5%;
	border: none;
	width: 95%;
}

img {
	width: 60%;
}
</style>
<div>
	<table id="bookmark">
		<tr>
			<c:forEach var="a" items="${BookMap}">
				<td><c:if test="${a.key != null}">
						<a href="/jsp_style_recom/styleDetail.do?stl_id=${a.key }&onoff=1">
							<img src="./images/category_images/${a.value }">
						</a>
					</c:if></td>
			</c:forEach>
		</tr>
	</table>
</div>