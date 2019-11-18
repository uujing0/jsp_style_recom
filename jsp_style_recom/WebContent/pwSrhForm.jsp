<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script type='text/javascript'></script>
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
						<h1>비밀번호 찾기</h1>
						<br/>
						<br/>
						내정보에 등록한 정보로
						<br/>
						비밀번호를 찾을 수 있습니다.
						</div>
						<div class="info">
							<form name="pwForm" method="post" action="pwSrhPro.do">
								<input type="hidden" name="MEM_PW" value="" width= "100px" />
								<fieldset>
									<legend>비밀번호 찾기 폼</legend>
									<p>
										<label>아이디</label><input type="text" name="mem_id"
											title="아이디 입력" placeholder="아이디" required=required />
									</p>
									<p>
										<label>이&nbsp;&nbsp;름 </label><input type="text" name="mem_name"
											title="이름 입력" placeholder="이름" required=required />
									</p>
									<p>
										<label>이메일</label> <input type="text" name="mem_email"
											title="이메일 입력" placeholder="메일" required=required />
									</p>
									<button type="submit">찾기</button>
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