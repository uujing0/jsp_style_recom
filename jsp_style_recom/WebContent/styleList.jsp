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


.styleList_content {
	margin: 100px 0px 100px 200px;
}

/* hr {
	border: none;
	border: 0.5px solid #adb5bd;
} */

table.styleList_categoryTable {
	border: 1px solid #adb5bd;
    width: 700px;
    border-collapse: collapse;
}

table.styleList_categoryTable th {
	font-size: 12px;
	color: #343A40; /*font color*/
	width: 70px;
	padding: 10px 0px 10px 30px;
	text-align: left;
	background-color: #F1F3F5;
	border-right: none;
}

table.styleList_categoryTable td {
	font-size: 12px;
	padding: 0px 0px 0px 30px;
	background-color: white;
}

.styleList_tagButton {
	font-size: 12px;
	background-color: white;
	color: #495057;
	border: none;
	background-color: white;
	padding: 3px;
	margin: 0px 10px 0px 0px;
}

.styleList_actTagButton {
	font-size: 12px;
	background-color: #e45151;
	color: white;
	border: none;
	padding: 3px;
	margin: 0px 10px 0px 0px;
}

.styleList_categoryTable {
	font-size: 12px;
}

.styleList_resultDesc {
	color: #666666;
	font-size: 18px;
	padding: 80px 0px 25px 5px;
}

.styleList_table tr td {
	padding: 0px 95px 95px 0px;
	margin: 15px 0px 0px 0px;
	height: 315px; 
	width: 270px; 
}

.styleList_thumb { 
	position: relative;
	overflow: hidden; 
	height: 315px; 
	width: 270px; 
} 

.styleList_thumb img { 
	position: absolute;
	top: 0; 
	left: 0; 
	right: 0; 
	bottom: 0; 
	width: 100%; 
	height: auto;
} 

</style>

<script type="text/javascript">

function loadImage(obj) {

}

</script>	
</head>
<%@ include file="header.jsp"%>
<body>
	<div class="styleList_content">
		<table class="styleList_categoryTable" border="1">
			<tr>
				<th>날씨</th>
				<td colspan="4">
					<form>
						<select class="styleList_weatherLocation">	
							<option value="0"> 지역을 선택해주세요</option>
							<c:forEach var="i" items="${locMap}">
								<c:if test="${lc == i.value }">
									<option value="${i.value}" selected="selected">${i.key}</option>
								</c:if>
								<c:if test="${lc != i.value }">
									<option value="${i.value}">${i.key}</option>
								</c:if>
							</c:forEach>
						</select>
						
						<span>&nbsp;&nbsp;&nbsp;지역 날씨에 따라 스타일을 추천해드립니다^-^ </span>
					</form>
				</td>
			</tr>
			<tr>
				<th>상황</th>
				<td id="situationGroup">
					<c:forEach var="tag" items="${sitTags}">
						<c:choose>
						    <c:when test="${tagId == tag.tc_id}">
						        <c:set var="tagIdName" value="styleList_actTagButton"/>
						    </c:when>
						    <c:otherwise>
						       <c:set var="tagIdName" value="styleList_tagButton"/>
						    </c:otherwise>
						</c:choose>
					
						<button class="${tagIdName}" value="${tag.tc_id}" onclick="location.href='styleList.do?tagId=${tag.tc_id}&tagType=1'">${tag.tc_name}</button>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>체형</th>
				<td id="bodyGroup">
					<c:forEach var="tag" items="${bodyTags}">
						<c:choose>
						    <c:when test="${tagId == tag.tc_id}">
						        <c:set var="tagIdName" value="styleList_actTagButton"/>
						    </c:when>
						    <c:otherwise>
						       <c:set var="tagIdName" value="styleList_tagButton"/>
						    </c:otherwise>
						</c:choose>
					
						<button class="${tagIdName}" value="${tag.tc_id}" onclick="location.href='styleList.do?tagId=${tag.tc_id}&tagType=2'">${tag.tc_name}</button>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>분위기</th>
				<td id="moodGroup">
					<c:forEach var="tag" items="${moodTags}">
						<c:choose>
						    <c:when test="${tagId == tag.tc_id}">
						        <c:set var="tagIdName" value="styleList_actTagButton"/>
						    </c:when>
						    <c:otherwise>
						       <c:set var="tagIdName" value="styleList_tagButton"/>
						    </c:otherwise>
						</c:choose>
					
						<button class="${tagIdName}" value="${tag.tc_id}" onclick="location.href='styleList.do?tagId=${tag.tc_id}&tagType=3'">${tag.tc_name}</button>
					</c:forEach>
				</td>
			</tr>
		</table>

		<!-- 검색 결과가 존재하거나 tagType=4(날씨)가 아닐 경우 -->
		<c:if test="${tagType ne 4 or not empty search_word}">
            <div class="styleList_resultDesc"> 
            	<c:if test="${tagType ne 4 and empty search_word}">
            		<strong style="color: #e45151;">${totCnt} </strong>개의 결과
            	</c:if>
            	<c:if test="${not empty search_word}">
            		${search_word} <strong style="color: #e45151;">${totCnt}</strong>개 검색 결과
            	</c:if>
            </div>
            
            <table class="styleList_table">
                <c:forEach var="r" begin="0" end="${rowSize-1}">
                    <tr>
                        <c:forEach var="c" begin="0" end="${columnSize-1}">
                            <c:set var="eIndex" value="${r*columnSize+c}" scope="page" />
                            <c:if test="${eIndex < list.size()}">
                                <td>       
                                    <div class="styleList_thumb">
										<a href="styleDetail.do?stl_id=${list[eIndex].stl_id}&onoff=0">
                                    		<img src="./images/category_images/${list[eIndex].stl_pic_url}" >
                                    	</a>
                                    </div>
                                </td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>    
        </c:if>
	</div>

	<c:if test="${tagType eq 4 }">
		<div class="test1">
			<%@ include file="styleDetailContent.jsp" %>
		</div>
	</c:if>
	
<script type="text/javascript">

// 문서 시작시 적용
$(function() {
	/* 이미지 비율에 맞게 크롭*/
	var divs = document.querySelectorAll('td > div');

	for (var i = 0; i < divs.length; ++i) {
	    var div = divs[i];
	    var divAspect = div.offsetHeight / div.offsetWidth;
	    div.style.overflow = 'hidden';
	    
	    var img = div.querySelector('img');
	    var imgAspect = img.height / img.width;
	
	    if (imgAspect <= divAspect) {
	      // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
	      var imgWidthActual = div.offsetHeight / imgAspect;
	      var imgWidthToBe = div.offsetHeight / divAspect;
	      var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
	      img.style.cssText = 'width: auto; height: 100%; margin-left: '
	                      + marginLeft + 'px;'
	    } else {
	      // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
	      img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
	    }
	} 
	
	
	/* select 박스 이벤트 추가*/
	$(".styleList_weatherLocation").change(function() {
        var locCode = $(this).val()
        
        if (locCode == 0) {
            return false
        }
        
        location.href='styleList.do?tagType=4&locCode='+locCode;
        
    })
})

</script>

<%@ include file="recentStyle.jsp" %>
</body>
<%@ include file="footer.jsp"%>

</html>