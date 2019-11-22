<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WELL-SEE COORDI</title>
<style type="text/css">


	#nav {  margin-top:50px; font-family:'arial'; }
	#nav ul{ width:200px; margin:0; padding:0; }
	#nav ul.menu li{ position:relative; float:left; width:200px; list-style-type:none; font-size:20px; margin-bottom: 5px; }
	#nav ul.menu li a{ display:block; width:200px; height:100%; line-height:100px; text-indent:20px; color:#f3f1f0; font-weight:bold; text-decoration:none; background:#373b43;  }
	#nav ul.menu li a:hover{ background:#e55151; }
	#nav ul.menu li .sub a{ position:relative; float:right; display:block; width:180px; z-index:999; background:#f3f1f0; color:#373b43; height: 80px; line-height: 80px;}
	#nav ul.menu li .sub a:hover{ background:#e55151;  color:#373b43; }

      .slide{
        top: 50px;
        width: 1160px;
        height: 740px;
        overflow: hidden;
        position: relative;
        margin-left: 325px;
        padding: 0 auto;
      }
      .slide ul{
        width: 2320px;
        position: absolute;
        top:0;
        left:0;
        font-size: 0;
        padding: 0;
      }
      .slide ul li{
        display: inline-block;
        padding: 0;
      }
      
      .slideimg { 
      	display: inline-block;
   		position: relative;
  		overflow: hidden; 
   		height: 740px; 
   		width: 580px; 
	 } 

	  .slideimg img { 
   		position: absolute;
   		top: 0; 
   		left: 0; 
   		right: 0; 
  		 bottom: 0; 
   		width: 100%; 
   		height: auto;
	 } 
      
      #back{
        position: absolute;
        top: 370px;
        left: 0;
        cursor: pointer;
        z-index: 1;
        margin: 0 auto;
        padding: 0 auto;
      }
      #next{
        position: absolute;
        top: 370px;
        right: 0;
        cursor: pointer;
        z-index: 1;
        margin: 0 auto;
        padding: 0 auto;
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
            top: 50px;
            font-family: "나눔고딕",sans-serif;
			width: 500px;
			left: 250px;
            right: 250px;
           
           
        } 
        
        
        #bList{
        	margin-bottom:20%;
            float: left; 
        }
		#bdcontent {
			border: 1px solid #4c4c4c;
	 		border-top: 3px solid #4c4c4c;
	 		padding: 20px;
	 		background: #e3e3e3;
	 		
		}
		#bdcontent a:link{color: black; text-decoration: none; font-family: "나눔고딕",sans-serif;}
		#bdcontent a:visited{color: black; text-decoration: none; font-family: "나눔고딕",sans-serif; }
		#bdcontent a:hover{color: black; text-decoration: none; font-family: "나눔고딕",sans-serif;}
		#bdcontent a:active{color: black; text-decoration: none; font-family: "나눔고딕",sans-serif;}
		
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
	            left:'+=580px'
	          });
	          img_position--;
	        }
	      }
	      function next() {
	        if(img_count>img_position){
	          images.animate({
	            left:'-=580px'
	          });
	          img_position++;
	        }
	      }	
	      
	});
	
	$(window).load(function() {
		   /* 이미지 비율에 맞게 크롭*/
		   var divs = document.querySelectorAll('.slideimg');

		   for (var i = 0; i < divs.length; ++i) {
		       var div = divs[i];
		       var divAspect = div.offsetHeight / div.offsetWidth;
		       div.style.overflow = 'hidden';
		       
		       var img = div.querySelector('img');
		       var imgAspect = img.height / img.width;
		   
		       if (imgAspect <= divAspect) {
		         // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
		         var imgWidthActual = div.offsetHeight / imgAspect;
		         var imgWidthToBe = div.offsetHeight / divAspect;
		         var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
		         img.style.cssText = 'width: auto; height: 100%; margin-left: '
		                         + marginLeft + 'px;'
		       } else {
		         // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
		         img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
		       }
		   } 
		})
</script>

</head>

