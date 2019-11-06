<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>웹 폼</title>
<style>

    
</style>
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
			frm.id.focus();
			return false;
		}
		window.open("confirmId.do?mem_id=" + frm.mem_id.value, "",
				"width=600 height=300");
	}
</script>
<link rel="stylesheet" type="text/css" href="HJ_style.css">

</head>
<body>
<div class="content">
	<br>
	<div class="agree">
	<form action="memUpPro.do" name="frm" onsubmit="return chk()">
	       <ul class="idpwSrh">
	       	<li>
	       		<div class="srhBox br">
	       			<div class="srhTop">
	       				<h1>회원정보 수정</h1>
	       				<br/>
	       				<br/>
	       				등록된 회원 정보를
	       				<br/>
	       				수정할 수 있습니다.
	       				<br/>
	       					</div>
	       					<div class="info">
<fieldset >
<legend><h1>회원 정보 수정</h1></legend>

	
		<ul>
		    <li><label><input type="text" class="a" name="mem_id"
					value="${mem_id}" readonly/></label></li>
			<br/>
			<li><label><input type="password" class="a" name="mem_pw"
					required="required" placeholder="비밀번호 재설정"></label></li>
			<br/>
			<li><label><input type="password" class="a" name="mem_pw2"
					required="required" placeholder="비밀번호 재설정 확인"></label></li>
			<br/>
			<li><label><input type="text" class="a" name="mem_name"
					required="required" placeholder="이름"></label></li>
			<br/>
			<li><label><input type="tel" class="a" name="mem_phone"
					required="required" placeholder="전화번호(xxx-xxxx-xxxx)"></label></li>
			<br/>
			<li><label><input type="text" class="a" name="mem_email"
					required="required" placeholder="이메일"></label></li>
			<br/>
			<li><label><input type="text" class="a" name="mem_addr"
					required="required" placeholder="주소"></label></li>
			<br/>
			<li><label class="" >체형</label> <select
				name="mem_body_type">
					<option value="1">통통</option>
					<option value="2">슬림</option>
					<option value="3">키작은</option>
					<option value="4">키큰</option>


			</select></li>
			<br/>
			 <li><h1><label class="" name="mem_fav_loc">관심지역(중복 선택 가능)</label></h1></li>
            <label><input type="checkbox" name="mem_fav_loc" value="서울특별시">서울특별시</label>
			<label><input type="checkbox" name="mem_fav_loc" value="경기도">경기도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="강원도">강원도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="충청남도">충청남도</label>
			
			<br/>
			<label><input type="checkbox" name="mem_fav_loc" value="충청북도">충청북도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="전라남도">전라남도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="전라북도">전라북도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="경상남도">경상남도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="경상북도">경상북도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="제주도">제주도</label> 
         	 <br/>
          <br/>
			<li><label><input type="radio" name="mem_gender" value="1"
					required="required">남</label> <label><input type="radio"
					name="mem_gender" value="2" required="required">여</label></li>
					
<br/><br/>
			<li><input type="submit" value="확인"> <input type="reset"
				value="취소"></li>
		</ul>
		</fieldset>
		</div>
		</div>
		</li>
		</ul>
		</form>
	</div>
</div>
</body>
</html>

