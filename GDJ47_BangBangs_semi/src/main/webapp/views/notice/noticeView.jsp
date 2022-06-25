<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.notice.model.vo.NoticeBoard" %>    
<%
 NoticeBoard n = (NoticeBoard)request.getAttribute("notice");
%> 
<%@ include file="/views/common/header.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
 
</head>
<body>
     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <h2 class="mb-5">공지사항</h2>
   
    	
        <table class="table table-boardered">
            <tr>
                <th>글번호</th>
				<td><%=n.getNoticeNum()%></td>       
            </tr>
            <tr>
                <th>제목</th>
                <td><%=n.getNoticeTitle()%></td>      
            </tr>
           
           <tr>
				<th>첨부파일</th>
				<td>
				
				 <%if(n.getIbBoardOriginalFilename()!=null){ %>
				 <a href="<%=request.getContextPath()%>/file2Download.do?oriName=<%=n.getIbBoardOriginalFilename()%>&reName=<%=n.getIbBoardRenamedFilename() %>">
				    <img src="<%=request.getContextPath()%>/images/ok.png"
				 width="40">
				   <%=n.getIbBoardOriginalFilename() %>
				  
				 
				  </a>
				 <%}else{ %>
				     <img src="<%=request.getContextPath()%>/images/no.png"
				 width="40">
				 <%} %>
				
				</td>
			</tr>
            <tr>
                <th>내 용</th>
      			<%-- 	<td><%=n.getNoticeContent() %></td> --%>
				<td> <textarea cols="55" rows="10" name="noticeContent" style="maxlength=40; rows=1; text-align:center; border: none; resize: none; spellcheck=false;"><%=n.getNoticeContent() %></textarea></td>
		    
            </tr>
  
  		<%if(loginMember!=null&&loginMember.getMemberId().equals("admin")){ %>
            <tr>
           
            <%--글작성자/관리자인경우 수정삭제 가능 로직 --%>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" 
                onclick="location.assign('<%=request.getContextPath() %>/notice/updatenotice.do?num=<%=n.getNoticeNum()%>')" value="수정하기">
                <input type="reset" class="btn btn-danger" 
                onclick="location.assign('<%=request.getContextPath() %>/notice/deletenotice.do?num=<%=n.getNoticeNum()%>')" value="삭제하기">
                </td>
            </tr>
            <%} %>
        </table>
 		<br>
    </div>
        </div>
    </div>
</div>
</body>
</html>
<style>
   input[type=checkbox]{
   margin-left:20px;
   }
   .mb-5{
      text-align: center;
      font-weight: bold;
    }
   
</style>
<br>
<br>
<%@ include file="/views/common/footer.jsp"%>