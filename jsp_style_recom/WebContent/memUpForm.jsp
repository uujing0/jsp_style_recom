<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!doctype html>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>회원정보 수정</title>
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
	function next(){
		 if(confirm("회원 탈퇴를 하겠습니까?"))
		 {
		  location.href="deleteForm.do";
		 }
		 else
		 {
		 }
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
<legend>회원 정보 수정</legend>
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
					required="required" value="${mem_name2}" readonly ></p></label></li>
			<br/> 
			<li><label><input type="tel" class="a" name="mem_phone"
					required="required" value="${mem_phone}" placeholder="전화번호(000-0000-0000)"></label></li>
			<br/>
			<li><label><input type="text" class="a" name="mem_email"
					required="required" value="${mem_email}" placeholder="이메일"></label></li>
			<br/>
			<li><label>주&nbsp;소</label> 
				<select name="mem_addr" class="weatherLocation" onChange="categoryChange(this)" >
				<option value="0">사는 곳을 선택해주세요</option>
					 <c:forEach var="i" items="${locMap}">
                       <option value="${i.key}">${i.key}</option>
                                <c:if test="${lc == i.value }">
									<option value="${i.key}" selected="selected">${i.key}</option>
								</c:if>
								
                     </c:forEach>
					<!-- <option>사는 곳을 선택해주세요</option>
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
					<option value="충청북도">충청북도</option> -->
                 	</select>    
                   <input type="text" name="mem_add_addr" list="mem_addr"
						  required="required" placeholder="나머지 주소"></p> </li>
				 <br/>
			<li><label class="" >체&nbsp;형</label> <select
				name="mem_body_type">
					<option value="1">통통</option>
					<option value="2">슬림</option>
					<option value="3">키작은</option>
					<option value="4">키큰</option>


			</select></li>
			<br/>
			 <li><label class="" name="mem_fav_loc"><h3>관심지역(중복 선택 가능)</h3></label></li>
            <label><input type="checkbox" name="mem_fav_loc" value="서울특별시">서울특별시</label>
			<label><input type="checkbox" name="mem_fav_loc" value="경기도">경기도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="강원도">강원도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="충청남도">충청남도</label>
			
			<br/>
			<label><input type="checkbox" name="mem_fav_loc" value="충청북도">충청북도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="전라남도">전라남도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="전라북도">전라북도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="경상남도">경상남도</label>
			<br/>
			<label><input type="checkbox" name="mem_fav_loc" value="경상북도">경상북도</label>
			<label><input type="checkbox" name="mem_fav_loc" value="제주도">제주도</label> 
         	 <br/>
          <br/>
          <label>&nbsp;성&nbsp;별</label>
			<li><label><input type="radio" name="mem_gender" value="1"
					required="required">남</label> <label><input type="radio"
					name="mem_gender" value="2" required="required">여</label></li>
					
<br/>
			<li><button type="submit">수정하기</button></li>
				<br/><br/>
			<li>&nbsp;<input type="button" onclick="next()" value="회원탈퇴"></a></li>
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
