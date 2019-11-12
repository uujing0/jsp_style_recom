<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->

<%@include file="header.jsp"%>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="ckeditor/ckeditor.js"></script>

<script>
	$(document).ready(function() {
		// Replace the <textarea id="editor1"> with a CKEditor
		// instance, using default configuration.
		//CK에디터 파일저장 URL 지정 및 추가 플러그인
		var editorConfig = {
			filebrowserUploadUrl : "FileController?type=image", //이미지만 업로드
			extraPlugins : 'uploadimage'
		};

		CKEDITOR.on('dialogDefinition', function(ev) {
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
	$(document).on("click", "#update", function() {
		var data = CKEDITOR.instances.editor1.getData();
		/* 		alert("data->" + data); */
		var findStr1 = "<img"; // <img이 있는지 찾아보기
		var findStr2 = " />"; // <img이 있는지 찾아보기
		var n = 0;
		n1 = data.indexOf(findStr1)
		n2 = data.indexOf(findStr2)
		/*  if (n1  != -1) {
		  alert("n1->" + n1);
		}	
		if (n2  != -1) {
			  alert("n2->" + n2);
			}	  */
		var data2 = data.substring(n1, n2 + 3);

		$("#bd_content").val(data);
		$("#bd_file_url").val(data2);/* 
					alert("data2->"+data2); */
		$(this).append("<input type='submit' id='request'/>");
		$("#request").trigger("click");
	});

	function noSpaceForm2(obj) {
		if (obj.value == " ") // 공백 체크
		{
			alert("해당 항목에는 공백을 사용할 수 없습니다.\n\n공백 제거됩니다.");
			obj.focus();
			obj.value = obj.value.replace(' ', ''); // 공백 제거
			return false;
		}
	}
</script>

<link rel="stylesheet" href="css/bootstrap.css">
<!-- 스타일시트로 css폴더의 bootstrap.css파일 사용 -->

<title>게시판!!</title>
</head>
<body>


	<div clas="container">
		<div class="container-fluid">
			<form method="post" id="update_form"
				action="updatePOST.do?bd_id=${board.bd_id}">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #aaaaaa; text-align: center;">게시판
								글 수정 양식</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" id="bd_title" name="bd_title" maxlength="50"
								value="${board.bd_title}" onkeyup="noSpaceForm2(this);"
								onchange="noSpaceForm2(this);" required="required"></td>
						</tr>
						<tr>
							<c:if test="${mem_id == 'admin'}">
								<td style="text-align: left;"">공지사항<input type="checkbox"
									class="btn btn-primary pull-left" name="bd_notice" value="1">
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
				<input type="hidden" name="bd_content" id="bd_content" /> <input
					type="hidden" name="bd_file_url" id="bd_file_url" /> <input
					type="button" id="update" class="btn btn-primary pull-right"
					value="글수정">
			</form>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>