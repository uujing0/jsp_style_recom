<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #board{
 			top:90px;
           	margin-left: 8%;
        } 
 #bList{
            text-align :center;
        }
</style>
</head>

<body>
<div id="board">
        <table style="font:bold;" id="bList" width="1200" border="3" bordercolor="lightgray" >
            <tr heigh="30">
                <td width="50">글번호</td>
                <td width="550">제목</td>
                <td width="50">작성자</td>
                <td width="100">작성일</td>
                <td width="50">조회수</td>
            </tr>         
        <c:forEach var="board" items="${myList}">
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
</body>
</html>