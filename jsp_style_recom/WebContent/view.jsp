<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->

<link rel="stylesheet" href="css/bootstrap.css">
<!-- 스타일시트로 css폴더의 bootstrap.css파일 사용 -->
<link rel="stylesheet" href="css/customDetail_btn.css">
<link rel="stylesheet" href="css/starDetail_btn.css">

<%@include file="header.jsp"%>
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
		
		
	
	$('button[name="comment_update"]').click(function(){
			var cm_id = $(this).attr("id");
			var content2 = $("#content2").val();
			var star = new Array();
			$("input:radio[name='star']").each(function(){
				if($(this).is(":checked") == true){
					star.push($(this).val());
				}
			});
			//이건 별점 라디오 체크박스 입력받는 부분

			
			 $.ajax({
			url: "commentupdate.do?content2="+content2+"&&cm_id="+cm_id+"&&star="+star,
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

<title>웰시코디</title>
</head>
<style>
.star-rating {
	font-size: 0;
	white-space: nowrap;
	display: inline-block;
	width: 500px;
	height: 50px;
	overflow: hidden;
	position: relative;
	background:
		url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjREREREREIiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
	background-size: contain;
}

.star-rating i {
	opacity: 0;
	position: absolute;
	left: 0;
	top: 0;
	height: 100%;
	width: 10%;
	z-index: 1;
	background:
		url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjRkZERjg4IiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
	background-size: contain;
}

.star-rating input {
	-moz-appearance: none;
	-webkit-appearance: none;
	opacity: 0;
	display: inline-block;
	width: 10%;
	height: 100%;
	margin: 0;
	padding: 0;
	z-index: 2;
	position: relative;
}

.star-rating input:hover+i, .star-rating input:checked+i {
	opacity: 1;
}

.star-rating i ~ i {
	width: 20%;
}

.star-rating i ~ i ~ i {
	width: 30%;
}

.star-rating i ~ i ~ i ~ i {
	width: 40%;
}

.star-rating i ~ i ~ i ~ i ~ i {
	width: 50%;
}

.star-rating i ~ i ~ i ~ i ~ i ~ i {
	width: 60%;
}

.star-rating i ~ i ~ i ~ i ~ i ~ i ~ i {
	width: 70%;
}

.star-rating i ~ i ~ i ~ i ~ i ~ i ~ i ~ i {
	width: 80%;
}

.star-rating i ~ i ~ i ~ i ~ i ~ i ~ i ~ i ~ i {
	width: 90%;
}

.star-rating i ~ i ~ i ~ i ~ i ~ i ~ i ~ i ~ i ~ i {
	width: 100%;
}

::after, ::before {
	height: 100%;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	text-align: center;
	vertical-align: middle;
}
</style>
<body>
	


	<div clas="container">
		<div class="container-fluid">
			<table class="table"
				style="text-align: left; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #E55151; text-align: center; color: white;">웰시 코디</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="1">${board.bd_title}</td>
						<td></td>
					</tr>

					<tr>
						<td>작성자</td>
						<td colspan="1">${board.mem_id}</td>

						<td>별점평균:<c:if test="${board.staravg==1}">★</c:if> <c:if
								test="${board.staravg==2}">★★</c:if> <c:if
								test="${board.staravg==3}">★★★</c:if> <c:if
								test="${board.staravg==4}">★★★★</c:if> <c:if
								test="${board.staravg==5}">★★★★★</c:if> <c:if
								test="${board.staravg==6}">★★★★★★</c:if> <c:if
								test="${board.staravg==7}">★★★★★★★</c:if> <c:if
								test="${board.staravg==8}">★★★★★★★★</c:if> <c:if
								test="${board.staravg==9}">★★★★★★★★★</c:if> <c:if
								test="${board.staravg==10}">★★★★★★★★★</c:if>


						</td>
					</tr>

					<tr>
						<td>작성일</td>
						<td colspan="1">${board.bd_date}
						<td>조회수 : ${board.bd_readcount}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="1" style="min-height: 200px;">
							${board.bd_content}</td>
						<td></td>
					</tr>

					<tr>
						<td>댓글</td>
						<c:if test="${mem_id != null}">
							<td>별점 주기 : <span class="star-rating"> <input
									type="radio" name="star" value="1"><i></i> <input
									type="radio" name="star" value="2"><i></i> <input
									type="radio" name="star" value="3"><i></i> <input
									type="radio" name="star" value="4"><i></i> <input
									type="radio" name="star" value="5"><i></i> <input
									type="radio" name="star" value="6"><i></i> <input
									type="radio" name="star" value="7"><i></i> <input
									type="radio" name="star" value="8"><i></i> <input
									type="radio" name="star" value="9"><i></i> <input
									type="radio" name="star" value="10"><i></i>
							</span> 
								<br> <br> <input type="text" id="content"
								name="content" />
								<button id="write_comment" class="btn btn-danger btn-sm">댓글작성</button>
							　　<input type="text" id="content2"
								name="content2" />[댓글수정]</td>
							<td></td>
						</c:if>
						<c:if test="${mem_id == null}">
							<td></td>
							<td></td>
							<td></td>
						</c:if>
					</tr>
						<td></td><td></td><td></td>
								
					<c:forEach var="comment" items="${comments}">
						<tr>
							<td style="text-align: left";><c:forEach begin="1"
									end="${comment.star}">
								★
								</c:forEach></td>
							<td style="text-align: left";>${comment.cm_contents}<br>
							<P>
									<b>${comment.mem_id}</b> <br> ${comment.cm_date }</td>
							<td><c:if test="${mem_id == comment.mem_id}">
									<c:if test="${comments==comments }">
								
								</c:if>
									<button name="comment_update" id="${comment.cm_id }" class="btn btn-danger btn-sm">댓글수정</button>
									<button name="comment_delete" id="${comment.cm_id}"
										class="btn btn-danger btn-sm">댓글삭제</button>
										
								</c:if></td>

						</tr>

					</c:forEach>
				</tbody>
				<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄 -->
			</table>

			<a href="bbs.do" class="btn btn-danger"">목록</a>
			<c:if test="${mem_id != null && mem_id == board.mem_id || mem_id == 'admin'}">
				<a href="update.do?bd_id=${board.bd_id}" class="btn btn-danger">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"
					href="delete.do?bd_id=${board.bd_id}" class="btn btn-danger"">삭제</a>
			</c:if>

			<c:if test="${mem_id != null}">
				<a href="writeView.do" class="btn btn-danger"pull-right">글쓰기</a>
				<!-- <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> -->
			</c:if>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>