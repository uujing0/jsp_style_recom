<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>추천 리스트</title>

<script type="text/javascript" src="./js/jquery.js"></script>

<style type="text/css">
.content {
	margin: 40px 200px 40px 200px;
	width: 700px;
}

table.categoryTable {
	border-right:none;
}

table.categoryTable th {
	width: 100px;
	padding: 10px;
}

#tagButton {
	background-color: white;
	color: black;
	border: none;
}

#actTagButton {
	background-color: yellow;
	color: black;
	border: none;
}

.styleTable tr td {
	padding: 0px 30px 60px 0px;
}

.thumb { 
	display: block; 
	overflow: hidden; 
	height: 500px; 
	width: 400px; 
} 

.thumb img { 
	display: block; /* Otherwise it keeps some space around baseline */ 
	min-width: 100%; /* Scale up to fill container width */ 
	min-height: 100%; /* Scale up to fill container height */ 
	-ms-interpolation-mode: bicubic; /* Scaled images look a bit better in IE now */  */
}

#test1{
background-color: red;}
</style>

<script type="text/javascript">
function setCookie(cookieName, value) {
	var i = 0;
	pushCookie = cookieName +":"+ value
	cookieData = document.cookie.split('stl_id=')

	for(var list in cookieData){//중복 데이터 금지
		if(cookieData[list]==pushCookie){
			return;
		}
		i++;
	}
	if(i==6){
		document.cookie=document.cookie.replace(cookieData[1]+"stl_id=","")
		i--
	}
	
	document.cookie += "stl_id=" + cookieName +":"+ value

}
	
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
function checkCookie() {

}

</script>	
</head>
<%@ include file="header.jsp"%>
<body>
	<h1>테마 별 스타일 추천</h1>
	<hr>

	<div class="content">
		<table class="categoryTable" border="1">
			<tr>
				<th>날씨</th>
				<td colspan="4">
					<form>
						지역설정 : 
						<select class="weatherLocation">
							<option value="0">선택해주세요</option>
							<c:forEach var="i" items="${locMap}">
								<c:if test="${lc == i.value }">
									<option value="${i.value}" selected="selected">${i.key}</option>
								</c:if>
								<c:if test="${lc != i.value }">
									<option value="${i.value}">${i.key}</option>
								</c:if>
							</c:forEach>
						</select>
					</form>
				</td>
			</tr>
			<tr>
				<th>상황</th>
				<td id="situationGroup">
					<c:forEach var="tag" items="${sitTags}">
						<c:choose>
						    <c:when test="${tagId == tag.tc_id}">
						        <c:set var="tagIdName" value="actTagButton"/>
						    </c:when>
						    <c:otherwise>
						       <c:set var="tagIdName" value="tagButton"/>
						    </c:otherwise>
						</c:choose>
					
						<button id="${tagIdName}" value="${tag.tc_id}" onclick="location.href='styleList.do?tagId=${tag.tc_id}&tagType=1'">${tag.tc_name}</button>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>체형</th>
				<td id="bodyGroup">
					<c:forEach var="tag" items="${bodyTags}">
						<c:choose>
						    <c:when test="${tagId == tag.tc_id}">
						        <c:set var="tagIdName" value="actTagButton"/>
						    </c:when>
						    <c:otherwise>
						       <c:set var="tagIdName" value="tagButton"/>
						    </c:otherwise>
						</c:choose>
					
						<button id="${tagIdName}" value="${tag.tc_id}" onclick="location.href='styleList.do?tagId=${tag.tc_id}&tagType=2'">${tag.tc_name}</button>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>분위기</th>
				<td id="moodGroup">
					<c:forEach var="tag" items="${moodTags}">
						<c:choose>
						    <c:when test="${tagId == tag.tc_id}">
						        <c:set var="tagIdName" value="actTagButton"/>
						    </c:when>
						    <c:otherwise>
						       <c:set var="tagIdName" value="tagButton"/>
						    </c:otherwise>
						</c:choose>
					
						<button id="${tagIdName}" value="${tag.tc_id}" onclick="location.href='styleList.do?tagId=${tag.tc_id}&tagType=3'">${tag.tc_name}</button>
					</c:forEach>
				</td>
			</tr>
		</table>

		<c:if test="${tagType != 4 }">
	        <c:if test="${totCnt > 0 }">
	            <p>${totCnt}개의 결과</p>
	            <table class="styleTable">
	                <c:forEach var="r" begin="0" end="${rowSize-1}">
	                    <tr>
	                        <c:forEach var="c" begin="0" end="${columnSize-1}">
	                            <c:set var="eIndex" value="${r*columnSize+c}" scope="page" />
	                            <c:if test="${eIndex < list.size()}">
	                                <td>
	                                    <div class="thumb">
	                                        <a href="styleDetail.do?stl_id=${list[eIndex].stl_id}&onoff=0">
	                                            <img src="./images/category_images/${list[eIndex].stl_pic_url}" width="400px" height="500px">
	                                        </a>
	                                    </div>
	                                </td>
	                            </c:if>
	                        </c:forEach>
	                    </tr>
	                </c:forEach>
	            </table>    
	        </c:if>
		</c:if>
	</div>

	<c:if test="${tagType == 4 }">
		<div class="test1">
		    오늘의 날씨는 '${tmpWfKor }'이고<br>
		    현재 기온은  ${tmp }도, 강수확률은 ${rs }퍼센트(%)입니다.<br>
		  
			<img alt="${tmpImgWfKor }" src="./${tmpImgWfKor }">
		
		
			<%@ include file="styleDetailContent.jsp" %>
		</div>
	</c:if>
	
<script type="text/javascript">

// 문서 시작시 적용
$(function() {
	$(".weatherLocation").change(function() {
		var locCode = $(this).val()
		
		if (locCode == 0) {
			return false
		}
		
		location.href='styleList.do?tagType=4&locCode='+locCode;
		
	})
	
	//createTag()
	tagClickEvent()
})

</script>


</body>
<%@ include file="footer.jsp"%>

</html>