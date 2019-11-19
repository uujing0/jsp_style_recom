<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<Style>
#rightSide {
	position: absolute;
	top: 590px;
	left: 50%;
	margin: 0 0 0 510px;

}
#rightSide #aaa {

	margin-left: 180px;


}
#rightSide #right_zzim {
	float:right;
	top: 200px;
	left: 50%;
	margin-left: 180px;
	border: 1px solid #B0B5BD;
	width:200px;
	height: 700px;
	background-color: #f9f7f6;
}

#rightSide #right_zzim  div {
	text-align: center;
}

#rightSide #aaa div.recTit {
	
	padding-left:10px;
	text-decoration:none;
	color:white;
	font-weight:bold;
	display:inline-block;
	border-right:30px solid transparent;
	border-bottom:30px solid #373b43;
	height:0;
	line-height: 40px;
}

#right_zzim #recentCnt {
	color: yellow;
}

#rightSide #right_zzim ul {
	min-height: 495px;
	list-style: none;
	padding-inline-start:0px;
}

#rightSide #right_zzim  li {
	text-align: center;
	padding: 5px;
	position: relative;
	list-style: none;
}

#rightSide #right_zzim ul li img {
	border: 1px solid #ccc
}
.noData {
	color: #ccc;
	text-align: center;
	margin-top: 223px;
}
</style>

<div id="rightSide">
<div id="aaa">
<div class="recTit">
			 최근본스타일 
		</div>
		</div>
	<div id="right_zzim">
		
		<ul>	
<!-- 본 상품이 뿌려질 부분  -->
		</ul>		
	</div>
</div>
<script src="./js/jquery.js">

</script>
<script>
	// recent item    
	window.onload = function(){
		chkRecent();
	}
	
	function styleCookieList(){
		var cookie = document.cookie.split(';');
		for(var list in cookie){
			if(cookie[list].split('stl_id=')[1]){
				return cookie[list].split('stl_id=')[1]
			}
		}
	}
	

	function chkRecent() {
		$("#right_zzim ul").html(''); // 일단 Ul 내용 지우기...
		var cookieList = null;
		if(styleCookieList()){
			cookieList = styleCookieList().split('/');
		}
						
		if (cookieList) {
			for (var list in cookieList) {
				var thisItem = cookieList[list]
				if (thisItem != ' ') {
					var stl_id = thisItem.split(':')[0];
					var itemImg = thisItem.split(':')[1];
					$("#right_zzim ul")
							.append(
									'<li><a href="/jsp_style_recom/styleDetail.do?stl_id='
											+ stl_id+"&onoff=0"
											+ '" target="_top"><img src="./images/category_images/'+itemImg+'"  width="102.92" height="108" border=1></a></li>')
				}
			}
		}
		else {
			$("#right_zzim ul").append(
					'<p class="noData">최근 본 상품이<br> 없습니다.</p>');
			$("#recentCnt").text('');
		}
	}
</script>

</html>