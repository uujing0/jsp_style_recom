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

ul{ margin:20px; }
</style>
<script type="text/javascript">
	function chk() {
		if (frm.mem_pw.value != frm.mem_pw2.value) {
			alert("암호가 다릅니다");
			frm.passwd.focus();
			return false;
		}
		return true;
	}
	function winop() {
		if (!frm.mem_id.value) {
			alert("id를 입력하고 사용하세요");
			frm.id.focus();
			return false;
		}
		window.open("confirmId.jsp?id=" + frm.mem_id.value, "",
				"width=300 height=300");
	}
</script>


</head>
<body>


<form action="oldjoinPro.jsp" name="frm" onsubmit="return chk()">
	       
<fieldset>
<legend><h1>회원 가입</h1></legend>

	
		<ul>
			<li><label ><input type="text" class="a" name="mem_id"
					placeholder="아이디"> <input type="button" value="중복확인"
					onclick="winop()"></label></li>
			<li><label><input type="password" class="a" name="mem_pw"
					required="required" placeholder="비밀번호"></label></li>
			<li><label><input type="password" class="a" name="mwm_pw2"
					required="required" placeholder="비밀번호 확인"></label></li>
			<li><label><input type="text" class="a" name="mem_name"
					required="required" placeholder="이름"></label></li>
			<li><label><input type="tel" class="a" name="mem_phone"
					required="required" placeholder="전화번호(xxx-xxxx-xxxx)"></label></li>
			<li><label><input type="text" class="a" name="mem_email"
					required="required" placeholder="이메일"></label></li>
			<li><label><input type="text" class="a" name="mem_addr"
					required="required" placeholder="주소"></label></li>
			<li><label class="" name="mem_body_type">체형</label> <select
				name="body_type">
					<option value="1">마름</option>
					<option value="2">평균</option>
					<option value="3">통통</option>
					<option value="4">비만</option>


			</select></li>
			
			<li><label class="" name="mem_fav_loc">관심지역(중복 선택 가능)</label></li>
			 
            <label><input type="checkbox" name="loc1" value="서울특별시">서울특별시</label>
			<label><input type="checkbox" name="loc2" value="경기도">경기도</label>
			<label><input type="checkbox" name="loc3" value="강원도">강원도</label><p>
			<label><input type="checkbox" name="loc4" value="충청남도">충청남도</label>
			<label><input type="checkbox" name="loc5" value="충청북도">충청북도</label>
			<label><input type="checkbox" name="loc6" value="전라남도">전라남도</label><p>
			<label><input type="checkbox" name="loc7" value="전라북도">전라북도</label>
			<label><input type="checkbox" name="loc8" value="경상남도">경상남도</label>
			<label><input type="checkbox" name="loc9" value="경상북도">경상북도</label><p>	
			<label><input type="checkbox" name="loc10" value="제주도">제주도</label>
           
             
			<li><label><input type="radio" name="mem_gender" value="1"
					required="required">남</label> <label><input type="radio"
					name="mem_gender" value="2" required="required">여</label></li>

			<li><input type="submit" value="확인"> <input type="reset"
				value="취소"></li>
		</ul>
	

</fieldset>
</form>

</body>
</html>