<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <td>${board.bd_id}</td>
                <td>${board.bd_date}</td>
                <td>${board.bd_readcount}</td>
            </tr>
        </c:forEach>
        </table>
    </div>