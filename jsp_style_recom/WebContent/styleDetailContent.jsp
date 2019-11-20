<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스타일추천 상세</title>

<style type="text/css">

#styleDetailContent_ImageDesc {
	line-height: 35px;
	margin-left: 390px;
}

#styleDetailContent_styledesc {
	display: inline-block;
	width: 420px;
	height: 200px; 
	margin-left: 80px;
	font-size: 20px;
	color: #666666;
	font-weight: bold;
}

#styleDetailContent_mainImage {
	display: inline-block;
}

#styleDetailContent_cciconName {
	width: 60%;
	height: 100px;
	boader: none;
	margin-top: 10px;
	margin-left: 320px;
}

#styleDetailContent_Name {
	width: 150px;
	/* margin: 100px auto;*/
	padding: 20px;
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
	display: block;
	border-right: 30px solid transparent;
	border-bottom: 40px solid #e45151;
	height: 0;
	line-height: 15px;
	margin-bottom: -4px;
	margin-left: 50px;
}

#styleDetailContent_Name h3 {
	font-size: 17px;
	margin-top: 33px;
}

#styleDetailContent_cc1234 {
	margin-left: 30px;
	margin-top: 30px;
}

.styleDetailContent_table tr td {
	text-align: center;
	font-size: 20px;
	margin: 5px;
}

#styleDetailContent_ccicon {
	width: 940px;
	height: 235px;
	boader: none;
	background-color: #f3f1f0;
	margin-left: 320px;
	margin-top: -20px;
}

#styleDetailContent_ccstyle {
	margin-left: 40px;
	padding: 70px;
	display: inline-block;
	justify-content: center;
}

.styleDetailContent_btn {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #373b43 5%, #373b43 100%);
	background-color: #373b43;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	padding: 8px 12px;
	text-decoration: none;
	border: none;
}

.styleDetailContent_btn:hover {
	background: linear-gradient(to bottom, #e45151 5%, #e45151 100%);
	background-color: #e45151;
}

.styleDetailContent_btn:active {
	position: relative;
	top: 1px;
}

#styleDetailContent_ButtonDiv {
	margin-top: 70px;
	margin-left: 610px;
}

#styleDetailcontent_pcc1_Name {
	width: 80px;
	padding: 20px;
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
	display: block;
	border-right: 30px solid transparent;
	border-bottom: 40px solid #4c4c4c;
	height: 0;
	line-height: 10px;
	margin-left: 320px;
	margin-bottom: -4px;
	
}

#styleDetailcontent_pcc2_Name {
	width: 80px;
	padding: 20px;
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
	display: block;
	border-right: 30px solid transparent;
	border-bottom: 40px solid #4c4c4c;
	height: 0;
	line-height: 10px;
	margin-left: 320px;
	margin-bottom: -4px;
}

#styleDetailcontent_pcc3_Name {
	width: 80px;
	padding: 20px;
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
	display: block;
	border-right: 30px solid transparent;
	border-bottom: 40px solid #4c4c4c;
	height: 0;
	line-height: 10px;
	margin-left: 320px;
	margin-bottom: -4px;
}

#styleDetailcontent_pcc1_Name p {
	font-size: 18px;
	margin-top: 35px;
	color: white;
	height: 20px;
	text-align: center;
}
#styleDetailcontent_pcc2_Name p {
	font-size: 18px;
	margin-top: 35px;
	color: white;
	height: 20px;
	text-align: center;
	
}
#styleDetailcontent_pcc3_Name p {
	font-size: 18px;
	margin-top: 35px;
	color: white;
	height: 20px;
	text-align: center;
	
}

#styleDetailcontent_pcc1 {
	margin-top: 3px;
	width: 78%;

	boader: none;
	margin-left: 320px;
}
#styleDetailcontent_pcc2 {
	margin-top: 3px;
	width: 78%;
	boader: none;
	margin-left: 320px;
}
#styleDetailcontent_pcc3 {
	margin-top: 3px;
	width: 78%;
	boader: none;
	margin-left: 320px;
}



#styleDetailContent_p{
margin-left: 320px;
margin-top: 120px;
}
#styleDetailContent_p p{
font-size: 20px;
color: #666666;
font-weight: bold;
}
#styleDetailContent_p hr{

width : 1000px;
border:none; border:0.6px solid #E7E2E1; 
margin-left: 0px;

}


.styleDetailContent_table tr td {
font-size: 17px;
padding: 3px 12px 0px 0px;
}


</style>

<script type="text/javascript">
	//url복사

	function urlCopy() {
		alert("클립보드로 url이 복사되었습니다. 공유를 원하는 곳에 붙여넣어주세요.");
		var tempElem = document.createElement('textarea');
		tempElem.value = location.href;
		document.body.appendChild(tempElem);

		tempElem.select();
		document.execCommand("copy");
		document.body.removeChild(tempElem);
	};
	function notJoin() {
		alert("로그인이 필요합니다.");
		window
				.open('loginForm.jsp', '로그인',
						'width=500,height=400,left=700,top=200,status=no,scrollbars=no');

		//opener.document.location.href='styleDetail.do?stl_id=2&onoff=0';

	}
	function bookmarkInsert() {
		alert("즐겨찾기에 등록되었습니다.");
	}
	function bookmarkDelete() {
		alert("즐겨찾기 해제되었습니다.");
	}
