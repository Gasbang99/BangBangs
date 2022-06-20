<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<%@ page import="java.util.List,com.bbs.model.vo.IbBoard" %>
<%
List<IbBoard> boards=(List<IbBoard>)request.getAttribute("boards");
String pageBar=(String)request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp"%>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

    <title>게시판</title>
  </head>
  <body>
  

  <div class="content">

    <div class="container">
      <h2 class="mb-5">문의사항 게시판</h2>
      <div class="table-responsive custom-table-responsive">

        <table class="table custom-table">
          <thead>
            <tr>  

              <th scope="col">
                <label class="control control--checkbox">
                  <input type="checkbox"  class="js-check-all"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
              <th scope="col">번호</th>
              <th scope="col">작성자</th>
              <th scope="col">제목</th>
              <th scope="col">파일</th>
              <th scope="col">작성일</th>
              <th scope="col">카테고리</th>
            </tr>
          </thead>
          <tbody>
          <%if(boards!=null){ 
			   for(IbBoard b : boards){%>
             <tr scope="row">
              <th scope="row">
                <label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
              <td>
                <%=b.getIbPostNum() %>
              </td>
              <td><%=b.getMemberId() %></td>
              <td>
                <a href="#"><%=b.getIbTitle() %></a>
                <a href="<%=request.getContextPath()%>/board/boardView.do?no=<%=b.getIbPostNum()%>"><small class="d-block">click</small></a> 
              </td>
              <td><%if(b.getIbBoardOriginalFilename()!=null){ %>
				 <img src="<%=request.getContextPath()%>/images/file.png"
				 width="20">
				<%}else{ %>
				 첨푸파일없음
				<%} %></td>
              <td><%=b.getIbEnrollDate() %></td>
              <td><%=b.getCategory() %></td>
            </tr>
            <tr class="spacer"><td colspan="100"></td></tr>
            <tr class="active">
            <%}
            }else{ %>
            <tr>
			<td colspan='7'>조회된 결과가 없습니다.</td>
			</tr>
            <%} %>
          </tbody>
              <tr>
		    <td colspan="7" style="text-align:right">
		   
		      <button class="btn btn-primary"
		      onclick="location.assign('<%=request.getContextPath()%>/board/boardWriter.do')">
		      글쓰기
		      </button>
		      </td>
		</tr>
        </table>
      </div>
     <section id="memberList-container">
      
                <div id="search-container">
        	검색어 
        	<select id="searchType">
        		<option value="number">번호</option>
        		<option value="userName">작성자</option>
        		<option value="title">제목</option>
        	</select>
        	<div id="search-userId">
        		<form action="<%=request.getContextPath()%>/admin/searchMember">
        			<input type="hidden" name="searchType" value="userId" >
        			<input type="text" name="searchKeyword" size="25" style=height:22px;
        			placeholder="검색할 작성자를 입력하세요" list="ids">
        			<datalist id="ids">
        			</datalist>
        			<button type="submit" class="btn btn-primary">찾기</button>
        		</form>
        			<script>
        			$("input[placeholder*=작성자]").keyup(e=>{
        				$.ajax({
        					url:"<%=request.getContextPath()%>/autoComplete.do",
        					data:{"keyword":e.target.value},
        					success:data=>{
        						$("#ids").html("");
        						/* console.log(data); */
        						data.forEach(v=>{
        							const op=$("<option>").attr("value",v).text(v);
        							$("#ids").append(op);
        						});
        					}
        				});
        			
        			});
        		</script>
       </section>
	
    </div>

		<div id="pageBar">
		<%=pageBar %>
		</div>
  </div>
   	
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
  </body>
  <style>
    section#memberList-container {text-align:center;}
    
    section#memberList-container table#tbl-member {width:100%; border:1px solid gray;}
    section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
        div#search-container {margin:0 0 10px 0; padding:3px;}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;}
    .mb-5{
      text-align: center;
      font-weight: bold;
    }
    .btn btn-primary{
     
    }
    div#pageBar{margin-top:10px; text-align:center;}
	div#pageBar span.cPage{color: #0066ff;}
  </style>
</html>
<%@ include file="/views/common/footer.jsp"%>