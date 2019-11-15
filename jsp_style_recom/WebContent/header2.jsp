<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="./js/jquery.js"></script>

<!-- session이 없으면(비로그인시) 디폴트 값을 넣어준다. -->
<c:if test="${sessionScope.loc == null}">
	<c:set var="loc" value="서울특별시" scope="session"></c:set>
</c:if>
<!-- gender 1:남자, 2:여자 -->
<c:if test="${sessionScope.gender == null }">
	<c:set var="gender" value="2" scope="session"></c:set>
</c:if>

<c:catch var="exception">
	<!-- 세션에 따라 다른 locCode로 다른 지역의 날씨 정보를 로드한다. -->
	<c:choose>
		<c:when test="${sessionScope.loc }=='서울특별시'"><c:set var="locCode" value="1168066000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='강원도'"><c:set var="locCode" value="4281025000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='경기북부'"><c:set var="locCode" value="4125053500"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='경기남부'"><c:set var="locCode" value="4111759600"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='경상남도'"><c:set var="locCode" value="4817074000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='경상북도'"><c:set var="locCode" value="4717069000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='광주광역시'"><c:set var="locCode" value="2920054000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='대구광역시'"><c:set var="locCode" value="2720065000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='대전광역시'"><c:set var="locCode" value="3023052000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='부산광역시'"><c:set var="locCode" value="2644058000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='세종특별자치시'"><c:set var="locCode" value="3611055000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='울산광역시'"><c:set var="locCode" value="3114056000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='인천광역시'"><c:set var="locCode" value="2871025000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='전라남도'"><c:set var="locCode" value="4681025000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='전라북도'"><c:set var="locCode" value="4579031000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='제주특별자치도'"><c:set var="locCode" value="5013025300"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='충청남도'"><c:set var="locCode" value="4480038000"></c:set></c:when>
		<c:when test="${sessionScope.loc }=='충청북도'"><c:set var="locCode" value="4376031000"></c:set></c:when>
		<c:otherwise><c:set var="locCode" value="1168066000"></c:set></c:otherwise>
	</c:choose>
	<!-- 받은 지역코드에 맞는 날씨 데이터를 기상청에서 가져온다. -->
	<c:import var="xmldata" url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=${locCode }" charEncoding="utf-8"></c:import>
	<x:parse var="doc" xml="${xmldata }"></x:parse>
	<x:set var="wf" select="$doc//*/data/wfKor"/>
	<x:set var="temp" select="$doc//*/data/temp"/>
	<x:set var="rp" select="$doc//*/data/pop"/>
</c:catch>

<%-- <c:out value="${sessionScope.loc }"></c:out>
<c:out value="${sessionScope.gender }"></c:out>
<x:out select="$wf"></x:out>
<x:out select="$temp"></x:out>
<x:out select="$rp"></x:out> --%>

<script type="text/javascript">
	//문서 시작시 적용
	//$(function(){
		//var thisPage = window.location.href.split('jsp_style_recom/')[1]
	//})
	
	function logoutConfirm(){
		if(confirm("정말 로그아웃 하시겠습니까?") == true){
	        location.href='logout.do'
	    }
	    else{
	        return ;
	    }
	}
	
	function login() {
        window.open('loginForm.jsp','로그인','width=500,height=400,left=700,top=200,status=no,scrollbars=no')
	}

</script>

<style type="text/css">
@font-face { font-family: 'NanumGothic'; src: url(fonts/NanumGothic.ttf) format('truetype'); }

div {
	font-family: NanumGothic;
}

/* header style start */
header{
	background-color: #E45151;
	border: none;
	height: 100px;
}


#header-left {
	width: 400px;
	height: 94px;
	background-color: #D34747;
	float: left;
	padding: 6px 0px 0px 0px;
}

#align-left {
	width: 80px;
	height: inherit;
	background-color: white;

}

nav ul {
	list-style-type: none;
}

nav ul li {
	display: inline;
	margin: 50px;
}
	
nav ul li a {
	color: white;
	text-decoration: none;	/*밑줄 없앰*/
	font-size: 15px;
}

</style>

<header>
	<div id="header-left">
		<div id="align-left"></div>
		
		<!-- TODO -->
		<div id="header-logo">
			<a href="main.do">
				<img id="dog_icon" alt="dog_icon" src="images/dog_icon.png" > 
				<span id="logo_title">웰시코디</span>
			</a>
		</div>
	</div>
	
	<div id="header-center">
		<nav id="top-menu">
			<ul>
				<li><a href="#">스타일추천</a></li>
				<li><a href="#">게시판</a></li>
				<li><a href="#">마이코기</a></li>
			</ul>
		</nav>
	</div>
</header>

</html>




