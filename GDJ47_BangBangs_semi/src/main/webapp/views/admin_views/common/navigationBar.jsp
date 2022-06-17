<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <nav id="navbar" style = "">
 	<div>
	    <a>관리자메뉴</a>
	  
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" href="<%=request.getContextPath()%>/memberList.do">회원관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="<%=request.getContextPath()%>/bikeManagement.do">자전거 관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="<%=request.getContextPath()%>/rentalShopManagement.do">대여소관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="<%=request.getContextPath()%>/stats.do">통계</a>
	        </li>
	        
	      </ul>
     
	    </div>
	</div>
</nav>
<div>
    <section id="memberList-container">
        <h2>회원관리</h2> 
        <table id="tbl-member">
            <thead>
                <tr>
                    <th>아이디</th>
				    <th>이름</th>
				    <th>성별</th>
				    <th>나이</th>
				    <th>이메일</th>
				    <th>전화번호</th>
				    <th>주소</th>
				    <th>가입날짜</th>
                </tr>
            </thead>
          </table>
	</section>
	</div>





