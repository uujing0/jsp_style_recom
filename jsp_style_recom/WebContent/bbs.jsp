<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.YJ_BbsDAO"%>
<%@ page import="dao.Board"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->




<title>웰시코디</title>

<%@include file="header.jsp"%>

<link rel="stylesheet" href="css/bootstrap.css"> <!-- 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  -->
<!-- 스타일시트로 css폴더의 bootstrap.css파일 사용 -->
	
<link rel="stylesheet" href="css/customDetail_btn.css">
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script>

<script src="js/datatables.min.js"></script>

<!-- 데이터테이블 용 자바스크립트 추가 -->
<script>
	//테이블이란 아이디를 가진 테이블에 페이징처리를 적용시키고 첫번째 열을 기준으로 정렬한다.
	$(document).ready(function() {
		table = $('#table').DataTable( { //데이타테이블 api를 #table에 적용
			"order": [[ 3, "desc" ]] // 게시글을 3번째부터 내림차순으로 정렬
		} );
		
		$("#searchdate").parent().hide(); //search의 부모를 숨김
		
		var searchBar = '<label> Search:<input type="search" class="form-control form-control-sm" id="search" placeholder="" aria-controls="table"> </label>';
		//searchbar 테이블 생성
		$('#table').parent().append(searchBar); //테이블의 부모에 searchbar 등록
		
		$("#search").parent().css("float", "right"); //search를 오른쪽으로 정렬
	} );
	
	$(document).on("keyup", "#search", function(){
		table.search($(this).val()).draw() ;//search 함수 사용
	});
</script> <p>
<style>
  body {background-color: #f9f7f6;}
</style>
<body>

	<div class="container"> <!-- div 클래스 생성 아래쪽까지 공지사항 테이블 생성 -->
		<div class="container-fluid">
			<table class="table"
				style="text-align: center; border: 4px; border-style: solid; border-width: thin;
				 ">
				<tbody>
					<tr>
						<td colspan="5"
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">
							공 지</td>


					</tr>
					<tr>
						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">번호</th>

						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">제목</th>

						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">작성자</th>

						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">날짜</th>
						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">조회수</th>

					</tr>
				</tbody>
				<tbody>
					<tr>
				<tbody>
					<c:forEach var="bbs1" items="${noticelist}"><!-- dao에서 공지사항 리스트를 가져옴  -->
						<tr>
							<td>${bbs1.bbsNO}<!-- 게시글의 번호 출력 -->
							<td><a href="view.do?bd_id=${bbs1.bd_id}">&nbsp${bbs1.bd_title}</a> <!--게시글을 누르면 bd_id별로 view가 출력되게 링크, 제목 출력  -->
								<c:if test="${bbs1.commentCount>0}"><!-- 게시글 댓글이 1개 이상이면 댓글 갯수 출력 -->
							[${bbs1.commentCount}]
						</c:if>
							<td>${bbs1.mem_id} <!-- 게시글 쓴사람의 ID 출력 -->
							<td>${bbs1.bd_date} <!-- 게시글의 날짜 출력 -->
							<td>${bbs1.bd_readcount} <!-- 게시글의 조회수 출력 -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container"> <!-- 베스트 마이스타일 테이블 생성  -->
		<div class="container-fluid">
			<table class="table" id = "table2"
				style="text-align: center; border: 4px; border-style: solid; border-width: thin;">
				<tbody>
					<tr>
						<td colspan="6"
							style="background-color: #373B43; color: white; text-align: center;  font-size: 15px;">
							베스트 스타일</td>


					</tr>
					<tr>
						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">번호</th>

						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">제목</th>

						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">작성자</th>

						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">날짜</th>
						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">조회수</th>
						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">별점</th>

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
									<!-- bbslist에서 쿼리문으로 생성한 commentcount가 0보다 크면 제목 옆에 댓글 갯수 출력 -->
	
						</c:if><p>${board1.popup }</a> <!-- 게시글의 사진 미리보기 기능  -->
							<td>${board1.mem_id}
							<td>${board1.bd_date}
							<td>${board1.bd_readcount}
							<td><c:if test="${board1.staravg>0}"> 	 <!-- 게시글의 별점 평균이 0보다 크면 1일떄 ★1개 순으로 10개까지 출력 -->						<font color = olive> 	<c:if test="${board1.staravg==1}">★</c:if> </font>
									<font color = olive> <c:if test="${board1.staravg==2}">★★</c:if></font>
								<font color = olive> 	<c:if test="${board1.staravg==3}">★★★</c:if> </font>
								<font color = olive> 	<c:if test="${board1.staravg==4}">★★★★</c:if> </font>
									<font color = olive> <c:if test="${board1.staravg==5}">★★★★★</c:if> </font>
								<font color = olive> 	<c:if test="${board1.staravg==6}">★★★★★★</c:if> </font>
									<font color = olive> <c:if test="${board1.staravg==7}">★★★★★★★</c:if> </font>
								<font color = olive> 	<c:if test="${board1.staravg==8}">★★★★★★★★</c:if> </font>
							<font color = olive> 		<c:if test="${board1.staravg==9}">★★★★★★★★★</c:if> </font>
								<font color = olive> 	<c:if test="${board1.staravg==10}">★★★★★★★★★</c:if> </font>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container"> <!-- 코기 코디 테이블 생성 -->
		<div class="container-fluid">
			<table class="table" id="table"
				style="text-align: center; border: 4px; border-style: solid; border-width: thin;">
			
				<thead>
				<tr>
						<td colspan="6"
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">
							웰시 코디!</td>


					</tr>
					<tr>
						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">번호</th>

						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">제목</th>

						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">작성자</th>

						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">날짜</th>
						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">조회수</th>
						<th
							style="background-color: #F3F1F0; color: black; text-align: center;  font-size: 15px;">별점</th>

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
									<font color = olive><c:if test="${board.staravg==1}">★</c:if> </font>
							<font color = olive>		<c:if test="${board.staravg==2}">★★</c:if> </font>
								<font color = olive>	<c:if test="${board.staravg==3}">★★★</c:if> </font>
								<font color = olive>	<c:if test="${board.staravg==4}">★★★★</c:if> </font>
								<font color = olive>	<c:if test="${board.staravg==5}">★★★★★</c:if> </font>
								<font color = olive>	<c:if test="${board.staravg==6}">★★★★★★</c:if> </font>
								<font color = olive>	<c:if test="${board.staravg==7}">★★★★★★★</c:if> </font>
								<font color = olive>	<c:if test="${board.staravg==8}">★★★★★★★★</c:if> </font>
							<font color = olive>		<c:if test="${board.staravg==9}">★★★★★★★★★</c:if> </font>
								<font color = olive>	<c:if test="${board.staravg==10}">★★★★★★★★★</c:if> </font>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${mem_id != null}"> <!-- 멤버아이이디가 널이 아니라면 글쓰기 버튼 활성화 -->
				<a href="writeView.do" class="btn btn-default pull-right">글쓰기</a>
			</c:if>
			<br>


		</div>
	</div>
	<script src="js/bootstrap.js"></script>
</body>
<%@include file="footer.jsp"%>
</html>