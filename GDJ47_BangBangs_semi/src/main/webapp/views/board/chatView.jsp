<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 채팅 상담</title>
<meta charset="utf-8">
     <!-- Favicon-->
   <%@ include file="/views/common/header.jsp"%>    
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
 
</head>
<body>
   <h2 class="mb-5">문의사항 게시판</h2> 
      <div class="table-responsive custom-table-responsive"  style="background-color:white; padding: 20px; border-radius: 4px;">
<!-- Header-->
 

<!-- <h2 class="mb-5">문의사항 게시판</h2> -->
       <header class="bg-dark py-5">
            <div class="container px-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center my-5">
                            <h1 class="display-5 fw-bolder text-white mb-2">BangBangs</h1>
                            <p class="lead text-white-50 mb-4">Welcome to Chatting service</p>
                            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                                <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">click</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
 <section class="py-5 border-bottom" id="features">
<p align="middle">
<iframe src="https://service.dongledongle.com/bangbang" frameborder="0" width="50%" height="500"></iframe>
<p>
<div class="progress">
  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
  서버속도</div>
</div>
<br>
<div style="text-align: center;">
<input type="submit"  id="btnBack" value="이전" class="btn btn-primary" onClick="history.back()">
</div>
</section>


</body>
<style>
.mb-5{
      text-align: center;
      font-weight: bold;
    }
  
</style>
</html>
<%@ include file="/views/common/footer.jsp"%>