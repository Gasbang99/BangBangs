<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.bbs.notice.model.vo.NoticeBoard" %>
<%
	List<NoticeBoard> notices = (List<NoticeBoard>)request.getAttribute("notices");
	String pageBar=(String)request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp"%>
<html>
<head>
     <!-- Bootstrap core JS-->
    

     <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style3.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
       
        <title>Small Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath()%>/css/styles2.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

    <body>


        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <br>
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img src="<%=request.getContextPath()%>/images/notice.png"
				  width="480" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">BangBangs</h1>
                    <p>Welcome This is the notice area <br>
                   If you have any questions, please click the button below</p>
                    <a class="btn btn-primary" href="<%=request.getContextPath()%>/board/boardList.do">?????????????????? ??????</a>
                </div>
            </div>
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">????????? ??????????????? BangBangs??? ?????? ?????????!</p></div>
            </div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">(????????? ??????) BangBangs 20% ???????????? ????????? ?????? ??????</h2>
                            <p class="card-text">???????????? ????????? ????????? ??? ???????????? ??????????????? ??? ??????????????????.???????????? ????????? ????????????????????? ?????? ??????????????????.???????????????.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="http://pay.tmoney.co.kr">More Info</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">????????????????????? ????????????BangBangs ????????????</h2>
                            <p class="card-text">????????? ???????????? ?? ????????? ?? ?????? ??? ???????????? ????????? ????????? ???????????????.?????? ???????????? ????????? ????????? ?????? ??????????????????.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="http://news.kmib.co.kr/article/view.asp?arcid=0015876201&code=61121111&sid1=soc">More Info</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">(????????? ??????) BangBangs ???????????? ?????? ??????????????? ??????</h2>
                            <p class="card-text">BangBangs??? ??????????????????????? ????????? ?????? ????????? ?????? ????????? ???????????? ????????????.??? ??? ?????? ?????? ???</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="<%=request.getContextPath()%>/notice/noticeList.do">More Info</a></div>
                    </div>
                </div>
                <!-- Header--><!-- section??? ????????? -->
                <section class="ftco-section">
       <header class="bg-dark py-5">
            <div class="container px-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center my-5">
                            <h1 class="display-5 fw-bolder text-white mb-2">BangBangs</h1>
                            <p class="lead text-white-50 mb-4">Welcome This is the notice area</p>
                            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                                <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">click</a>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          
        </header>
                            <!-- ??????????????? -->
        <section id="features" style="padding-bottom:10rem">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section"></h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- <div class="table-wrap"> -->
						<table class="table custom-table"> 
						 <!-- <table class="table table-striped"> -->
						 <thead>
						    <tr>
						      <th scope="col" style="font-weight: bold; font-size :12px;">??????</th>
						      <th scope="col" style="font-weight: bold; font-size :12px;">??????</th>
						      <th scope="col" style="font-weight: bold; font-size :12px;">?????????</th>
						      <th scope="col" style="font-weight: bold; font-size :12px;">??????</th>
						      <th scope="col" style="font-weight: bold; font-size :12px;">??????</th>
						    </tr>
						  </thead>
						   <tbody>
						  <%if(notices!=null){ %>
						 	<%for(NoticeBoard n : notices){ %>
						    <tr>
						      <th scope="row"><%=n.getNoticeNum() %></th>
						      <td><%=n.getNoticeTitle() %></td>
						      <td><%=n.getNoticeEnrollDate() %></td>
						       <td><%if(n.getIbBoardOriginalFilename()!=null){ %>
				 			<img src="<%=request.getContextPath()%>/images/ok.png"
				 			width="40">
							<%}else{ %>
				 		   <img src="<%=request.getContextPath()%>/images/no.png"
				 			width="40">
							<%} %></td>
						    
				<td><a class="btn btn-warning" href="<%=request.getContextPath()%>/notice/noticeView.do?no=<%=n.getNoticeNum()%>">Open</a></td>
						    </tr>
						 <%}
            				}else{ %>
						 	 <tr>
							<td colspan='5'>????????? ????????? ????????????.</td>
							</tr>
						  <%} %>
						   </tbody>
					<!-- ?????? ?????? -->
				 <%if(loginMember!=null&&loginMember.getMemberId().equals("admin")){ %>
				   <tr>
		    	<td colspan="7" style="text-align:right">
        		<button type="button" class="btn btn-primary" onclick="location.assign('<%=request.getContextPath()%>/notice/noticeWrite.do')">??????</button>
        		 </td>
				  </tr>
        		<%} %>
        			<!-- ?????? ?????? -->
        			<!-- ??????????????? -->
						</table>
						<section id="memberList-container">
       <div id="search-container">
        	
        	  <select id="searchType">
        		<option value="userName" >??????</option>
        	</select>
        <div id="search-userId">
        		<form action="<%=request.getContextPath()%>/notice/serchNotice">
        			<input type="hidden"  name="searchType" value="notice_Title" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="????????? ????????? ???????????????" >
        			<button type="submit" class="btn btn-primary">??????</button>
        		</form>
        	</div>
        	</div>
 				</section>
            </div>
     
    <div id="pageBar" >
  		<%=pageBar %>
 	</div>

					</div>
				</div>
			</div>
	</section>
	</section>
	<!-- ???????????? -->
        
       
    
        
       

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

</body>
</html>
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
    div#pageBar{margin-top:10px; text-align:center; }
	div#pageBar span.cPage{color: #0066ff;}
	

  </style>
   <script>
    	$(()=>{
    		$("#searchType").change(e=>{
    			const type=$(e.target).val();
    			console.log(type);
    		});
    	
    </script>
    <script type="text/javascript">
    const wnd = window.open("","info", "width=500, height=300");
    wnd.document.write(
        "<h2>????????? ?????? ??????</h2>",
        "<ul>",
        "<li><strong>?????? : 2022-06-25(???) ~ 2022-07-06(???)</strong></li>",
        "<li>?????? : ????????? ?????? ??????</li><br>",
        "<p>BangBang ??????????????? ?????? ????????? ????????? ??????????????? ????????????.</p>",
        "</ul>"
       
    )
	</script>  

<%@ include file="/views/common/footer.jsp"%>