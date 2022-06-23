<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <h2 class="mb-5">공지사항 등록</h2>
    <form action='<%=request.getContextPath()%>/notice/noticeWriteEnd.do'
		method="post" enctype="multipart/form-data" >
        <table class="table table-boardered">
          	 
            <tr>
                <th>제목</th>
                <td><input type="text" class="form-control" name="noticeTitle"></td>      
            </tr>
             
            <tr>
                <th>첨부파일</th>
					<td><input type="file" name="upfile"></td>       
            </tr>
            <tr>
				<th>내용</th>
					<td>
					 <textarea cols="55" rows="10" name="noticeContent"></textarea>
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

</body>
</html>
<br>
<br>
<%@ include file="/views/common/footer.jsp"%>