<%@include file="header.jsp" %>
<body bgcolor="#f9f7f6">
	
	<div id="nav" >
		<ul class="menu">
			<li><a href="styleList.do?tagType=4&locCode=${sessionScope.loc }">날씨별</a></li>
			<li><a href="#">상황별</a>
				<ul class="sub">
					<li><a href="styleList.do?tagId=1">오피스룩</a></li>
					<li><a href="styleList.do?tagId=2">하객/셀럽룩</a></li>
					<li><a href="styleList.do?tagId=3">캠퍼스/개강룩</a></li>
					<li><a href="styleList.do?tagId=4">집근처마실룩</a></li>
					<li><a href="styleList.do?tagId=5">피크닉룩</a></li>
				</ul>
			</li>
			<li><a href="#">체형별</a>
				<ul class="sub">
					<li><a href="styleList.do?tagId=6">통통</a></li>
					<li><a href="styleList.do?tagId=7">슬림</a></li>
					<li><a href="styleList.do?tagId=8">키작은</a></li>
					<li><a href="styleList.do?tagId=9">키큰</a></li>
				</ul>
			</li>
			<li><a href="#">분위기별</a>
				<ul class="sub">
					<li><a href="styleList.do?tagId=10">모던시크</a></li>
					<li><a href="styleList.do?tagId=11">상큼발랄</a></li>
					<li><a href="styleList.do?tagId=12">심플/베이직</a></li>
					<li><a href="styleList.do?tagId=13">럭셔리</a></li>
					<li><a href="styleList.do?tagId=14">러블리</a></li>					
				</ul>
			</li>
			
		</ul>
	</div>
	
	
 	<div class="slide">
      <img id="back" src="images/back.jpg" alt="" width="50">
      <ul>
        <li><div class="slideimg">
        		<a href="styleDetail.do?stl_id=${stl_id0}&onoff=0">
        			<img src="./images/category_images/${msi0 }">
        		</a>
        	</div>
        	<div class="slideimg">
        		<a href="styleDetail.do?stl_id=${stl_id1}&onoff=0">
        			<img src="./images/category_images/${msi1 }">
        		</a>
        	</div>
        </li>
      
        <li><div class="slideimg">
        		<a href="styleDetail.do?stl_id=${stl_id2}&onoff=0">
        			<img src="./images/category_images/${msi2 }">
        		</a>
        	</div>
        	<div class="slideimg">
        		<a href="styleDetail.do?stl_id=${stl_id3}&onoff=0">
        			<img src="./images/category_images/${msi3 }">
        		</a>
        	</div>
        </li>
      <li></li>
 	  </ul>
      <img id="next" src="images/next.jpg" alt="" width="50">
    </div>
   
    
    
	<p>
    <div id="board" style="height: 500px;">
         <a href="bbs.do" style="padding: 10px; float:left;
					text-decoration: none;
					color: white;
					font-weight: bold;
					display: inline-block;
					border-right: 30px solid transparent;
					border-bottom: 40px solid #4c4c4c; 
					 margin-bottom: -4px;
					height: 0;
					 font-size: 16pt;
					line-height: 60px;">게시판</a>
        <table style="font:bold; float: left;" id="bList"  >
      	<c:forEach var="board" items="${bbsList}" begin="0" end="2">
        <td >
                 <div id="bdcontent" style="width: 400px; height: 400px;" > 
                    <a href="view.do?bd_id=${board.bd_id}">${board.popup }</a><p>
                	<a href="view.do?bd_id=${board.bd_id}" style="font-size: 14pt; font: bold;">${board.bd_title}</a>
                	<span style="color: olive;">
                	<c:if test="${board.staravg>0}">
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
					</c:if>
					</span>
					<p>
					<a href="view.do?bd_id=${board.bd_id}">${board.mem_id}</a>
						
                </div>  
     
      	</td>
      	</c:forEach>
     
        </table>
    </div>
	<div id="hot_tag_list">
	<div id="hot_tag_Tic">인기검색어</div>
		<div id="hot_tag_top10">
			<ol>
				<c:forEach var="list" items="${tagList }" begin="0" end="9">
					<li><a href="search.do?search_word=${list }&search_target=0">${list }</a></li>
				</c:forEach>
			</ol>
		</div>
	</div>

</body>

<%@include file="footer.jsp" %>

</html>