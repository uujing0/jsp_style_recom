<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>웹 폼</title>
<style>

    
h1{
    margin:80px;
}

li {
	
	margin: 20px;
	
}

.a{ 
     border-color:#FFBB00;
     border-width:5px; 
     box-shadow:2px 2px 5px 2px gray;
}
</style>
<script type="text/javascript">
	function chk() {
		if (frm.passwd.value != frm.passwd2.value) {
			alert("암호가 다릅니다");
			frm.passwd.focus();
			return false;
		}
		return true;
	}
	function winop() {
		if (!frm.id.value) {
			alert("id를 입력하고 사용하세요");
			frm.id.focus();
			return false;
		}
		window.open("confirmId.jsp?id=" + frm.id.value, "",
				"width=300 height=300");
	}
</script>


</head>
<body>


<form action="joinPro.jsp" name="frm" onsubmit="return chk()">
<table border="1">	       
<tr>
<td><h1>회원 가입</h1>

	<form>
		<ul>
			<li><label ><input type="text" class="a" name="id"
					placeholder="아이디"> <input type="button" value="중복확인"
					onclick="winop()"></label></li>
			<li><label><input type="password" class="a" name="passwd"
					required="required" placeholder="비밀번호"></label></li>
			<li><label><input type="password" class="a" name="passwd2"
					required="required" placeholder="비밀번호 확인"></label></li>
			<li><label><input type="text" class="a" name="name"
					required="required" placeholder="이름"></label></li>
			<li><label><input type="tel" class="a" name="phone"
					required="required" placeholder="전화번호(xxx-xxxx-xxxx)"></label></li>
			<li><label><input type="text" class="a" name="email"
					required="required" placeholder="이메일"></label></li>
			<li><label><input type="text" class="a" name="address"
					required="required" placeholder="주소"></label></li>
			<li><label class="" for="body_type">체형</label> <select
				name="body_type">
					<option value="1">마름</option>
					<option value="2">평균</option>
					<option value="3">통통</option>
					<option value="4">비만</option>


			</select></li>
            <li><label class="" for="favloc">관심 지역(중복 선택 가능)</label><p> <select
				name="favloc" multiple >
					<option value="1">서울특별시</option>
					<option value="2">경기도</option>
					<option value="3">강원도</option>
					<option value="4">충청남도</option>
                    <option value="5">충청북도</option>
                    <option value="6">전라남도</option>
                    <option value="7">전라북도</option>
                    <option value="8">경상남도</option>
                    <option value="9">경상북도</option>
                    <option value="10">제주도</option>
			</select></li> 
             
			<li><label><input type="radio" name="gender" value="man"
					required="required">남</label> <label><input type="radio"
					name="gender" value="woman" required="required">여</label></li>

			<li><input type="submit" value="확인"> <input type="reset"
				value="취소"></li>
		</ul>
	</form>
</td></tr>
</table>
</form>

</body>
</html>