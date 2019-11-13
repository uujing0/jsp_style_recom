<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천 스타일 상세</title>
<style type="text/css">
#buttons {
	margin-left: 700px;
	margin-top: 50px;
	color:pink;
}

h2 {
	text-align: center;
}

#style_info {
	margin-left: 300px;
}

#cc_icon {
	margin-left: 100px;
	display: inline-block;
}

#product_image {
	margin-left: 280px;
	width: 1500px;
	height: 800px;
}

#pro1 {
	margin-right: 10px;
	float: left;
	width: 400px;
	height: 300px;
	background-color: gray;
}

#pro2 {
	margin-right: 10px;
	float: left;
	width: 400px;
	height: 300px;
	background-color: gray;
}

#pro3 {
	margin-right: 10px;
	float: left;
	width: 400px;
	height: 300px;
	background-color: gray;
}

#pro4 {
	margin-top: 30px;
	margin-right: 10px;
	float: left;
	width: 400px;
	height: 300px;
	background-color: gray;
}

#pro5 {
	margin-top: 30px;
	margin-right: 10px;
	float: left;
	width: 400px;
	height: 300px;
	background-color: gray;
}

#item1 {
	margin-left: 40px;
	padding: 20px;
	display: inline-block;
	justify-content: center;
}

#item2 {
	margin-left: 40px;
	padding: 20px;
	display: inline-block;
	justify-content: center;
}

#item3 {
	margin-left: 10px;
	padding: 20px;
	display: inline-block;
	justify-content: center;
}




</style>
<script type="text/javascript">
$(document).ready(function()){
	$(".urlCopy").hover{
	function(){
		
/* 		$(this).css("background-color", "#0000ff");
 */		$(this).addClass("mouseover");
	},
	function(){
	/* 	$(this).css("background-color", "#ffffff");
	 */	$(this).removeClass("mouseover");
	}
	);

});
</script>

<script type="text/javascript" src="../js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	//url복사
	var obj;
	function urlClipCopy() {
		obj.select();
		document.execCommand("copy");
		alert("클립보드로 URL이 복사되었습니다.");
	}
	window.onload = function() {
		obj = document.getElementById('url');
		obj.value = location.href;

	}

</script>
</head>
<%@ include file="header.jsp"%>


<body>
	<h1>오늘의 추천 스타일</h1>
	<hr>
	<div>
		<img src="./images/hanger.png" height="40px" width="60px">
		<h3>${std_desc}</h3>
	</div>

	<div id="buttons" class="buttons">
	<input type="hidden" id="url" class="input"  />
	<table>
	<tr>
		
		<td><button class="button" id ="urlCopy" onclick="urlClipCopy()">URL복사</button></td>

		<td><c:if test="${status == 0 }">
			<form
				action="styleDetail.do?stl_id=${stl_id }&mem_id=${mem_id}&onoff=1"
				method="post">
				<input type="submit" id = "bm1" value="즐겨찾기 등록">
			</form>
		</c:if>
		<c:if test="${status == 1 }">
			<form
				action="styleDetail.do?stl_id=${stl_id }&mem_id=${mem_id}&onoff=2"
				method="post">
				<input type="submit" id = "bm2" value="즐겨찾기 해제">
			</form>
		</c:if>
		</td>
		</tr>
</table>
	</div>


	<div id="style_info">
		<span id="main_image"> <img
			src="./images/category_images/${al[0] }" id="${al[0] }"
			height="740px" width="580px">

		</span>


		<div id="cc_icon">

			<table>
				<tr>
					<th>스타일 코디 아이템</th>
				</tr>
				<tr>
					<td>겉옷</td>
					<c:if test="${al[1]!=null }">
						<td><img src="./images/clothes_category_icon/${al[1] }"
							id="${al[1] }" height="150px" width="150px"></td>
					</c:if>
					<c:if test="${al[1]==null }">
						<td><img alt="no_data" src="./images/null_cc_id.png"
							height="150px" width="150px"></td>
					</c:if>
				</tr>
				<tr>
					<td>상의</td>
					<c:if test="${al[2]!=null }">
						<td><img src="./images/clothes_category_icon/${al[2] }"
							id="${al[2] }" height="150px" width="150px"></td>
					</c:if>
					<c:if test="${al[2]==null }">
						<td><img alt="no_data" src="./images/null_cc_id.png"
							height="150px" width="150px"></td>
					</c:if>
				</tr>

				<tr>
					<td>하의</td>
					<c:if test="${al[3]!=null }">
						<td><img src="./images/clothes_category_icon/${al[3] }"
							id="${al[3] }" height="150px" width="150px"></td>
					</c:if>
					<c:if test="${al[3]==null }">
						<td><img alt="no_data" src="./images/null_cc_id.png"
							height="150px" width="150px"></td>
					</c:if>
				</tr>

				<tr>
					<td>오늘의 "IT"템</td>
					<c:if test="${al[4]!=null }">
						<td><img src="./images/clothes_category_icon/${al[4] }"
							id="${al[4] }" height="150px" width="150px"></td>
					</c:if>
					<c:if test="${al[4]==null }">
						<td><img alt="no_data" src="./images/null_cc_id.png"
							height="150px" width="150px"></td>
					</c:if>
				</tr>

			</table>
		</div>

	</div>

	<br>
	<br>
	<hr>
	<h3>관련 상품</h3>



	<c:if test="${fn:length(p_cc1) != 0 }">
		<p>겉옷</p>
		<c:forEach var="i" begin="0" end="${fn:length(p_cc1)-1}">
			<span class="item1"> <c:if test="${p_cc1[i] ==null }">
				</c:if> <c:if test="${p_cc1[i] !=null }">
					<a href="prddetail.do?prd_id=${p_cc1_id[i] }"> <img
						alt="{p_cc1[i] }" src="./images/product_images/${p_cc1[i]}"
						width="350px" height="380px">
					</a>
				</c:if>
			</span>
		</c:forEach>
	</c:if>



	<c:if test="${fn:length(p_cc2) != 0 }">
		<p>상의</p>
		<c:forEach var="i" begin="0" end="${fn:length(p_cc2)}">
			<span class="item2"> <c:if test="${p_cc2[i] ==null }">
				</c:if> <c:if test="${p_cc2[i] !=null }">
					<a href="prddetail.do?prd_id=${p_cc2_id[i] }"> <img
						alt="{p_cc2[i] }" src="./images/product_images/${p_cc2[i]}"
						width="350px" height="380px">
					</a>
				</c:if>
			</span>
		</c:forEach>
	</c:if>


	<c:if test="${fn:length(p_cc3) != 0 }">

		<p>하의</p>
		<c:forEach var="i" begin="0" end="${fn:length(p_cc3)}">
			<span class="item3"> <c:if test="${p_cc3[i] ==null }">
				</c:if> <c:if test="${p_cc3[i] !=null }">
					<a href="prddetail.do?prd_id=${p_cc3_id[i] }"> <img
						alt="{p_cc3[i] }" src="./images/product_images/${p_cc3[i]}"
						width="350px" height="380px">
					</a>
				</c:if>
			</span>
		</c:forEach>
	</c:if>
</body>
<%@ include file="footer.jsp"%>

</html>