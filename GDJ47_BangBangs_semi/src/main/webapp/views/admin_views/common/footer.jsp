<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
li#admin_menu a {cursor:pointer;}
		li#admin_menu .admin_hide {display:none;}

</style>
<div>
                                	<ul style="">
                                		<li id="admin_menu"><a class="nav-link">관리자메뉴</a>
                                
                                        <ul class="admin_hide">
                                            <li><a href="<%=request.getContextPath()%>/admin/memberList.do">회원관리</a></li>
                                            <li><a href="<%=request.getContextPath()%>/admin/bikeManagement.do">자전거 관리</a></li>
                                            <li><a href="<%=request.getContextPath()%>/rentalShopManagement.do">대여소관리</a></li>
                                        </ul>
                                    </li>
                                    </ul>
                                </div>

<script>
$(document).ready(function(){
	$("#admin_menu>a").click(function(){
		var submenu=$(this).next("ul");
		if(submenu.is(":visible")){
			submenu.slideUp();]
		}else{
			submenu.slideDown();
		}
	
	});
	
});

</script>