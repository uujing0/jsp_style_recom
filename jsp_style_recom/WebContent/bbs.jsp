<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "dao.YJ_BbsDAO" %>
<%@ page import = "dao.Board" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
	<!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->
	
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
	<!-- 스타일시트로 css폴더의 bootstrap.css파일 사용 -->


<!-- 데이터테이블 용 자바스크립트 추가 -->	


<title>게시판!!</title>

<%@include file="fixed/header.jsp" %> 
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script>

<script src="js/datatables.min.js"></script>

<script>
	//테이블이란 아이디를 가진 테이블에 페이징처리를 적용시키고 첫번째 열을 기준으로 정렬한다.
	$(document).ready(function() {
		table = $('#table').DataTable( {
			"order": [[ 2, "desc" ]]
		} );
		
		$("#searchdate").parent().hide();
		
		var searchBar = '<label> Search:<input type="search" class="form-control form-control-sm" id="search" placeholder="" aria-controls="table"> </label>';
		
		$('#table').parent().append(searchBar);
		
		$("#search").parent().css("float", "right");
	} );
	
	$(document).on("keyup", "#search", function(){
		table.search($(this).val()).draw() ;
	});
</script> 
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
			
			<a class="navbar-brand" href="bbs.do">웰시코디</a>
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
	<div clas="container">
		<div class="container-fluid">
			<table class="table" style="text-align:center; border: 4px; border-style:double; border-width: thick;">
	<tbody>
				<tr>
							   <td colspan="5" style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; " > NOTICE</td>
					
					
				</tr>
				<tr>
					<th style="background-color: #F17F42; color : white; text-align:center; font-style: italic;
							   font-size: 15px; ">NO</th>
							   
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">SUBJECT</th>
							   
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">WRITER</th>
							   
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px;">DATE</th>
							   <th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">HIT</th>
					
				</tr>
			</tbody>		
			<tbody>
				<tr>	<tbody>
				<c:forEach var="bbs1" items="${bbsList2}">
					<tr>
						<td>${bbs1.bbsNO}
						<td><a href="view.do?bd_id=${bbs1.bd_id}">&nbsp${bbs1.bd_title}</a>
						<c:if test="${bbs1.commentCount>0}">
							[${bbs1.commentCount}]
						</c:if>
						<td>${bbs1.mem_id}
						<td>${bbs1.bd_date}
						<td>${bbs1.bd_readcount}
					</tr>
				</c:forEach>	
			</tbody>
			</table>
			</div>
			</div>
			<div clas="container">
		<div class="container-fluid">
			<table class="table" style="text-align:center; border: 4px; border-style:double; border-width: thick;">
	<tbody>
				<tr>
							   <td colspan="6" style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; " > BEST 코디 </td>
					
					
				</tr>
				<tr>
					<th style="background-color: #F17F42; color : white; text-align:center; font-style: italic;
							   font-size: 15px; ">NO</th>
							   
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">SUBJECT</th>
							   
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">WRITER</th>
							   
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px;">DATE</th>
							   <th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">HIT</th>
							    <th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">POSTER STAR</th>
					
				</tr>
			</tbody>		
			<tbody>
				<c:forEach var="board1" items="${bbsList3}"> <!-- DAO에 bbslist()함수를 호출하여 bbsList 생성 -->
					<tr>
						<td>${board1.bbsNO}
						<td><a href="view.do?bd_id=${board1.bd_id}">${board1.bd_title}</a>
						<c:if test="${board1.commentCount>0}"> <!-- bbslist에서 쿼리문으로 생성한 commentcount가 0보다 크면 제목 옆에 댓글 갯수 출력 -->
							[${board1.commentCount}]
						</c:if>
						<td>${board1.mem_id}
						<td>${board1.bd_date}
						<td>${board1.bd_readcount}
						<td> <c:if test="${board1.staravg>0}"> <!-- bbslist에서 쿼리문으로 생성한 commentcount가 0보다 크면 제목 옆에 댓글 갯수 출력 -->
							<c:if test="${board1.staravg==1}">★</c:if>
									<c:if test="${board1.staravg==2}">★★</c:if>
									<c:if test="${board1.staravg==3}">★★★</c:if>
									<c:if test="${board1.staravg==4}">★★★★</c:if>
									<c:if test="${board1.staravg==5}">★★★★★</c:if>
									<c:if test="${board1.staravg==6}">★★★★★★</c:if>
									<c:if test="${board1.staravg==7}">★★★★★★★</c:if>
									<c:if test="${board1.staravg==8}">★★★★★★★★</c:if>
									<c:if test="${board1.staravg==9}">★★★★★★★★★</c:if>
									<c:if test="${board1.staravg==10}">★★★★★★★★★</c:if>
						</c:if></td>
					</tr>
				</c:forEach>
				
			</tbody>
			</table>
			</div>
			</div>
	<div clas="container">
		<div class="container-fluid">
			<table class="table" id="table" style="text-align:center; border: 4px; border-style:double; border-width: thick;">
			
			<thead>
				<tr>
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">NO</th>
							   
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">SUBJECT</th>
							   
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">WRITER</th>
							   
					<th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">DATE</th>
							   <th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">HIT</th>
							    <th style="background-color: #F17F42; color : white;text-align:center; font-style: italic;
							   font-size: 15px; ">POSTER STAR</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${bbsList}"> <!-- DAO에 bbslist()함수를 호출하여 bbsList 생성 -->
					<tr>
						<td>${board.bbsNO}
						<td><a href="view.do?bd_id=${board.bd_id}">${board.bd_title}</a>
						<c:if test="${board.commentCount>0}"> <!-- bbslist에서 쿼리문으로 생성한 commentcount가 0보다 크면 제목 옆에 댓글 갯수 출력 -->
							[${board.commentCount}]
						</c:if>
						<td>${board.mem_id}
						<td>${board.bd_date}
						<td>${board.bd_readcount}
						<td> <c:if test="${board.staravg>0}"> <!-- bbslist에서 쿼리문으로 생성한 commentcount가 0보다 크면 제목 옆에 댓글 갯수 출력 -->
							<c:if test="${board.staravg==1}">★</c:if>
									<c:if test="${board.staravg==2}">★★</c:if>
									<c:if test="${board.staravg==3}">★★★</c:if>
									<c:if test="${board.staravg==4}">★★★★</c:if>
									<c:if test="${board.staravg==5}">★★★★★</c:if>
									<c:if test="${board.staravg==6}">★★★★★★</c:if>
									<c:if test="${board.staravg==7}">★★★★★★★</c:if>
									<c:if test="${board.staravg==8}">★★★★★★★★</c:if>
									<c:if test="${board.staravg==9}">★★★★★★★★★</c:if>
									<c:if test="${board.staravg==10}">★★★★★★★★★</c:if>
						</c:if></td>
					</tr>
				</c:forEach>
				
			</tbody>
			
			</table>
			<c:if test="${mem_id != null}">
				<a href="writeView.do" class="btn btn-primary pull-right">글쓰기</a>
			</c:if>
		<br>
		
		
		</div>
	</div>
	<script src="js/bootstrap.js"></script>
</body>
<%@include file="common/footer.jsp" %>
</html>