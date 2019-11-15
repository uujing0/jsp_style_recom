<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	select{
		width: 150px;
		height: 35px;
		border-radius: 5px;
		border:solid 2px;
		border-color: #CE6D39;
		font-size: 17px;
	}
	input{
		margin-left: 10px;
	}
	div#selector{
		float:left;
		padding-top:1%;
		padding-left:15%;
 
	}
	#loc{
	border-radius: 5px;
	border:solid 2px;
	border-color: #CE6D39;
	background-color: white;
	font-size:17px; 
	height:31px;
	width:75px;
	float:left;
	margin-right: 12px;
	}
</style>

<div id="selector">
<form action="weather.do">
<div id="loc">지역선택</div> 
	<select name="sido">
		<option value="1168066000" <c:if test="${city eq '서울특별시'}"> selected </c:if>>서울특별시</option>
		<option value="4281025000" <c:if test="${city eq '강원도'}"> selected </c:if>>강원도</option>
		<option value="4125053500" <c:if test="${city eq '경기북부'}"> selected </c:if>>경기북부</option>
		<option value="4111759600" <c:if test="${city eq '경기남부'}"> selected </c:if>>경기남부</option>
		<option value="4817074000" <c:if test="${city eq '경상남도'}"> selected </c:if>>경상남도</option>
		<option value="4717069000" <c:if test="${city eq '경상북도'}"> selected </c:if>>경상북도</option>
		<option value="2920054000" <c:if test="${city eq '광주광역시'}"> selected </c:if>>광주광역시</option>
		<option value="2720065000" <c:if test="${city eq '대구광역시'}"> selected </c:if>>대구광역시</option>
		<option value="3023052000" <c:if test="${city eq '대전광역시'}"> selected </c:if>>대전광역시</option>
		<option value="2644058000" <c:if test="${city eq '부산광역시'}"> selected </c:if>>부산광역시</option>
		<option value="3611055000" <c:if test="${city eq '세종특별자치시'}"> selected </c:if>>세종특별자치시</option>
		<option value="3114056000" <c:if test="${city eq '울산광역시'}"> selected </c:if>>울산광역시</option>
		<option value="2871025000" <c:if test="${city eq '인천광역시'}"> selected </c:if>>인천광역시</option>
		<option value="4681025000" <c:if test="${city eq '전라남도'}"> selected </c:if>>전라남도</option>
		<option value="4579031000" <c:if test="${city eq '전라북도'}"> selected </c:if>>전라북도</option>
		<option value="5013025300" <c:if test="${city eq '제주특별자치도'}"> selected </c:if>>제주특별자치도</option>
		<option value="4480038000" <c:if test="${city eq '충청남도'}"> selected </c:if>>충청남도</option>
		<option value="4311133000" <c:if test="${city eq '충청북도'}"> selected </c:if>>충청북도</option>
	</select>
	<input type="submit" value="확인" style="border-radius: 5px;border:solid 2px;border-color: #CE6D39;background-color: white;height: 35px;">
</form>
</div>

</html>