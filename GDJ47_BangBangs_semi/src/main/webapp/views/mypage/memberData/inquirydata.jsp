<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.Board" %>
<% IbBoard ibBoards=(IbBoard)request.getAttribute("board"); 
String pageBar=(String)request.getAttribute("pageBar");%>
<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>첨부파일</th>
        <th>조회수</th>
    </tr>
    <%if(!boards.isEmpty()) {
        for(IbBoard b : ibBoards){%>
        <tr>
            <td><%=b.getIbBoardNo() %></td>
            <td>
                <a href="<%=request.getContextPath()%>/board/boardView.do?no=<%=b.getBoardNo()%>">
                <%=b.getIbBoardTitle() %>
                </a>
            </td>
            <td><%=b.getIbBoardDate() %></td>
            <td><%=b.getIbcontent() %></td>
        </tr>
    <%}
     }else{ %>
        <tr>
            <td colspan='6'>조회된 결과가 없습니다.</td>
        </tr>
    
</table>
<div id="pageBar">
			<%=pageBar %>
		</div>