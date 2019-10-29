<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천 리스트 뷰</title>
<script type="text/javascript">

</script>
<style type="text/css">
#category_list{
margin-top: 40px;
margin-left: 200px;
height : 140px;
width: 700px;
background-color: orange;
}
#category_list td{
border:none;
}
#total_style{
    margin-left: 200px;
	height : 1800px;
	width:1500px;
}
#style1{
    float:left;
	background-color:gray; 
	margin-right:80px;

	margin-top: 70px;
	height : 460px;
	width: 320px;

}
  #style2{
	float:left;
	margin-top: 70px; 
		margin-right:80px;
	
	height : 460px;
	width: 320px;
	background-color:gray; 

}

#style3{
	float:left;
	
	margin-top: 70px;
	height : 460px;
	width: 320px;
	background-color:gray; 

} 
#style4{
    float:left;
	background-color:gray; 
	margin-right:80px;

	margin-top: 70px;
	height : 460px;
	width: 320px;

}

  #style5{
	float:left;
	margin-top: 70px; 
		margin-right:80px;
	
	height : 460px;
	width: 320px;
	background-color:gray; 

}

#style6{
	float:left;
	
	margin-top: 70px;
	height : 460px;
	width: 320px;
	background-color:gray; 

} 

/* #body_hh_1_2{
    margin-left: 50px;
	margin-top: 70px;
	height : 460px;
	width: 300px;
} */
</style>
</head>
<%@ include file="/common/header.jsp" %>
<body>
<h2>테마 별 스타일 추천</h2>
<hr>
<table id = "category_list" border="1">
<tr><th>날씨별</th>
<td colspan="4">
<form>
지역설정 :
<select name="sido">
      <option value="1168066000" >서울특별시</option>
      <option value="4281025000" >강원도</option>
      <option value="4125053500" >경기북부</option>
      <option value="4111759600" >경기남부</option>
      <option value="4817074000" >경상남도</option>
      <option value="4717069000" >경상북도</option>
      <option value="2920054000" >광주광역시</option>
      <option value="2720065000" >대구광역시</option>
      <option value="3023052000" >대전광역시</option>
      <option value="2644058000" >부산광역시</option>
      <option value="3611055000" >세종특별자치시</option>
      <option value="3114056000" >울산광역시</option>
      <option value="2871025000" >인천광역시</option>
      <option value="4681025000" >전라남도</option>
      <option value="4579031000" >전라북도</option>
      <option value="5013025300" >제주특별자치도</option>
      <option value="4480038000" >충청남도</option>
      <option value="4376031000" >충청북도</option>
</select>
</form></td>
</tr>
<tr><th>상황별</th>
<td>오피스룩</td>
<td>웨딩하객/셀럽룩</td>
<td>캠퍼스개강룩</td>
<td>집근처마실룩</td>
<td>피크닉룩</td>
</tr>
<tr><th>체형별</th>
<td>통통</td>
<td>슬림</td>
<td>키작은</td>
<td>키큰</td>
</tr>
<tr><th>분위기별</th>
<td>모던시크</td>
<td>상큼발랄</td>
<td>심플베이직</td>
<td>럭셔리</td>
<td>러블리</td>
</tr>
<tr><th>태그별</th>
</tr>
</table>

<div id = "total_style">
<span id = "style1">스타일1</span>
<span id = "style2">스타일2</span>
<span id = "style3">스타일3</span>

<span id = "style4">스타일4</span>
<span id = "style5">스타일5</span>
<span id = "style6">스타일6</span>
</div>


</body>
<%@ include file="/common/footer.jsp" %>

</html>