<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<%@ page import="java.util.List,com.bbs.model.vo.IbBoard" %>
<%
List<IbBoard> boards=(List<IbBoard>)request.getAttribute("boards");
String pageBar=(String)request.getAttribute("pageBar");
String searchType=request.getParameter("searchType");
String keyword=request.getParameter("searchKeyword");
%>
<%@ include file="/views/common/header.jsp"%>
  <head>
   <meta charset="utf-8" />
        <!-- Favicon-->
       
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        
        
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
 
      <!-- <h2 class="mb-5">문의사항 게시판</h2> -->
      <div class="table-responsive custom-table-responsive"  style="background-color:white; padding: 20px; border-radius: 4px;">
<!-- Header-->
       <header class="bg-dark py-5">
            <div class="container px-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center my-5">
                            <h1 class="display-5 fw-bolder text-white mb-2">BangBangs 고객지원</h1>
                            <p class="lead text-white-50 mb-4">Welcome to the inquiry board</p>
                            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                                <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">click</a>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Features section-->
        <section class="py-5 border-bottom" id="features">
            <div class="container px-5 my-5">
                <div class="row gx-5">
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                        <h2 class="h4 fw-bolder">빠르고 정확한 상담</h2>
                        <p>궁금한 점을 빠르고 정확하게 상담드려요.</p>
                        <a class="text-decoration-none" href="#!">
                           
                        </a>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i></div>
                        <h2 class="h4 fw-bolder">기다릴 필요 없는 접수 처리</h2>
                        <p>여기는 문의사항 게시판 입니다.<br>공지 사항으로 이동</p>
                        <a class="text-decoration-none" href="<%=request.getContextPath()%>/notice/noticeList.do">
                            click
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                        <h2 class="h4 fw-bolder">편리한 상담</h2>
                        <p>상담 가능 시간 : (월~토) 오전 8시 ~ 26시</p>
                        <a class="text-decoration-none" href="#!">
                           
                        </a>
                    </div>
                </div>
            </div>
        </section>
       
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        
        
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
				 <img src="<%=request.getContextPath()%>/images/ok.png"
				 width="40">
				<%}else{ %>
				  <img src="<%=request.getContextPath()%>/images/no.png"
				 width="40">
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
		      작성
		      </button>
		      </td>
		</tr>
        </table>
      </div>
     <section id="memberList-container">
       <div id="search-container">
        	
        	  <select id="searchType">
        	<option value="userId" <%=searchType!=null&&searchType.equals("member_Id")?"selected":"" %>>작성자</option>
        		<option value="userName" <%=searchType!=null&&searchType.equals("ib_Title")?"selected":""%>>제목</option>
        		<option value="gender" <%=searchType!=null&&searchType.equals("category")?"selected":""%>>카테고리</option>
        	</select>
        	<div id="search-userId">
        		<form action="<%=request.getContextPath()%>/board/searchIb">
        			<input type="hidden" name="searchType" value="member_Id" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 작성자를 입력하세요" >
        			<button type="submit" class="btn btn-primary">찾기</button>
        		</form>
        	</div>
        	<div id="search-userName">
        		<form action="<%=request.getContextPath()%>/board/searchIb">
        			<input type="hidden" name="searchType" value="ib_Title">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 제목을 입력하세요">
        			<button type="submit" class="btn btn-primary">찾기</button>
        		</form>
        	</div>
        	<div id="search-gender">
        		<form action="<%=request.getContextPath()%>/board/searchIb">
        			<input type="hidden" name="searchType" value="category">
        			<label><input type="checkbox" name="searchKeyword" value="고장" >고장</label>
        			<label><input type="checkbox" name="searchKeyword" value="문의" >문의</label>
        			<label><input type="checkbox" name="searchKeyword" value="기타" >기타</label>
        			<button type="submit" class="btn btn-primary">찾기</button>
        		</form>
        	</div>
        	
        	</div>
 				</section>
            </div>
		<div id="pageBar">
		<%=pageBar %>
		</div>
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
  <script>
    	$(()=>{
    		$("#searchType").change(e=>{
    			const type=$(e.target).val();
    			console.log(type);
    			$("#search-container>div[id!=search-]").hide();
    			$("#search-"+type).css("display","inline-block");
    		});
    		//select바꿀때 input창에 똑같이 나오는것
    		$("#searchType").change();
    	})
    </script>
<%@ include file="/views/common/footer.jsp"%>