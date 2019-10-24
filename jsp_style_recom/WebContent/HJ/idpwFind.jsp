<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type='text/javascript'></script>
<style>
/*기본 설정*/
body {font-size:12px;color:#555555;font-family:'Malgun Gothic','맑은 고딕',dotum,'돋움',sans-serif;word-break:keep-all}
body, div, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, p, form, fieldset, input, table, tr, th, td, button,textarea {margin:0;padding:0}
h1, h2, h3, h4, h5, h6 {font-weight:normal}
ul, ol, li {list-style:none}
hr {position:absolute;left:-1000%;top:0;width:1px;height:1px;font-size:0;line-height:0;overflow:hidden}
legend {position:absolute;left:-1000%;top:0;width:1px;height:1px;font-size:0;line-height:0;overflow:hidden}
caption {width:0;height:0;line-height:0;font-size:0}
fieldset {border:none}
a {text-decoration:none;color:#757575}
a:hover, a:active, a:visited {text-decoration:none;color:#757575}
img {border:0;vertical-align:top}
button {border:0;background-color:transparent;cursor:pointer;vertical-align:top}
input,select {vertical-align:middle}
em,address {font-style:normal}
table {table-layout:fixed;word-wrap:break-word;border-collapse:collapse}
/*바디 설정 */
.idpwSrh {width:100%;overflow:hidden}
.idpwSrh li {float:left;width:50%}
.idpwSrh li .srhBox {padding:23px 41px 34px}
.idpwSrh li .or {border-style:solid none solid solid;border-width:1px 0 1px 1px;border-color:#d8d8d8;background:#fbfbfb url("../../common/img/img_arrow01.gif") no-repeat left top}
.idpwSrh li .or h2 {margin-bottom:10px;font-size:22px;font-weight:900;color:#816950}
.idpwSrh li .br h2 {margin-bottom:10px;font-size:22px;font-weight:900;color:#816950}
.idpwSrh li .br {border-style:solid;border-width:1px;border-color:#d8d8d8;background:#fbfbfb url("../../common/img/img_arrow02.gif") no-repeat left top}
.idpwSrh li .srhBox .srhTop {text-align:center;font-size:13px}
.idpwSrh li .srhBox .info {margin-top:24px;padding-top:20px;border-top:1px dashed #d2d2d2}
.idpwSrh li .srhBox .info label {display:inline-block;width:83px;margin-right:12px;vertical-align:middle;font-weight:900;font-size:13px;color:#333333}
.idpwSrh li .srhBox .info p {margin-bottom:5px}
.idpwSrh li .srhBox .info p input {width:167px;height:21px;border:1px solid #d4d6d6}
.idpwSrh li .or button {display:block;width:145px;margin:26px auto 0;padding:7px 0;border:1px solid #6a5845;background-color:#82705e;font-family:'Malgun Gothic','맑은 고딕';color:#FFFFFF}
.idpwSrh li .br button {display:block;width:145px;margin:26px auto 0;padding:7px 0;border:1px solid #6a5845;background-color:#82705e;font-family:'Malgun Gothic','맑은 고딕';color:#FFFFFF}
</style>
</head>
<body>
	<div class="content">
		<h1>ID/비밀번호 찾기</h1>
		<div class="agree">
			<ul class="idpwSrh">
				<li>
					<div class="srhBox or">
						<div class="srhTop">
							<h2>ID찾기</h2>
							내정보에 등록한 정보로<br /> 아이디를 찾을 수 있습니다.
						</div>
						<div class="info">
							<form name="idForm" method="post" action="idSrh.jsp" onsubmit="return chk_idform(this)">
							<input type="hidden" name="MEM_ID" value=" " />
								<fieldset>
									<legend>id찾기 폼</legend>
									<p><label>이름</label> <input type="text" name="MEM_NAME" required=required placeholder="이름" title="이름 입력"/></p>
									<p><label>전화번호</label>
									   <input type="tel" name="tel" required="required" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx" title="전화번호 입력"/>
									</p>
									<p><label>이메일</label> <input type="text" name="MEM_EMAIL" required=required placeholder="메일" title="이메일 입력"/></p>
									<button type="submit">찾기</button>
								</fieldset>
							</form>
						</div>
					</div>
				</li>
				<li>
					<div class="srhBox br">
						<div class="srhTop">
							<h2>비밀번호 찾기</h2>
							내정보에 등록한 정보로<br /> 비밀번호를 찾을 수 있습니다.
						</div>
						<div class="info">
							<form name="pwForm" method="post" action="pwSrh.jsp" onsubmit="return chk_pwform(this)">
							<input type="hidden" name="MEM_PW" value="" />
								<fieldset>
									<legend>비밀번호 찾기 폼</legend>
									<p><label>ID</label> <input type="text" name="MEM_ID"  title="아이디 입력" placeholder="아이디" required=required/></p>
									<p><label>이름</label> <input type="text" name="MEM_NAME" title="이름 입력" placeholder="이름" required=required/></p>
									<p><label>이메일</label> <input type="text" name="MEM_EMAIL"  title= "이메일 입력" placeholder="메일"  required=required/></p>
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