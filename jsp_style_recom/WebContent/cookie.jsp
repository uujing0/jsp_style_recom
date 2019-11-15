<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

</script>