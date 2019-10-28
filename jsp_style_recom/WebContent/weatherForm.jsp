<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	select{
		width: 100px;
		height: 23px;
	}
</style>
</head>
<body>
<form action="weather.do">
<select name="sido" id="search_area" class="search_area" title="시도 선택">
		<option value="4281025000">강원도</option>
		<option value="4125053500">경기북부</option>
		<option value="4111759600">경기남부</option>
		<option value="4817074000">경상남도</option>
		<option value="4717069000">경상북도</option>
		<option value="2920054000">광주광역시</option>
		<option value="2720065000">대구광역시</option>
		<option value="3023052000">대전광역시</option>
		<option value="2644058000">부산광역시</option>
		<option value="1168066000" selected="selected">서울특별시</option>
		<option value="3611055000">세종특별자치시</option>
		<option value="3114056000">울산광역시</option>
		<option value="2871025000">인천광역시</option>
		<option value="4681025000">전라남도</option>
		<option value="4579031000">전라북도</option>
		<option value="5013025300">제주특별자치도</option>
		<option value="4480038000">충청남도</option>
		<option value="4376031000">충청북도</option>
	</select>
	<input type="submit" value="검색">
</form>
</body>
</html>