</script>
</head>
<body bgcolor="#f9f7f6"> 

	<div id="styleDetailContent_ButtonDiv">

		<table>
			<tr>
				<td onclick="urlCopy()">
					<form>
						<input class="styleDetailContent_btn" type="button"
							value="공유(url복사)">
					</form>
				</td>

				<td><c:if test="${mem_id == null }">
						<form onclick="notJoin()">
							<input type="button" class="styleDetailContent_btn"
								value="즐겨찾기 등록">

						</form>

					</c:if> <c:if test="${mem_id != null }">

						<c:if test="${status == 0 }">
							<form
								action="styleDetail.do?stl_id=${stl_id }&mem_id=${mem_id}&onoff=1"
								method="post" onclick="bookmarkInsert()">
								<input type="submit" class="styleDetailContent_btn"
									value="즐겨찾기 등록">
							</form>
						</c:if>
						<c:if test="${status == 1 }">
							<form
								action="styleDetail.do?stl_id=${stl_id }&mem_id=${mem_id}&onoff=2"
								method="post" onclick="bookmarkDelete()">
								<input type="submit" class="styleDetailContent_btn"
									value="즐겨찾기 해제">
							</form>
						</c:if>
					</c:if></td>
			</tr>
		</table>
	</div>


	<table id="styleDetailContent_ImageDesc">
		<tr>
			<td><span id="styleDetailContent_mainImage"> <img
					src="./images/category_images/${al[0] }" id="${al[0] }"
					height="480px" width="450px">
			</span></td>
			<td><span id="styleDetailContent_styledesc"> 
					${std_desc}
			</span></td>
		</tr>
	</table>



	<div id="styleDetailContent_cciconName">
		<div id="styleDetailContent_Name">
			<h3>스타일 코디 아이템</h3>
		</div>

		<div id="styleDetailContent_cc1234">
			<table class="styleDetailContent_table">
				<tr>
					<td><c:if test="${al[1]!=null }">
							<img src="./images/clothes_category_icon/${al[1] }"
								id="${al[1] }" width="210px" height="170px">
						</c:if> <c:if test="${al[1]==null }">
							<img alt="no_data" src="./images/null_cc_id.png" width="210px"
								height="170px">
						</c:if></td>


					<td><c:if test="${al[2]!=null }">
							<img src="./images/clothes_category_icon/${al[2] }"
								id="${al[2] }" width="210px" height="170px">
						</c:if> <c:if test="${al[2]==null }">
							<img alt="no_data" src="./images/null_cc_id.png" width="210px"
								height="170px">
						</c:if></td>

					<td><c:if test="${al[3]!=null }">
							<img src="./images/clothes_category_icon/${al[3] }"
								id="${al[3] }" width="210px" height="170px">
						</c:if> <c:if test="${al[3]==null }">
							<img alt="no_data" src="./images/null_cc_id.png" width="210px"
								height="170px">
						</c:if></td>

					<td><c:if test="${al[4]!=null }">
							<img src="./images/clothes_category_icon/${al[4] }"
								id="${al[4] }" width="210px" height="170px">

						</c:if> <c:if test="${al[4]==null }">
							<img alt="no_data" src="./images/null_cc_id.png" width="210px"
								height="170px">
						</c:if></td>
				</tr>
				<tr>
					<td>겉옷</td>
					<td>상의</td>
					<td>하의</td>
					<td style="color: red;">오늘의 IT템</td>
				</tr>

			</table>

		</div>

	</div>

	<div id="styleDetailContent_ccicon"></div>

	<%-- <c:if test="${acc_desc!=null }">
				   ${acc_desc }
	 </c:if> --%>
	 <div id = "styleDetailContent_p">
	 <p>연관상품</p>
     <hr>
	 </div>

	<c:if test="${fn:length(p_cc1) != 0 }">

		<div id="styleDetailcontent_pcc1_Name">
			<p>겉옷</p>
		</div>


		<div id="styleDetailcontent_pcc1">

			<c:forEach var="i" begin="0" end="${fn:length(p_cc1)-1}">
				<span class="styleDetailContent_ccstyle"> <c:if
						test="${p_cc1[i] ==null }">
					</c:if> <c:if test="${p_cc1[i] !=null }">
						<a href="prddetail.do?prd_id=${p_cc1_id[i] }"> <img
							alt="{p_cc1[i] }" src="./images/product_images/${p_cc1[i]}"
							width="210px" height="200px" style="padding:10px">
						</a>
					</c:if>
				</span>
			</c:forEach>
		</div>
	</c:if>

	<c:if test="${fn:length(p_cc2) != 0 }">

		<div id="styleDetailcontent_pcc2_Name">
			<p>상의</p>
		</div>
		<div id="styleDetailcontent_pcc2">

			<c:forEach var="i" begin="0" end="${fn:length(p_cc2)}">
				<span class="styleDetailContent_ccstyle"> <c:if
						test="${p_cc2[i] ==null }">
					</c:if> <c:if test="${p_cc2[i] !=null }">
						<a href="prddetail.do?prd_id=${p_cc2_id[i] }"> <img
							alt="{p_cc2[i] }" src="./images/product_images/${p_cc2[i]}"
							width="210px" height="200px" style="padding:10px">
						</a>
					</c:if>
				</span>
			</c:forEach>
		</div>
	</c:if>

	<c:if test="${fn:length(p_cc3) != 0 }">

		<div id="styleDetailcontent_pcc3_Name">
			<p>하의</p>
		</div>

		<div id="styleDetailcontent_pcc3">


			<c:forEach var="i" begin="0" end="${fn:length(p_cc3)}">
				<span class="styleDetailContent_ccstyle"> <c:if
						test="${p_cc3[i] ==null }">
					</c:if> <c:if test="${p_cc3[i] !=null }">
						<a href="prddetail.do?prd_id=${p_cc3_id[i] }"> <img
							alt="{p_cc3[i] }" src="./images/product_images/${p_cc3[i]}"
							width="210px" height="200px" style="padding:10px">
						</a>
					</c:if>
				</span>
			</c:forEach>
		</div>
	</c:if>


</body>
</html>