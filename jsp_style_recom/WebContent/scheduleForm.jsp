<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#title{
	
}
div{
	float:left;
}
</style>
<form action="schedulePro.do">
${day }일정<br>
<input type="hidden" name="dd" value="${dd}" ><input type="hidden" name="yy" value="${yy }" ><input type="hidden" name="mm" value="${mm }">
<input type="hidden" name="mem_id" value="${mem_id }">
<input type="hidden" name="num" value="${num }">
<table border="1">
	<tr id="title">
		<td>제목</td>
		<td><input type="text" name="cal_title" value="${ cal_title}"></td>
	</tr>
	<tr id="contents">
	<td>행사</td>
	<td>	<select name="tc_id">
			<option value="1" <c:if test="${tc_id eq '1'}"> selected </c:if>>행사1</option>
			<option value="2" <c:if test="${tc_id eq '2'}"> selected </c:if>>행사2</option>
			<option value="3" <c:if test="${tc_id eq '3'}"> selected </c:if>>행사3</option>
			<option value="4" <c:if test="${tc_id eq '4'}"> selected </c:if>>행사4</option>
		</select>
		</td>
		</tr>
	
	<tr>
		<td>내용</td>
		<td><textarea rows="15" cols="auto" name="cal_contents">${cal_contents } </textarea></td>
	</tr>
</table>
<input type="submit" value="확인">
</form>
