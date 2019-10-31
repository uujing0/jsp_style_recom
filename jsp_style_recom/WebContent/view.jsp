<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
	<!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->
	
<link rel="stylesheet" href="css/bootstrap.css">
	<!-- 스타일시트로 css폴더의 bootstrap.css파일 사용 -->
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/star.css">

<%@include file="fixed/header.jsp" %> 
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>
	$(document).ready(function(){
		
		$("#write_comment").click(function(){
			var content = $("#content").val();
			var mem_id = "${mem_id}";
			var bd_id = "${board.bd_id}";
			var cm_date="${boardcomment.cm_date}";
			var star = new Array();
			$("input:radio[name='star']").each(function(){
				if($(this).is(":checked") == true){
					star.push($(this).val());
				}
			});//이건 별점 라디오 체크박스 입력받는 부분

			
			$.ajax({
				url: "writeComment.do?content="+content+"&&mem_id="+mem_id+"&&bd_id="+bd_id+"&&cm_date="+cm_date+"&&star="+star,
				type: "POST",
				success : function(data){
	 				location.reload();
				}
			});
		});
		
		$('button[name="comment_delete"]').click(function(){
			var cm_id = $(this).attr("id");
			$.ajax({
				url: "deleteComment.do?cm_id="+cm_id,
				type: "POST",
				success : function(data){
					location.reload();
				}
			});
		});
	});
</script>

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

			<c:if test="${mem_id == null}">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">접속하기<span class="caret"></span></a>
								<!-- 임시의 주소링크 "#"을 기재한다. -->
								<!-- caret = creates a caret arrow icon (▼) -->
						
							<ul class="dropdown-menu">
								<!-- dropdown-menu : 버튼을 눌렀을때, 생성되는 메뉴(접속하기를 눌렀을때 로그인, 회원가입 메뉴 -->
						
								<li><a href="login.do">로그인</a></li>
								<li><a href="join.do">회원가입</a></li>
							</ul>
						</li>	
				</ul>
			</c:if>
			
			<c:if test="${mem_id != null}">
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
			</c:if>		
		</div>
	</nav>
	<!--  <img alt="그림 없음" src="Circle.png">
	<img src="JJWORLD.png"> 
	-->
	
	
	<div clas="container">
		<div class="container-fluid">
		<table class="table" style="text-align:center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #F17F42; text-align:center;">웰시 코디</th>
				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style = "width: 20%;">글 제목</td>
					<td colspan="1"> ${board.bd_title}</td>
					<td></td>
				</tr>
				
				<tr>
					<td>작성자</td>
					<td colspan="1"> ${board.mem_id}</td>
					<td></td>
				</tr>			
				
				<tr>
					<td>작성일</td>
					<td colspan="1">
					${board.bd_date}
					<td>조회수 : ${board.bd_readcount} </td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="1" style="min-height: 200px;">
					 ${board.bd_content}
					 </td>
					 <td></td>
				</tr>
							
				<tr>
					<td>댓글</td>
					<c:if test="${mem_id != null}">
						<td>점수 : 
								<input type="radio" value="1" name="star" >★&nbsp;&nbsp;&nbsp;
								<input type="radio" value="2" name="star" >★★&nbsp;&nbsp;&nbsp;
								<input type="radio" value="3" name="star" >★★★&nbsp;&nbsp;&nbsp;
								<input type="radio" value="4" name="star" >★★★★&nbsp;&nbsp;&nbsp;
								<input type="radio" value="5" name="star" checked="checked">★★★★★
							<br><br><input type="text" id="content" name="content"/>
							<button id="write_comment" class="btn btn-warning btn-sm">댓글작성</button>
						</td>
						<td></td>
					</c:if>
					<c:if test="${mem_id == null}">
						<td></td>
					</c:if>
				</tr>
				<c:forEach var="comment" items="${comments}">
						<tr>
							<td>
								<c:forEach begin="1" end="${comment.star}">
								★
								</c:forEach>
							</td>
							<td>
								　　${comment.cm_contents}
								<c:if test="${mem_id == comment.mem_id}">
									<button name="comment_delete" id="${comment.cm_id}" class="btn btn-warning btn-sm">댓글삭제</button> 					
								</c:if>
								</td>
								<td>　　　　　작성자 : ${comment.mem_id}　<br>　　　　　　　　　　　　　작성일 : ${comment.cm_date }</td>
							
						</tr>
				
				</c:forEach>
			</tbody>
			<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄 -->
			</table>
			
			<a href="bbs.do" class="btn btn-warning"">목록</a>
			<c:if test="${mem_id != null && mem_id == board.mem_id}">
				<a href="update.do?bd_id=${board.bd_id}" class="btn btn-warning">수정</a>
				<a onclick ="return confirm('정말로 삭제하시겠습니까?')" href="delete.do?bd_id=${board.bd_id}" class="btn btn-warning"">삭제</a>
			</c:if>
			
			<c:if test="${mem_id != null}">
				<a href="writeView.do" class="btn btn-warning" pull-right">글쓰기</a>
				<!-- <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> -->
			</c:if>
			
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>