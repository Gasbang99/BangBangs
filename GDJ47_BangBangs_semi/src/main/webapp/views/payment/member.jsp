<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

	<div>
		<div id="navline">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">이용권 구매하기</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
            <ul class="navbar-nav">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  이용권구분
                </a>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                  <li><a class="dropdown-item" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/seasonticket.jsp">정기권</a></li>
                  <li><a class="dropdown-item" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/onedayticket.jsp">일일권</a></li>
                  <li><a class="dropdown-item" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/groupticket.jsp">단체권</a></li>
                  <li><a class="dropdown-item" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/seasonticketgift.jsp">정기권선물하기</a></li>
                  <li><a class="dropdown-item" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/onedayticketgift.jsp">일일권선물하기</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
     </div>
	</div>
	 <script src="js/scripts.js"></script>
	 <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>

  <style>
    #navline{
        height: auto;
        min-height: 100%;
        padding-bottom: 900px;
      }
  </style>
