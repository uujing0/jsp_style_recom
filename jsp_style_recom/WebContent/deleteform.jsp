<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="HJ_SrhLoginStyle.css">
</head>
<body>
	<div class="content">
		<br>
		<div class="agree">
			<ul class="idpwSrh">
				<li>
					<div class="srhBox br"
							style="border-right-width: 0.990; margin-right: 40%; margin-left: 35%; padding-left: 2% overflow: hidden">
						<div class="srhTop">
							<h1>회원 탈퇴</h1>
							<br /> 회원 탈퇴를 위해서 비밀번호를 확인합니다. <br />
						</div>
						<div class="info">
							<form action="deletePro.do">
								<fieldset>
									<legend>
										<h1>회원 탈퇴</h1>
									</legend>
									<!-- <label for="mem_pw">암호 : </label>  -->
									<input type="hidden" name="mem_id" value="${mem_id}"> <br />
									<input type="password" name="mem_pw" required="required"
										class="a" placeholder="암호 입력하세요" id="mem_pw">
									<p>
										<br />
										<button type="submit">탈퇴</button>
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