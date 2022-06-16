<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ include file="/views/admin_views/common/header.jsp" %>

<%@ include file="/views/admin_views/common/navigationBar.jsp" %>
	
<%
	List<Member> list=(List<Member>)request.getAttribute("list");
%>
<style type="text/css">
	section#memberList-container {text-align:center;}	
	section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
	section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
 	div#search-container {margin:0 0 10px 0; padding:3px; 
    background-color: rgba(0, 188, 212, 0.3);}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;} 
    #memberlist-container{display:flex;}
    div.center{align-items: center;}
</style>

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
	<div class="center">
	
	    <button>a</button>
    	<button>a</button>
    	<button>a</button>
    	<button>a</button>
    	<button>a</button>

	</div>


<%@ include file="/views/admin_views/common/footer.jsp" %>
