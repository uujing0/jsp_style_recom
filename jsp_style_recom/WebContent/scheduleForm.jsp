<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#title{
	
}
div{
	float:left;
}
</style>
<form action="schedulePro.do">
<table border="1">
	<tr id="title">
		<td>제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr id="contents">
	<td>행사</td>
	<td>	<select name="event">
			<option value="1">행사1</option>
			<option value="2">행사2</option>
			<option value="3">행사3</option>
			<option value="4">행사4</option>
		</select>
		</td>
		</tr>
	
	<tr>
		<td>내용</td>
		<td><textarea rows="15" cols="auto"></textarea></td>
	</tr>
</table>
<input type="submit" value="확인">
</form>
