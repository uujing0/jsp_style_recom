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

 .urlDisp {
}  


</style>

<script type="text/javascript">
	//url복사
	
	function urlCopy(){
		alert("클립보드로 url이 복사되었습니다. 공유를 원하는 곳에 붙여넣어주세요.");
        var tempElem = document.createElement('textarea');
        tempElem.value = location.href; 
        document.body.appendChild(tempElem);

        tempElem.select();
        document.execCommand("copy");
        document.body.removeChild(tempElem);
   };
   function notJoin(){
	   alert("로그인이 필요합니다.");
       window.open('loginForm.jsp','로그인','width=500,height=400,left=700,top=200,status=no,scrollbars=no')

   }
   function bookmarkInsert(){
	   alert("즐겨찾기에 등록되었습니다.");
   }
   function bookmarkDelete(){
	   alert("즐겨찾기 해제되었습니다.");
   }

</script>
</head>
<body>
	
	<div>
		<img src="./images/hanger.png" height="40px" width="60px">
		<h3>${std_desc}</h3>
	</div>
	
	<div id="buttons" class="buttons">
	
			<table>
			<tr>
				<td onclick="urlCopy()">
				<form><input type="button" id="urlCopy" value="url복사" 
				    style="box-sizing: border-box; font-size: 20px; color: orange;"></form>
				</td>
				
				<td>
				
				
				<c:if test="${mem_id == null }">
					<form action="styleDetail.do?stl_id=${stl_id }&mem_id=${mem_id}&onoff=0" onclick="notJoin()">
					    <input type="submit" id = "bm1" value="즐겨찾기 등록">
					    <a href="/jsp_style_recom/loginForm.jsp"></a>
					
					</form>
						
				</c:if>
				
				<c:if test="${mem_id != null }">
				
					<c:if test="${status == 0 }">
						<form
							action="styleDetail.do?stl_id=${stl_id }&mem_id=${mem_id}&onoff=1"
							method="post" onclick="bookmarkInsert()">
							<input type="submit" id = "bm1" value="즐겨찾기 등록">
						</form>
					</c:if>
					<c:if test="${status == 1 }">
						<form
							action="styleDetail.do?stl_id=${stl_id }&mem_id=${mem_id}&onoff=2"
							method="post" onclick="bookmarkDelete()">
							<input type="submit" id = "bm2" value="즐겨찾기 해제">
						</form>
					</c:if>
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
							id="${al[4] }" height="150px" width="150px">
							
						</td>
					</c:if>
					<c:if test="${al[4]==null }">
						<td><img alt="no_data" src="./images/null_cc_id.png"
							height="150px" width="150px"></td>
					</c:if>
				</tr>

			</table>
			    <c:if test="${acc_desc!=null }">
				   ${acc_desc }
				</c:if>
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
</html>