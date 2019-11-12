<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">

	
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
/* 	function checkCookie() {
		var stl_id = getCookie("stl_id");
		var thisItem = '<?=$stl_id?>:<?=$itemImage ?>'; // 제품 아이디와 이미지 이름을 저장  2차원 배열처럼 쓸려고 짱구를 굴림...  json 형태로 저장도 가능할텐데.... 그건 취향대로 
		if (thisItem) {
			if (stl_id != "" && stl_id != null) {
				if (stl_id.indexOf(thisItem) == -1) { //값이 없으면 
					setCookie("stl_id", thisItem + "&" + stl_id, );
				}
			} else {
				if (stl_id == "" || stl_id == null) {
					setCookie("stl_id", thisItem + "&", 1);
				}
			}
		}
	} */

</script>