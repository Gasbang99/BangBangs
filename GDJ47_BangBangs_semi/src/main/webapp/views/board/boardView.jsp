<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.Board,java.util.List,com.bbs.model.vo.BoardComment" %>    
<%
 Board b=(Board)request.getAttribute("board");
 List<BoardComment> comments=(List<BoardComment>)request.getAttribute("comments");
%> 
<!DOCTYPE html>
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
    <h2 class="mb-5">문의사항</h2>
    <form action='<%=request.getContextPath()%>/board/boardWriteEnd.do'
		method="post" enctype="multipart/form-data" >
        <table class="table table-boardered">
            <tr>
                <th>글번호</th>
				<td><%=b.getBoardNo() %></td>       
            </tr>
            <tr>
                <th>제목</th>
                <td><%=b.getBoardTitle() %></td>      
            </tr>
             
            <tr>
               <th>작성자</th>
				<td><%=b.getBoardWriter() %></td>      
            </tr>
            <tr>
				<th>첨부파일</th>
				<td>
				 <%if(b.getBoardOriginalFilename()!=null){ %>
				 <a href="<%=request.getContextPath()%>/fileDownload.do?oriName=<%=b.getBoardOriginalFilename()%>&reName=<%=b.getBoardRenamedFilename()%>">
				  <img src="<%=request.getContextPath()%>/images/file.png"
				  width="20">
				   <%=b.getBoardOriginalFilename() %>
				  </a>
				 <%}else{ %>
				  첨부파일없음
				 <%} %>
				</td>
            <tr>
                <th>내 용</th>
				<td><%=b.getBoardContent() %></td>
		    
            </tr>
  
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="수정하기">
                <input type="reset" class="btn btn-danger" value="삭제하기">
                </td>
            </tr>
        </table>
    </form>
    </div>
        </div>
    </div>
</div>
<!-- Comments Form -->
<div class="container">
 <table class="table table-hover">

    <tbody>
    <form action="<%=request.getContextPath()%>/board/insertBoardComment.do" method="post">
        <tr>
      	<td><textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="contentDetail" rows="3" cols="20" ></textarea></td>
      	            <input type="hidden" name="writer" value="">
   		    	    <input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>">
   		    	    <input type="hidden" name="boardCommentRef" value="0">
      </tr>
    </tbody>
   </table>
  <input type="submit" class="btn btn-primary pull-right" value="작성">
 
</form>
</div>
<style>
.mb-5{
      text-align: center;
      font-weight: bold;
    }
   input[type=checkbox]{
   margin-left:20px;
   }
    table#tbl-comment textarea{margin: 4px 0 0 0;}
    table#tbl-comment button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}
    </style>
    </style>
</style>
</body>
</html>