<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
h2#schedule_title{
	color:#343a40;
	text-align: center;
	margin: 30px 0px 30px 0px;
}
div{
	text-align: center;
	margin: 30px 0px 40px 0px;
}
#schedule_submit{
	border: solid 2px;
	border-bottom: solid 4px;
	border-color: #f9f7f6;
	background-color: #373B43;
	color:white;
	font-size: 15px;
	padding: 12px 26px;
}
#schedule_ul{
	list-style-type: none;
	padding:0;
	width:80%;
	margin-left: 10%;
}
#schedule_ul li label{
	display: block;
	color: #343a40;
	padding: 10px 0px;
	font-size: 15px;
}
#schedule_ul li input,#schedule_ul li select, #schedule_ul li textarea{
	padding: 12px 10px;
	border: 1px solid #e0dcdc;
	width: -webkit-fill-available;
}
</style>
<body bgcolor="#f9f7f6">
	<form id="schedule" action="schedulePro.do">

		<h2 id="schedule_title">${day }</h2> <input type="hidden" name="dd" value="${dd}"><input
			type="hidden" name="yy" value="${yy }"><input type="hidden"
			name="mm" value="${mm }"> <input type="hidden" name="mem_id"
			value="${mem_id }"> <input type="hidden" name="num"
			value="${num }">
		<ul id="schedule_ul">
			<li>
				<label>제목</label>
				<input type="text" name="cal_title" value="${ cal_title}" focus>
			</li>

			<li>
				<label>이벤트</label>
				<select name="tc_id">
					<option value="0" selected>선택안함</option>
					<option value="1" <c:if test="${tc_id eq '1'}"> selected </c:if>>오피스</option>
					<option value="2" <c:if test="${tc_id eq '2'}"> selected </c:if>>웨딩하객/셀럽</option>
					<option value="3" <c:if test="${tc_id eq '3'}"> selected </c:if>>캠퍼스개강</option>
					<option value="4" <c:if test="${tc_id eq '4'}"> selected </c:if>>집근처마실</option>
					<option value="5" <c:if test="${tc_id eq '5'}"> selected </c:if>>피크닉</option>
				</select>
			</li>

			<li>
				<label>내용</label>
				 <textarea rows="15" cols="auto" name="cal_contents">${cal_contents}</textarea>
			</li>

		</ul>
		<div>
			<input id="schedule_submit" type="submit" value="확인">
		</div>
	</form>
</body>