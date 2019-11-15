<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><body>

	
<c:if test="${result==0}">
	<script type="text/javascript">
		alert("사용해도 좋습니다");  
		location.href="joinForm.do";
		
	</script>
	<form>
	<input type="button" value="닫기" onclick="wincl()">
	</form>
</c:if>

<c:if test="${result==1}">  
	<script type="text/javascript">
		alert("이미 존재하는 아이디 입니다.");  
		/* location.href="joinForm.do"; */
	  </script>
	<form>
	   다른 아이디를 입력해 주세요<p>
		아이디 : <input type="text" name="mem_id"><p>
		<input type="submit" value="확인">
     </form>
   
 </c:if>

</body>
</html>