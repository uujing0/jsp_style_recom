<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<Style>
#rightSide {
	position: absolute;
	top: 547px;
	left: 50%;
	margin: 0 0 0 510px;
}

#rightSide #right_zzim {
	position: fixed;
	top: 180px;
	left: 50%;
	margin-left: 700px;
	border: 1px solid #B0B5BD;
	width:200px;
	height: 700px;
}

#rightSide #right_zzim  div {
	text-align: center;
}

#rightSide #right_zzim  div.recTit {
	line-height: 1.5em;
	padding: 5px;
	color: white;
	background-color: #505A69;
}

#right_zzim #recentCnt {
	color: yellow;
}

#rightSide #right_zzim ul {
	min-height: 495px;
	list-style: none;
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

#right_zzim .detail {
	display: none;
	position: absolute;
	top: 3px;
	right: 20px;
	xheight: 40px;
	xpadding: 15px 11px 0;
	xbackground: #404a59;
	color: #fff;
	xtext-align: left;
	white-space: nowrap;
}

#right_zzim li:hover .detail {
	display: block
}

#right_zzim li .btn_delete {
	position: absolute;
	top: 3px;
	right: -1px;
	width: 11px;
	height: 11px;
	background: url(/img/sp.png) no-repeat -193px -111px;
	text-indent: -9000px;
}

#right_zzim  #currentPage {
	color: #505A69;
	font-weight: bold
}

#right_zzim  #totalPageCount {
	color: #CBC8D2;
	font-weight: bold
}

.noData {
	color: #ccc;
	text-align: center;
	margin-top: 223px;
}

}
#paging {
	display:;
	position: relative;
	line-height: 1em;
}

#paging .btn_prev {
	position: absolute;
	top: 678px;
	left: 4px;
	width: 13px;
	height: 11px;
	background: url(./images/ico_arrow.png) no-repeat;
	text-indent: -9000px;
	border: 1px solid #CCC;
	display: inline-block;
}

#paging .btn_next {
	position: absolute;
	top: 678px;
	right: 4px;
	width: 13px;
	height: 11px;
	background: url(./images/ico_arrow.png) -11px 0px;
	text-indent: -9000px;
	border: 1px solid #CCC;
	display: inline-block;
}


</style>

<div id="rightSide">

	<div id="right_zzim">
		<div class="recTit">
			최근본상품 <span id=recentCnt></span>
		</div>
		<ul>	
<!-- 본 상품이 뿌려질 부분  -->
		</ul>
		
		<div id="paging">
			<a class="btn_prev" style="cursor: pointer">이전</a>
			<span id="currentPage"></span>
			<span id="totalPageCount"></span>
			<a class="btn_next" style="cursor: pointer">다음</a>
		</div>
	</div>
</div>
<script src="./js/jquery.js">

</script>
<script>
	// recent item    
	var Cpage; // 현재 페이지 
	var pagingSize = 4; // 원하는 페이지 사이즈로 조정하세용 

	window.onload = function(){
		chkRecent(1);
	}
	
	function chkRecent(a) {
		var stl_id = getCookie("stl_id");
		$("#right_zzim ul").html(''); // 일단 Ul 내용 지우기... 
		if (stl_id) {
			var totcount = stl_id.split('&').length - 1; //
			var totpage = Math.ceil(totcount / pagingSize) * 1;
			Cpage = (totpage >= a) ? a : 1;
			Cpage = (Cpage < 1) ? totpage : Cpage;
			var start = (Cpage - 1) * pagingSize;
			for (i = start; i <= start + (pagingSize - 1); i++) {
				var thisItem = stl_id.split('&')[i];
				if (thisItem) {
					var stl_id = thisItem.split(':')[0];
					var itemImg = thisItem.split(':')[1];
					$("#right_zzim ul")
							.append(
									'<li><a href="/styleDetail.do?id='
											+ stl_id
											+ '" target="_top"><img src="./images/category_images/'+itemImg+'"  width="75" border=1></a><div class="detail"><a href="javascript:removeRecentItem(\''
											+ thisItem
											+ '\')" class="btn_delete">삭제</a></div></li>')
				}
			}
			$("#paging").show();
		} else {
			$("#right_zzim ul").append(
					'<p class="noData">최근 본 상품이<br> 없습니다.</p>');
			$("#paging").hide();
			$("#recentCnt").text('');
		}
		updateRecentPage(totcount, Cpage);
	}
	chkRecent(1);
	function removeRecentItem(itemname) {
		var stl_id = getCookie("stl_id");
		stl_id = stl_id.replace(itemname + "&", "");
		setCookie("stl_id", stl_id, 1);
		chkRecent(Cpage);
	}

	function updateRecentPage(totcount, Cpage) { //  
		$("#recentCnt").text(totcount); //
		$("#totalPageCount").text("/" + Math.ceil((totcount / pagingSize) * 1));
		if (Math.ceil((totcount / pagingSize) * 1) < Cpage) {
			$("#currentPage").text(Math.ceil((totcount / pagingSize) * 1));
		} else {
			$("#currentPage").text(Cpage); //
		}
	}
	$(".btn_next").on('click', function() {
		chkRecent(Cpage + 1);
	});
	$(".btn_prev").on('click', function() {
		chkRecent(Cpage - 1);
	});
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate()+exdays);
		var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires="+exdate.toGMString());
		document.cookie=cookieName + "="+cookieValue;
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
		}
		checkCookie();
</script>

</html>