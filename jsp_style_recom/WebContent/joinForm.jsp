<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>웹 폼</title>
<link rel="stylesheet" type="text/css" href="HJ_style.css">
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


</head>
<body >


<form action="joinPro.do" name="frm" onsubmit="return chk()">
	       <div class="content">
	<br>
	<div class="agree">
	       <ul class="idpwSrh">
	       	<li>
	       		<div class="srhBox br">
	       			<div class="srhTop">
	       				<h1>회원 가입</h1>
	       				<br/>
	       				<br/>
	       				"웰시코기"에 회원으로
	       				<br/>
	       				등록합니다.
	       				<br/>
	       					</div>
	       					<div class="info">
<fieldset id="bg1">
<legend><h1>회원 가입</h1></legend>

	
		<ul>
			<li><p><label>아&nbsp;이&nbsp;디</label><label><input type="text" class="a" name="mem_id"
					placeholder="아이디"><input type="button" value="중복확인"
					onclick="winop()"></p></label></li>
			<br/>
			<li><p><label>비밀번호</label><label><input type="password" class="a" name="mem_pw"
					required="required" placeholder="비밀번호"></p></label></li>
			<br/>
			<li><p><label>비밀번호&nbsp;확인</label><label><input type="password" class="a" name="mem_pw2"
					required="required" placeholder="비밀번호 확인"></p></label></li>
			<br/>
			<li><p><label>이&nbsp;&nbsp;&nbsp;&nbsp;름</label><label><input type="text" class="a" name="mem_name"
					required="required"  placeholder="이름"></p></label></li>
			<br/>
			<li><p><label>연&nbsp;락&nbsp;처</label> <label><input type="text" name="mem_phone"
											required="required" pattern="\d{2,3}-\d{3,4}-\d{4}"
											placeholder="000-0000-0000"></label></p></li>
			<br/>
			<li><p><label>이&nbsp;메&nbsp;일</label><label><input type="text" class="a" name="mem_email"
					required="required" value="${mem_email}" placeholder="이메일"></p></label></li>
			<br/>
			<li><p><label>주&nbsp;소</label> <select
				  name="mem_addr" onChange="categoryChange(this)" >
					<option>사는 곳을 선택해주세요</option>
					<option value="서울특별시">서울특별시</option>
					<option value="강원도">강원도</option>
					<option value="경기북부">경기북부</option>
					<option value="경기남부">경기남부</option>
					<option value="경상남도">경상남도</option>
					<option value="경상북도">경상북도 </option>
					<option value="광주광역시">광주광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="세종특별자치시">세종특별자치시</option>
					<option value="울산광역시">울산광역시</option>
					<option value="인천광역시">인천광역시</option>
					<option value="전라남도">전라남도</option>
					<option value="전라북도">전라북도</option>
					<option value="제주특별자치도">제주특별자치도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
                 	</select>   
                   <input type="text" name="mem_add_addr" list="mem_addr"
						  required="required" placeholder="나머지 주소"></p></li>
				 <br/>
			<li><label class="" >체&nbsp;형</label> <select
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
          <label>&nbsp;성&nbsp;별</label>
			<li><label><input type="radio" name="mem_gender" value="1"
					required="required">남</label> <label><input type="radio"
					name="mem_gender" value="2" required="required">여</label></li>
					
<br/>
			<li><button type="submit">가입하기</button></li>
		</ul>
	

</fieldset>
</div>
</div>
</li>
</ul>
</div>
</div>
</form>
<
</body>
</html>