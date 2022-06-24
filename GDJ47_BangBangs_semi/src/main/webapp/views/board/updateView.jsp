<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.IbBoard,java.util.List"%>       
<%
IbBoard b = (IbBoard)request.getAttribute("board");
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
    <h2 class="mb-5">문의사항 수정하기</h2>
    <form action='<%=request.getContextPath()%>/board/boardUpdateEnd.do'
		method="post" enctype="multipart/form-data" >
        <table class="table table-boardered">
            <tr>
                <th>작성자</th>
                <td>
                <input type="hidden" name="num" value="<%=b.getIbPostNum()%>">
                
                

                <input type="text" class="form-control" name="boardWriter" value="<%=b.getMemberId()%>" readonly>
              
                </td>        
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" class="form-control" name="boardTitle"></td>      
            </tr>
             
            <tr>
                <th>첨부파일</th>
					<td><input type="file" name="upfile"></td>       
            </tr>
            <tr>
				<th>내용</th>
					<td>
					 <textarea cols="55" rows="10" name="boardContent"></textarea>
					</td>
				</tr>
           
  
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="등록">
                <input type="reset" class="btn btn-danger" value="취소">
                </td>
            </tr>
             
             
        </table>
    </form>
    </div>
     
    </div>
    </div>
</div>
<style>
.mb-5{
      text-align: center;
      font-weight: bold;
    }
  
</style>
</body>
</html>
<%@ include file="/views/common/footer.jsp"%>