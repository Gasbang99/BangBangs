<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.Member" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String onloan = (String)session.getAttribute("onloan");
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
         <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
         
         <!-- 비디오 -->
         <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        
         <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath() %>/css/body.css" rel="stylesheet" />
    
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
        	background-color:white;
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
                        	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/rentalBike.do">대여하기</a></li>
                        <%}else if((loginMember!=null&&loginMember.getOnLoan().equals("N"))||(loginMember!=null&&onloan=="offloan")){ %>
                        	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/rentalBike.do">대여하기</a></li>
                        <%}else if(loginMember!=null&&loginMember.getOnLoan().equals("Y")||(loginMember!=null&&onloan=="onloan")){ %>
                        	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/returnBike.do">반납하기</a></li>
                        <%} %>
                        <% if(loginMember==null){ %>
	                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/login.do">로그인</a></li>
	                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/enrollmember.do">회원가입</a></li>
                        <%}else{ %>
                        	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/memberdata.do?memberId=<%=loginMember.getMemberId()%>">마이페이지</a></li>
	                        <%if(loginMember.getMemberId().equals("admin")){ %>
								<li><a class="nav-link" href="<%=request.getContextPath()%>/admin/index.do">관리자페이지</a></li><%} %>
	                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <script>
    var didScroll;
    var lastScrollTop = 0;
    var delta = 5;
    var navbarHeight = $('header').outerHeight();

    $(window).scroll(function(event){
        didScroll = true;
    });

    setInterval(function() {
        if (didScroll) {
            hasScrolled();
            didScroll = false;
        }
    }, 250);

    function hasScrolled() {
        var st = $(this).scrollTop();
        
        // Make sure they scroll more than delta
        if(Math.abs(lastScrollTop - st) <= delta)
            return;
        
        // If they scrolled down and are past the navbar, add class .nav-up.
        // This is necessary so you never see what is "behind" the navbar.
        if (st > lastScrollTop && st > navbarHeight){
            // Scroll Down
            $('header').removeClass('nav-down').addClass('nav-up');
        } else {
            // Scroll Up
            if(st + $(window).height() < $(document).height()) {
                $('header').removeClass('nav-up').addClass('nav-down');
            }
        }
        
        lastScrollTop = st;
    }
    
    window.addEventListener('wheel',()=>{
    	$('navbar-nav').hidden;
    })
	
    </script>