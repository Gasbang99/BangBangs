<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.Member" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BangBangs</title>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
         <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
         <style src="/css/custom.scss"></style>
    
    <style>
    
            .container5{
        display: inline-block;
       
        border: 1px solid white;
        width: 500px;
        height: 130px;
        margin-top: 50px;
        margin-inline: 100px;
        text-align: center;
        font-size: 15px;
        justify-content: space-between;
        background-color: white;
       }
       .container5:hover{
           background-color: black;
       }
       .container5>a{
           text-decoration: none;
           color:black;
           background-color: white;
        }
        #page-top{
            font-family: "Nanum Gothic Coding";
        }
        #mainNav{
        
        }
        #mainNav a{
        
        }
        #mainNav .nav-link {
	    transition: none;
	    padding: 2rem 1.5rem;
	    color: black;
		}
		#mainNav .navbar-brand {
	    padding: 0.5rem 0;
	    color: black;
		}
		.nav-link:hover{
		background-color:black;
		}
        </style>
</head>
<body id="page-top">
	<div>
    	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/mainscreen.do">BangBangs</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">

                    
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/notice/noticeList.do">공지사항</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board/boardList.do">문의/FAQ</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member.do">이용권구매</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/searchrentalshop.do">대여소조회</a></li>
                        <% if(loginMember==null){ %>
	                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/login.do">로그인</a></li>
	                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/enrollmember.do">회원가입</a></li>
                        <%}else{ %>
                        	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/memberdata.do?memberId=<%=loginMember.getMemberId()%>">마이페이지</a></li>
	                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </nav>
    </div>