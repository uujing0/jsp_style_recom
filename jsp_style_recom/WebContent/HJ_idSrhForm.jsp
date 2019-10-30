<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript'>

</script>
<link rel="stylesheet" type="text/css" href="HJ_style.css">
</head>
<body>
	<div class="content">
		<div class="agree">
			<ul class="idpwSrh">
				<li>
					<div class="srhBox or">
						<div class="srhTop">
							<h1>아이디 찾기</h1>
							<br/>
							<br/>
							내정보에 등록한 정보로
							<br/>
							아이디를 찾을 수 있습니다.
						</div>
						<div class="info">
							<form name="idForm" method="post" action="idSrhPro.do">
								<input type="hidden" name="MEM_ID" value=" " />
								<fieldset>
									<legend>아이디 찾기 폼</legend>
									<p>
										<label>이&nbsp;&nbsp;름</label> <input type="text" name="mem_name"
											required=required placeholder="이름" title="이름 입력" />
									</p>
									<p>
										<label>연락처</label> <input type="text" name="mem_phone"
											required="required" pattern="\d{2,3}-\d{3,4}-\d{4}"
											placeholder="000-0000-0000" title="연락처 입력" />
									</p>
									<p>
										<label>이메일</label> <input type="text" name="mem_email"
											required=required placeholder="이메일" title="이메일 입력" />
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