<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.IbBoard,java.util.List,com.bbs.model.vo.IbBoardComment" %>    
<%
 IbBoard b=(IbBoard)request.getAttribute("board");
 List<IbBoardComment> comments =(List<IbBoardComment>) request.getAttribute("comments");
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
    <h2 class="mb-5">문의사항</h2>
    <!-- 수정,삭제 -->
    	
        <table class="table table-boardered">
            <tr>
                <th>글번호</th>
				<td><%=b.getIbPostNum() %>
					
				</td>       
            </tr>
            <tr>
                <th>제목</th>
                <td><%=b.getIbTitle() %>
                   
                </td>      
            </tr>
             
            <tr>
               <th>작성자</th>
				<td><%=b.getMemberId() %>
					
				</td>      
            </tr>
           <tr>
				<th>첨부파일</th>
				<td>
				 <%if(b.getIbBoardOriginalFilename()!=null){ %>
				 <a href="<%=request.getContextPath()%>/fileDownload.do?oriName=<%=b.getIbBoardOriginalFilename()%>&reName=<%=b.getIbBoardRenamedFilename() %>">
				    <img src="<%=request.getContextPath()%>/images/ok.png"
				 width="40">
				   <%=b.getIbBoardOriginalFilename() %>
				  
				 
				  </a>
				 <%}else{ %>
				     <img src="<%=request.getContextPath()%>/images/no.png"
				 width="40">
				 <%} %>
				
				</td>
			</tr>
            <tr>
                <th>내 용</th>
				<td><%=b.getIbContent() %>
				
				</td>
		    
            </tr>
  
            <tr>
            <%--글작성자/관리자인경우 수정삭제 가능 로직 --%>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" 
                onclick="location.assign('<%=request.getContextPath() %>/board/updateboard.do?num=<%=b.getIbPostNum()%>')" value="수정하기">
                <input type="reset" class="btn btn-danger" 
                onclick="location.assign('<%=request.getContextPath() %>/board/deleteboard.do?num=<%=b.getIbPostNum()%>')" value="삭제하기">
                </td>
            </tr>
        </table>
 	
    </div>
        </div>
    </div>
</div>
<!-- 관리자일때만 댓글창 보이게 -->

<!-- Comments Form -->
<div class="container">
<form action="<%=request.getContextPath()%>/board/insertBoardComment.do" method="post">
 <table class="table table-hover">
        <tr>
      	<td><textarea class="form-control" placeholder="회원님 문의 댓글을 작성하세요." name="content" rows="2" cols="90" 
      	style="border: none; resize: none;"></textarea></td>
      				
      	          <td><input type="hidden" name="writer" value="<%=loginMember!=null?loginMember.getMemberId():""%>"></td> 
   		    	   <td><input type="hidden" name="pNum" value="<%=b.getIbPostNum()%>"></td>
      </tr>
   </table>
  <input type="submit" class="btn btn-primary pull-right" value="작성">
</form>
</div>
<br>
<!-- 댓글입력창 -->
 <%-- <table id="tbl-comment">
  <%for(IbBoardComment bc : comments){ %>
 	 <tr class="level1">
  		<td>
  		<sub class="comment-writer"><%=bc.getIbCommentWriter() %></sub>
  		<sub class="comment-date"><%=bc.getIbCommentEnrollDate() %></sub>
  		<br>
  		<%=bc.getIbCommentContent() %>
  		</td>
  </tr>
  <%} %> 
</table> --%>
 <%for(IbBoardComment bc : comments){ %>
 <s_guest_container>
            <div class="guestList">
                <ol class="list-group">
                    <s_guest_rep>
                        <li id="[##_guest_rep_id_##]" class="list-group-item">
                            <div class="[##_guest_rep_class_##]">
                                <strong><%=bc.getIbCommentWriter() %></strong>
                                <small><%=bc.getIbCommentEnrollDate() %></small>
                                <span class="control"><!-- "[##_guest_rep_onclick_delete_##]" -->
                                    <a href="#" onclick="location.assign('<%=request.getContextPath() %>/board/deleteboardComment.do?num=<%=bc.getIbCommentNum()%>')"
                                    class="btn btn-primary pull-right">&nbsp;<span>삭제</span></a>
                                    <!-- <a href="#" onclick="[##_guest_rep_onclick_reply_##]" class="btn btn-primary pull-right">&nbsp;<span>답글</span></a> -->
                                </span>
                                <p><%=bc.getIbCommentContent() %></p>
                            </div>
                             <s_guest_reply_container>
                                <ul class="list-group">
                                    <s_guest_reply_rep>
                                        <li id="[##_guest_rep_id_##]" class="list-group-item">
                                            <div class="[##_guest_rep_class_##]">
                                                <strong>관리자</strong>
                                                <small><%=bc.getIbCommentEnrollDate() %></small>
                                                <span class="control">
                                                    <a href="#" onclick="[##_guest_rep_onclick_delete_##]"><span></span></a>
                                                </span>
                                                <p>신속하게 처리해드리겠습니다. 감사합니다.</p>
                                            </div>
                                        </li>
                                    </s_guest_reply_rep>
                             </ul>
                            </s_guest_reply_container>
                        </li>
                    </s_guest_rep>
                </ol>
            </div>
        </s_guest_container>
<%} %> 
       
</body>
</html>
<style>
.mb-5{
      text-align: center;
      font-weight: bold;
    }
   input[type=checkbox]{
   margin-left:20px;
   }
   table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-reply{display:none;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-reply{display:inline;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
    table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
    table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
    table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
    /*답글관련*/
    table#tbl-comment textarea{margin: 4px 0 0 0;}
    table#tbl-comment button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}
   textarea{resizeable:none;}
    table#tbl-comment textarea{margin: 4px 0 0 0;}
    table#tbl-comment button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}
</style>
<%@ include file="/views/common/footer.jsp"%>