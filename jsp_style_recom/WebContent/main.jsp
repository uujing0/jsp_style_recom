<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#hot_tag_list{
		position:fixed;
		float: right;
		border: 2px solid;
		right: 10px;
		top: 200px;
		
	}
	#hot_tag_list a:link{text-decoration: none; color: black;} 
	#hot_tag_list a:active{text-decoration: none; color: black;}
	#hot_tag_list a:visited{text-decoration: none; color: black;}
	#hot_tag_list a:hover{text-decoration: none; color: black;}

	#nav { position : fixed; top: 150px; font-family:'arial'; }
	#nav ul{ width:200px; margin:0; padding:0; }
	#nav ul.menu li{ position:relative; float:left; width:200px; list-style-type:none; font-size:20px;  }
	#nav ul.menu li a{ display:block; width:200px; height:100%; line-height:100px; text-indent:20px; color:#000; font-weight:bold; text-decoration:none; }
	#nav ul.menu li a:hover{ background:#eee; }
	#nav ul.menu li .sub a{ position:relative; float:left; display:block; width:200px; z-index:999; background:#ccc; }
	#nav ul.menu li .sub a:hover{ background:#444;  color:#fff; }

	*{
        margin: 0; padding: 0;
      }
      .slide{
        
        width: 1000px;
        height: 600px;
        overflow: hidden;
        position: relative;
        margin: 0 auto;
      }
      .slide ul{
        width: 5000px;
        position: absolute;
        top:0;
        left:0;
        font-size: 0;
      }
      .slide ul li{
        display: inline-block;
      }
      #back{
        position: absolute;
        top: 250px;
        left: 0;
        cursor: pointer;
        z-index: 1;
      }
      #next{
        position: absolute;
        top: 250px;
        right: 0;
        cursor: pointer;
        z-index: 1;
      }
		#wrap {
		
            width: 800px;
            margin: 0 auto 0 auto;
            
        }
        #topForm{
            text-align :right;
        }
        #board{
        	position:relative;
            top: 90px;
            left: 29%;
            
        } 
        
        #pageForm, #searchForm{
            text-align :center;
        }
        
        #bList{
            text-align :center;
        }

</style>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("nomal");
			});
	
		var images;
	    var img_count;
	    var img_position = 1;

	      images = $(".slide ul");
	      img_count = images.children().length;

	      //버튼을 클릭했을 때 함수 실행
	      $('#back').click(function () {
	        back();
	      });
	      $('#next').click(function () {
	        next();
	      });

	      function back() {
	        if(1<img_position){
	          images.animate({
	            left:'+=1000px'
	          });
	          img_position--;
	        }
	      }
	      function next() {
	        if(img_count>img_position){
	          images.animate({
	            left:'-=1000px'
	          });
	          img_position++;
	        }
	      }	
	      
	});
	
</script>

</head>

<%@include file="header.jsp" %>
<body>
	
<div>
	<div id="nav" >
		<ul class="menu">
			<li><a href="#">날씨별</a></li>
			<li><a href="#">상황별</a>
				<ul class="sub">
					<li><a href="#">오피스룩</a></li>
					<li><a href="#">하객/셀럽룩</a></li>
					<li><a href="#">캠퍼스/개강룩</a></li>
					<li><a href="#">집근처마실룩</a></li>
					<li><a href="#">피크닉룩</a></li>
				</ul>
			</li>
			<li><a href="#">체형별</a>
				<ul class="sub">
					<li><a href="#">통통</a></li>
					<li><a href="#">슬림</a></li>
					<li><a href="#">키작은</a></li>
					<li><a href="#">키큰</a></li>
				</ul>
			</li>
			<li><a href="#">분위기별</a>
				<ul class="sub">
					<li><a href="#">모던시크</a></li>
					<li><a href="#">상큼발랄</a></li>
					<li><a href="#">심플/베이직</a></li>
					<li><a href="#">럭셔리</a></li>
					<li><a href="#">러블리</a></li>					
				</ul>
			</li>
			<li><a href="#">태그별</a>
				<ul class="sub">
					<li><a href="#">SUB MENU 3-1s</a></li>
					<li><a href="#">SUB MENU 3-2</a></li>
					<li><a href="#">SUB MENU 3-3</a></li>
				</ul>
			</li>
		</ul>
	</div>
 	<div class="slide">
      <img id="back" src="images/back.png" alt="" width="50">
      <ul>
        <li><img src="images/name1.jpg" alt="" width="1000" height="600"></li>
        <li><img src="images/name2.jpg" alt="" width="1000" height="600"></li>
        <li><img src="images/name3.jpg" alt="" width="1000" height="600"></li>
        <li><img src="images/name4.jpg" alt="" width="1000" height="600"></li>
        <li><img src="images/name5.jpg" alt="" width="1000" height="600"></li>
      </ul>
      <img id="next" src="images/next.png" alt="" width="50">
    </div>
	<p>
    <div id="board">
        <table style="font:bold;" id="bList" width="800" border="3" bordercolor="lightgray" >
            <tr heigh="30">
                <td width="50">글번호</td>
                <td width="550">제목</td>
                <td width="50">작성자</td>
                <td width="100">작성일</td>
                <td width="50">조회수</td>
            </tr>
        <c:forEach var="board" items="${bbsList}">
            <tr>
                <td>${board.bbsNO}</td>
                <td>
                    <a href="view.do?bd_id=${board.bd_id}">
                    ${board.bd_title}
                    </a>
                </td>
                <td>${board.mem_id}</td>
                <td>${board.bd_date}</td>
                <td>${board.bd_readcount}</td>
            </tr>
        </c:forEach>
        </table>
    </div>

	<div id="hot_tag_list">
		<span >@인기검색어@</span>
		<ol>
			<c:forEach var="list" items="${tagList }">
				<li><a href="search.do?search_word=${list }&search_target=0">${list }</a></li>
			</c:forEach>
		</ol>
	</div>
</div>	
</body>
<%@include file="footer.jsp" %>
</html>