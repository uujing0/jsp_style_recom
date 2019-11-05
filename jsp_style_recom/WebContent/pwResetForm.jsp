<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script type='text/javascript'>
function chk() {
	if(mem_pw = mem_pw2){
		return ture;
		}
	alert("비밀번호가 다릅니다")
	frm.mem_pw.focus();
	return false;
	}
</script>
<link rel="stylesheet" type="text/css" href="HJ_style.css">
</head>
<body>
	<div class="content">
	<br>
		<div class="agree">
			<ul class="idpwSrh">
				<li>
					<div class="srhBox br">
						<div class="srhTop">
						<h1>비밀번호 재설정</h1>
						<br/>
						<br/>
						
						<br/>

						</div>
						<div class="info">
							<form name="pwForm" method="post" action="pwResetPro.do" onsubmit="return chk()">
								<input type="hidden" name="MEM_ID" value="${member.mem_id}" width= "100px" />
								<input type="hidden" name="MEM_EMAIL" value="${member.mem_email}" width= "100px" />
								<input type="hidden" name="MEM_PHONE" value="${member.mem_phone}" width= "100px" />
								<fieldset>
									<legend>비밀번호 재설정</legend>
									<p>
										<label>비밀번호 입력</label><input type="password" name="mem_pw"
											title="비밀번호 입력" placeholder="비밀번호 입력" required=required />
									</p>
									<p>
										<label>비밀번호 확인</label><input type="password" name="mem_pw2"
											title="비밀번호 확인" placeholder="비밀번호 확인" required=required />
									</p>
									<button type="submit">입력</button>
								</fieldset>
							</form>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>