<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	function next() {
		if (confirm("회원 탈퇴를 하겠습니까?")) {
			location.href = "deleteForm.do";
		} else {
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="HJ_MemberStyle.css">

</head>
<%@include file="header.jsp" %>
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
								<br /> <br /> 등록된 회원 정보를 <br /> 수정할 수 있습니다. <br />
							</div>
							<div class="info">
								<fieldset>
									<legend>
										<h1>회원 정보 수정</h1>
									</legend>
									<ul>
										<li><p>
												<label>아&nbsp;이&nbsp;디</label><br /> <label><input
													type="text" class="a" name="mem_id" value="${mem_id}"
													readonly />
											</p> </label></li>

										<br />
										<br />
										<li><p>
												<label>비밀번호</label><br> <label><input
													type="password" class="a" name="mem_pw" required="required"
													placeholder="비밀번호 재설정">
											</p> </label></li>

										<br />
										<br />
										<li><p>
												<label>비밀번호&nbsp;확인</label><br> <label><input
													type="password" class="a" name="mem_pw2"
													required="required" placeholder="비밀번호 재설정 확인">
											</p> </label></li>
										<br />
										<br />
										<li><p>
												<label>이&nbsp;&nbsp;&nbsp;&nbsp;름</label><br> <label><input
													type="text" class="a" name="mem_name" value="${mem_name}"
													readonly >
											</p> </label></li>
										<br />
										<br />
										<li><p>
												<label>전화번호</label><br> <label><input
													type="tel" class="a" name="mem_phone" required="required"
													value="${mem_phone}">
											</p> </label></li>
										<br />
										<br />
										<li><p>
												<label>이&nbsp;메&nbsp;일</label><br> <label><input
													type="text" class="a" name="mem_email" required="required"
													value="${mem_email}">
											</p> </label></li>
										<br />
										<br />
										<li><p>
												<label>주&nbsp;소</label><br> <select
													class="weatherLocation" name="mem_addr">

													<option value="0">사는 곳을 선택해주세요</option>
													<c:forEach var="i" items="${locMap}">
														<option value="${i.key}">${i.key}</option>
														<c:if test="${lc == i.value }">
															<option value="${i.key}" selected="selected">${i.key}</option>
														</c:if>

													</c:forEach>



												</select> <input type="text" name="mem_add_addr" list="mem_addr"
													required="required" placeholder="나머지 주소">
											</p></li>
										<br />
										<br />
										<li><label class="">체&nbsp;형</label><br> <select
											name="mem_body_type">
												<option value="1">통통</option>
												<option value="2">슬림</option>
												<option value="3">키작은</option>
												<option value="4">키큰</option>


										</select></li>
										<br />
										<li><label class="" name="mem_fav_loc">관심지역(중복 선택
												가능)</label></li>
										<label><input type="checkbox" name="mem_fav_loc"
											value="서울특별시">서울특별시</label>
										<label><input type="checkbox" name="mem_fav_loc"
											value="경기도">경기도</label>
										<label><input type="checkbox" name="mem_fav_loc"
											value="강원도">강원도</label>
										<label><input type="checkbox" name="mem_fav_loc"
											value="충청남도">충청남도</label>

										<br />
										<label><input type="checkbox" name="mem_fav_loc"
											value="충청북도">충청북도</label>
										<label><input type="checkbox" name="mem_fav_loc"
											value="전라남도">전라남도</label>
										<label><input type="checkbox" name="mem_fav_loc"
											value="전라북도">전라북도</label>
										<label><input type="checkbox" name="mem_fav_loc" 
											value="경상남도">경상남도</label>
										<br/>
										<label><input type="checkbox" name="mem_fav_loc"
											value="경상북도">경상북도</label>
										<label><input type="checkbox" name="mem_fav_loc"
											value="제주도">제주도</label>
										<br />
										<br />
										<label>&nbsp;성&nbsp;별</label>
										<li><label><input type="radio" name="mem_gender"
												value="1" required="required">남</label> <br />
										<label><input type="radio" name="mem_gender" value="2"
												required="required">여</label></li>

										<br />
										<br />
										<li><label><button type="submit">수정하기</button></label></li>
										<br />
										<br />
										<li>&nbsp;<a onclick="next()" value="회원탈퇴">회원탈퇴</a></li>
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
<%@include file="footer.jsp" %>
</html>

