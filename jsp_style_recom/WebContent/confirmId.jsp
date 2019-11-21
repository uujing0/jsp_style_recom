<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 확인</title>
<style type="text/css">
h2.confirmId_title {
	color: #343A40; /*font color*/
	text-align: center;
	margin: 30px 0px 30px 0px;
}

.confirmId_ul {
	list-style-type: none;
	padding: 0;
	width: 80%;
	margin-left: 10%;
}

.confirmId_ul li label {
	display: block;
  	color: #343A40;
  	padding: 10px 0px;
  	font-size: 15px;
}

.confirmId_ul li input {
	padding: 12px 10px;
	border: 1px solid #e0dcdc;
	width: -webkit-fill-available;
}

.confirmId_Button {
	border: solid 2px;
	border-bottom: solid 4px;
	border-color: #F9F7F6;
	background-color: #373B43;
	color: white;
	font-size: 15px;
	padding:12px 26px;
}


</style>
</head>

<body bgColor="#f9f7f6">
 
<script type="text/javascript">
	function wincl() {
		opener.document.frm.mem_id.value="${param.mem_id}";
	window.close();
	}
</script>



	
<c:if test="${result==-1}">
	
	<form>
	<h2 class="confirmId_title">중복확인</h2>
	<ul class="confirmId_ul">
	<li class="list-item">
	<div style="text-align: center;">
	<label>${param.mem_id} 는 사용해도 좋습니다</label>
	</div>
	</li>
	<li>
	<div style="text-align: center; margin: 30px 30% 40px 30%;">
	<input  class="confirmId_Button" type="button" value="닫기" onclick="wincl()">
	</div>
	</li>
	</ul>
	</form>
</c:if>

<c:if test="${result==1}">  
	<script type="text/javascript">
		alert("이미 존재하는 아이디 입니다.");  
		/* location.href="joinForm.do"; */
	  </script>
	<form>
	<h2 class="confirmId_title">중복확인</h2>
	<ul class="confirmId_ul">
	<li class="list-item">
	<div style="text-align: center;">
		<label><input type="text" name="mem_id" placeholder="다른 아이디를 입력하세요" required="required"></label>
	</div>
	<div style="text-align: center; margin: 30px 30% 40px 30%;">
		<input class="confirmId_Button" type="submit" value="확인">
	</div>
	</li>
	</ul>
     </form>
   
 </c:if>

<c:if test="${result==0}">  
	<script type="text/javascript">
		alert("${param.mem_id} 아이디는 3년간 사용할 수 없으니 다른 아이디로 가입해 주시면 감사하겠습니다.");  
		/* location.href="joinForm.do"; */
	  </script>
	<form>
	<h2 class="confirmId_title">중복확인</h2>
	<ul class="confirmId_ul">
	<li class="list-item">
	<div style="text-align: center;">
		<label><input type="text" name="mem_id" placeholder="다른 아이디를 입력하세요" required="required"></label>
	</div>
	<div style="text-align: center; margin: 30px 30% 40px 30%;">
		<input class="confirmId_Button" type="submit" value="확인">
	</div>
	</li>
	</ul>
     </form>
   
 </c:if>
</body>
</html>