<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	function chk() {
		if (frm.mem_pw.value != frm.mem_pw2.value) {
			alert("암호가 다릅니다");
			frm.mem_pw.focus();
			return false;
		}
		return true;
	}
	function winop() {
		if (!frm.mem_id.value) {
			alert("id를 입력하고 사용하세요");
			frm.mem_id.focus();
			return false;
		}
		window.open("confirmId.do?mem_id=" + frm.mem_id.value, "",
				"width=600 height=300");
	}
</script>
<style type="text/css">
h1.joinForm_title {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}

h3.align-center {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}



.joinForm_ul {
	list-style-type: none;
	 /* text-align: center;  */
	padding: 0;
	width: 80%;
	margin-left: 30%;
}

/* .joinForm_ul li label {
	display: block;
  	color: #343A40;
  	padding: 10px 0px;
  	font-size: 15px;
}
 */
.joinForm_ul li input {
	padding: 20px 10px;
	border: 1px solid #e0dcdc;
	 width: 40%; 
} 

.joinForm_joinButton {
	border: solid 2px;
	border-bottom: solid 4px;
	border-color: #F9F7F6;
	background-color: #373B43;
	color: white;
	font-size: 15px;
	padding:12px 26px; 
	text-align: center;
	
}

.element{
  font-size: 20px;
  font-weight:bold;
}


</style>




</head>
<%@include file="header.jsp" %>
<body bgColor="#f9f7f6">
<h1 class="joinForm_title">회원가입</h1>
<h3 class="align-center"> "웰시코디"에 회원으로 등록합니다. </h3>
<form action="joinPro.do" name="frm" onsubmit="return chk()">
<ul class="joinForm_ul">
   <li class="list-item">
      <label class="element">아&nbsp;이&nbsp;디</label><br>
      <input type="text" class="a" name="mem_id" required="required" >  
      <label class="joinForm_joinButton"><a onclick="winop()">중복확인</a> </label>
    
   </li><br>
   <li>
	  <label class="element">비밀번호</label><br>  
	  <input type="password" class="a" name="mem_pw" required="required" >
   </li><br>
   <li>
	  <label class="element">비밀번호&nbsp;확인</label> <br> 
	  <input type="password" class="a" name="mem_pw2" required="required" > 
   </li><br>
   <li>
	  <label class="element">이&nbsp;&nbsp;&nbsp;&nbsp;름</label> <br>
	  <input type="text" class="a" name="mem_name" required="required"> 
   </li><br>
   <li>
	  <label class="element">연&nbsp;락&nbsp;처</label> <br> 
	  <input type="text" name="mem_phone" required="required" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="000-0000-0000">
   </li><br>
   <li>
	  <label class="element">이&nbsp;메&nbsp;일</label> <br>
	  <input type="text" class="a" name="mem_email" required="required">
   </li><br>
   <li>
	  <label class="element">주&nbsp;소</label> <br> 
	  <select class="weatherLocation" name="mem_addr">
		<option value="0">사는 곳을 선택해주세요</option>
		  <c:forEach var="i" items="${locMap}">
		    <option value="${i.key}">${i.key}</option>
		     <c:if test="${lc == i.value }">
			<option value="${i.key}" selected="selected">${i.key}</option>
	          </c:if>
		  </c:forEach>
      </select> <br><br>
      <input type="text" name="mem_add_addr" list="mem_addr" required="required" placeholder="나머지 주소">
  </li>
	<br>								
   <li>
    <label class="element">체&nbsp;형</label> 
     <select name="mem_body_type">
	  <option value="1">통통</option>
	  <option value="2">슬림</option>
	  <option value="3">키작은</option>
	  <option value="4">키큰</option>
     </select>
   </li><br><br>
								
										
	
	  <label class="element" name="mem_fav_loc">관심지역(중복 선택가능)</label><br>
	
	  <label><input type="checkbox" name="mem_fav_loc" value="서울특별시">서울특별시</label>
	  <label><input type="checkbox" name="mem_fav_loc" value="경기도">경기도</label>
	  <label><input type="checkbox" name="mem_fav_loc" value="강원도">강원도</label><br>
	  <label><input type="checkbox" name="mem_fav_loc" value="충청남도">충청남도</label>
										
	  <label><input type="checkbox" name="mem_fav_loc" value="충청북도">충청북도</label>
	  <label><input type="checkbox" name="mem_fav_loc" value="전라남도">전라남도</label><br>
	  <label><input type="checkbox" name="mem_fav_loc" value="전라북도">전라북도</label>
	  <label><input type="checkbox" name="mem_fav_loc" value="경상남도">경상남도</label>
	  <label><input type="checkbox" name="mem_fav_loc" value="경상북도">경상북도</label><br>
	  <label><input type="checkbox" name="mem_fav_loc" value="제주도">제주도</label><br><br>
    <br>								
	 									
	 <label class="element">&nbsp;성&nbsp;별</label><br>
	
	<label><input type="radio" name="mem_gender" value="1" required="required">남</label>
	<label><input type="radio" name="mem_gender" value="2" required="required">여</label>
	
									
	<br><br>								
	
	
	<input class="joinForm_joinButton" type="submit" value="가입하기">
	
	</ul>


	</form>


<%@include file="footer.jsp" %>
   
   
   





</body>
</html>