<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천 스타일 상세</title>

</head>
<%@ include file="header.jsp"%>

<body>

<%@ include file="styleDetailContent.jsp" %>
<%@ include file="recentStyle.jsp" %>
<script type="text/javascript">

window.onload = function(){
	chkRecent();
	setRecentStyleCookie();
}

function styleCookieList(){
	var cookie = document.cookie.split(';');
	for(var list in cookie){
		if(cookie[list].split('stl_id=')[1]){
			return cookie[list].split('stl_id=')[1]
		}
	}
}

function setRecentStyleCookie() {
	var i = 0;
	
	var stl_id = window.location.href.split('stl_id=')[1].split('&')[0];
	var picUrl = '${al[0] }';
		
	pushCookie = +stl_id +":"+ picUrl

	if(styleCookieList()){
		cookieData = styleCookieList().split('/');	
		
		for(var list in cookieData){//중복 데이터 금지
			if(cookieData[list]==pushCookie){
				return;
			}else{
			}
			i++;
		}
	}
	
	if(i==0){
		document.cookie = "stl_id=" +pushCookie
		return;
	}
	
	
	if(i>4){//일정 수 이상의 데이터가 들어오면 가장 예전 데이터를 삭제
		var newCookieList = styleCookieList().replace(styleCookieList().split('/')[0]+"/","")
		document.cookie = "stl_id="+newCookieList+"/"+pushCookie;
		i--
	}else{
		document.cookie = "stl_id="+styleCookieList()+"/"+pushCookie;	
	}
}

</script>
</body>
<%@ include file="footer.jsp"%>

</html>