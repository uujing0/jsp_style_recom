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

<%@include file="header.jsp" %> 
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
		
		$("#search").val(getParameterByName('search_word'))
		table.search($("#search").val()).draw() ;
	} );
	
	$(document).on("keyup", "#search", function(){
		table.search($(this).val()).draw() ;
	});
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
</script> 
<body>

	<div class="container">
		<div class="container-fluid">
			<table class="table"
				style="text-align: center; border: 4px; border-style: double; border-width: thick;">
				<tbody>
					<tr>
						<td colspan="5"
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">
							NOTICE</td>


					</tr>
					<tr>
						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">NO</th>

						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">SUBJECT</th>

						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">WRITER</th>

						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">DATE</th>
						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">HIT</th>

					</tr>
				</tbody>
				<tbody>
					<tr>
				<tbody>
					<c:forEach var="bbs1" items="${noticelist}">
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
	<div class="container">
		<div class="container-fluid">
			<table class="table"
				style="text-align: center; border: 4px; border-style: double; border-width: thick;">
				<tbody>
					<tr>
						<td colspan="6"
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">
							BEST 코디</td>


					</tr>
					<tr>
						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">NO</th>

						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">SUBJECT</th>

						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">WRITER</th>

						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">DATE</th>
						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">HIT</th>
						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">POSTER
							STAR</th>

					</tr>
				</tbody>
				<tbody>
					<c:forEach var="board1" items="${beststylelist}">
						<!-- DAO에 bbslist()함수를 호출하여 bbsList 생성 -->
						<tr>
							<td>${board1.bbsNO}
							<td><a href="view.do?bd_id=${board1.bd_id}">${board1.bd_title}<c:if
									test="${board1.commentCount>0}">
									<!-- bbslist에서 쿼리문으로 생성한 commentcount가 0보다 크면 제목 옆에 댓글 갯수 출력 -->
							　[${board1.commentCount}]
						</c:if><p>${board1.popup }</a> 
							<td>${board1.mem_id}
							<td>${board1.bd_date}
							<td>${board1.bd_readcount}
							<td><c:if test="${board1.staravg>0}">
									<!-- bbslist에서 쿼리문으로 생성한 commentcount가 0보다 크면 제목 옆에 댓글 갯수 출력 -->
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
	<div class="container">
		<div class="container-fluid">
			<table class="table" id="table"
				style="text-align: center; border: 4px; border-style: double; border-width: thick;">

				<thead>
					<tr>
						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">NO</th>

						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">SUBJECT</th>

						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">WRITER</th>

						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">DATE</th>
						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">HIT</th>
						<th
							style="background-color: #F17F42; color: white; text-align: center; font-style: italic; font-size: 15px;">POSTER
							STAR</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardgetList}">
						<!-- DAO에 bbslist()함수를 호출하여 bbsList 생성 -->
						<tr>
							<td>${board.bbsNO}
							<td><a href="view.do?bd_id=${board.bd_id}">${board.bd_title} <c:if test="${board.commentCount>0}">
									<!-- bbslist에서 쿼리문으로 생성한 commentcount가 0보다 크면 제목 옆에 댓글 갯수 출력 -->
							　[${board.commentCount}]
						</c:if><p>${board.popup }</a>
							<td>${board.mem_id}
							<td>${board.bd_date}
							<td>${board.bd_readcount}
							<td><c:if test="${board.staravg>0}">
									<!-- bbslist에서 쿼리문으로 생성한 commentcount가 0보다 크면 제목 옆에 댓글 갯수 출력 -->
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
				<a href="writeView.do" class="btn btn-warning pull-right">글쓰기</a>
			</c:if>
		<br>
		
		
		</div>
	</div>
	<script src="js/bootstrap.js"></script>
</body>
<%@include file="footer.jsp" %>
</html>