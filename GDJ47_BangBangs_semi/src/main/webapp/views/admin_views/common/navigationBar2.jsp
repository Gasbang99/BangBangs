<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	section#memberList-container {text-align:center;align-items: center;align-content: center;}	
	section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;width: 600px;}
	section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
 	div#search-container {margin:0 0 10px 0; padding:3px; 
    background-color: rgba(0, 188, 212, 0.3);}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;} 
    #content{display:flex-direction : row-revers;}
    ul{list-style:none;}
    div.center{align-items: center;}
    #content{align-content: center;}
    #navbar{float: left}
    #navbar-back{background-color: aqua}
    .left_sub_menu {
        position: absolute; 
        top: 50px;
        width: 200px;
        z-index: 10;
        left: 45px;
        background: white;
        border-right: 1px solid rgba(0, 0, 0, 0.07);
        bottom: 50px;
        height: 80%;
        margin-bottom: -70px;
        margin-top: 0px;
        padding-bottom: 0px;
        box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
        color: black;
    }
    .sub_menu{}
</style>

<div id="navbar-back">
	<nav id="navbar">
	 	<div>
		   
			  <div class="left_sub_menu">
	            <div class="sub_menu">
	                
	                <h2>관리자메뉴</h2>
	                <ul class="big_menu">
	                    <li> <i class="arrow fas fa-angle-right"></i></li>
	                    <ul class="small_menu" style>
	                        <li><a href="<%=request.getContextPath()%>/admin/memberList.do">회원관리</a></li>
	                        <li><a href="<%=request.getContextPath()%>/admin/bikeManagement.do">자전거 관리</a></li>
	                        <li><a href="<%=request.getContextPath()%>/rentalShopManagement.do">대여소관리</a></li>
	                        <li><a href="<%=request.getContextPath()%>/stats.do">통계</a></li>
	                    </ul>
	                </ul>
	            </div>
	        </div>
		  
		   
		</div>
	</nav>
</div>
	</section>
	</div>

<script>

</script>



