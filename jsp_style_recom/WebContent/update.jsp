<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
	<!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->
	
<%@include file="header.jsp" %> 
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="ckeditor/ckeditor.js"></script>

<script>
	$(document).ready(function(){
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        //CK에디터 파일저장 URL 지정 및 추가 플러그인
        var editorConfig = {
			filebrowserUploadUrl : "FileController?type=image", //이미지만 업로드
			extraPlugins : 'uploadimage'
		};
        
        
		CKEDITOR.on('dialogDefinition', function( ev ){
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;
        
			switch (dialogName) {
				case 'image': //Image Properties dialog
				//dialogDefinition.removeContents('info');
				dialogDefinition.removeContents('Link');
				dialogDefinition.removeContents('advanced');
				break;
			}
		});
        
		//editor1란 아이디를 가진 태그에 CK에디터 기능 추가
		ck = CKEDITOR.replace("editor1", editorConfig);
		
	});
	
	//업데이트 버튼을 누르면 CK에디터 기능을 추가한 태그에 적힌 내용들이 전부 data란 변수에 담김
	//그리고 그 내용을 숨겨진 input태그에 저장하고 요청을 보낸다.
	$(document).on("click", "#update", function(){
		var data = CKEDITOR.instances.editor1.getData();
		console.log(data);
		
		$("#bd_content").val(data);
		$(this).append("<input type='submit' id='request'/>");
		$("#request").trigger("click");
	});
	

	 function noSpaceForm2(obj) 
    {                        
        if(obj.value == " ") // 공백 체크
        {              
            alert("해당 항목에는 공백을 사용할 수 없습니다.\n\n공백 제거됩니다.");
            obj.focus();
            obj.value = obj.value.replace(' ','');  // 공백 제거
            return false;
        }
    }

</script>
	
<link rel="stylesheet" href="css/bootstrap.css">
	<!-- 스타일시트로 css폴더의 bootstrap.css파일 사용 -->
	
<title>게시판!!</title>
</head>
<body>


	<nav class="navbar navbar-inverse"> <!-- navbar-색상(inverse = 검은색, default 22222= 색x) -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<!-- class="navbar-toggle collapsed"=>네비게이션의 화면 출력유무 
				data-toggle="collapse" : 모바일 상태에서 클릭하면서 메뉴가 나오게 설정 -->
			
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
					<!-- 아이콘 이미지 -->
				
			</button>
			
			<a class="navbar-brand" href="bbs.do">JSP 게시판</a>
				<!-- Bootstrap navbar 기본 메뉴바 -->
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav"> <!-- navbar-nav => 네비게이션 바의 메뉴 -->
				<li><a href="main.do">메인</a></li>
				<li class="active"><a href="bbs.do">게시판</a></li>
				<!-- 메뉴, 게시판의 main.jsp와 bbs.jsp의 파일로 각각 이동 -->
			</ul>
	
							<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
							<!-- 임시의 주소링크 "#"을 기재한다. -->
							<!-- caret = creates a caret arrow icon (▼) -->
					
						<ul class="dropdown-menu">
							<!-- dropdown-menu : 버튼을 눌렀을때, 생성되는 메뉴(접속하기를 눌렀을때 로그인, 회원가입 메뉴 -->
					
							<li><a href="logout.do">로그아웃</a></li>
						</ul>
					</li>	
			</ul>	

		</div>
	</nav>
	<!--  <img alt="그림 없음" src="Circle.png">
	<img src="JJWORLD.png"> 
	-->
	
	
	<div clas="container">
		<div class="container-fluid">
		<form method = "post" id="update_form" action="updatePOST.do?bd_id=${board.bd_id}">
		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #aaaaaa; text-align:center;">게시판 글 수정 양식</th>
				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목" id="bd_title" name="bd_title" maxlength="50"
								value = "${board.bd_title}" onkeyup="noSpaceForm2(this);" onchange="noSpaceForm2(this);"required="required"></td>
				</tr>	
				<tr>
							<c:if test="${mem_id == 'admin'}"> 
						<td style="text-align:left;"">　공지사항<input type="checkbox" class="btn btn-primary pull-left" name="bd_notice" value="1">
						</td>
						</c:if>
						
					<c:if test="${mem_id != admin}"> 
					<td></td>
					</c:if>
						</tr>
				<!-- <tr>
					<td><input type="file" class="form-control" placeholder="파일 첨부" id="bbsfile" name="bbsfile" maxlength="50"></td>
					<td><input type="hidden" name="oldFile" value = "${bbs.BBSFILE}"></td>
				</tr>  -->	

				<!-- input = 특정한 정보를 action페이지로 보내도록, textarea = 장문의 글 작성할때, -->
			</tbody>
			
			<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄 -->
			</table>
			<div>
				<textarea name="editor1" id="editor1" rows="10" cols="80">
					${board.bd_content}
				</textarea>
			</div>
			<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄 -->
			<input type="hidden" name="bd_content" id="bd_content"/>
			<input type="button" id="update" class="btn btn-primary pull-right" value="글수정">
		</form>
			
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>