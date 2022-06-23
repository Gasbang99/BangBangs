<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin_views/common/header.jsp" %>

<%
	List<Member> list=(List<Member>)request.getAttribute("list");
	String searchType=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");
%>

<%@ include file="/views/common/header.jsp" %>
	

<style type="text/css">
	section#memberList-container {text-align:center;}	
	section#memberList-container table#tbl-member {width:70%; border:1px solid gray; border-collapse:collapse;}
	section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:5px; font-size:10px; }
 	div#search-container {margin:0 0 10px 0; padding:3px; align: center;}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;} 
    #memberlist-container{display:flex;}
    div.center{align-items: center;}
    .select-searchbar{justify-content: center;}
    
</style>

	<div>
	<div id="numPerpage-container">
        	페이지당 회원수 : 
        <form id="numPerFrm" action="">
        	<select name="numPerpage" id="numPerpage">
        		<option value="10">10</option>
        		<option value="5" >5</option>
        		<option value="3" >3</option>
        	</select>
        </form>
    </div>
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
			    <th>회원등급</th>
			    <th>총마일리지</th>
               </tr>
           </thead>
           <tbody>
      		<%if(list.isEmpty()){ %>
      			<tr>
      				<td colspan="10"><h3>조회된결과가 없습니다!</h3></td>
     			</tr>
      		<%}else{
      			for(Member m : list){%>
      			
	   				<tr>
	   					<td><%=m.getMemberId() %></td>
	   					<td><%=m.getMemberName() %></td>
	   					<td><%=m.getGender() %></td>
	   					<td><%=m.getBirthday() %></td>
	   					<td><%=m.getEmail() %></td>
	       				<td><%=m.getAddress() %></td>
	   					<td><%=m.getPhone() %></td>
	       				<td><%=m.getEnrollDate() %></td> 
	       				<td><%=m.getMemberLevel() %> </td>
	       				<td><%=m.getTotalMileage() %></td>
	       				<form id="member-detail" action="<%=request.getContextPath()%>/admin/memberDetail.do" method="post">
	       				<td><input type="hidden" name="memberId" value="<%=m.getMemberId() %>" ><input type="submit" value="상세정보"></td>
	       				</form>
	       			</tr>
       			
   		<%	} 
   		 }%>
        </tbody>
	    </table>
			
			
		</section>
		</div>
		
	
	<div id="search-container">
        	검색타입 : 
        <select id="searchType">
        	<option value="userId" <%=searchType!=null&&searchType.equals("userId")?"selected":"" %>>아이디</option>
        	<option value="userName" <%=searchType!=null&&searchType.equals("userName")?"selected":"" %> >회원이름</option>
        	<option value="gender" <%=searchType!=null&&searchType.equals("gender")?"selected":"" %> >성별</option>
        </select>
        <div id="search-userId">
        	<form action="<%=request.getContextPath()%>/admin/searchMember">
        		<input type="hidden" name="searchType" value="MEMBER_ID" >
        		<input type="text" name="searchKeyword" size="25" 
        		placeholder="검색할 아이디를 입력하세요" >
        		<button type="submit">검색</button>
        	</form>
        </div>
        <div id="search-userName">
        	<form action="<%=request.getContextPath()%>/admin/searchMember">
        		<input type="hidden" name="searchType" value="MEMBER_NAME">
        		<input type="text" name="searchKeyword" size="25" 
        		placeholder="검색할 이름을 입력하세요">
        		<button type="submit">검색</button>
        	</form>
        </div>
        <div id="search-gender">
        	<form action="<%=request.getContextPath()%>/admin/searchMember">
        		<input type="hidden" name="searchType" value="GENDER">
        		<label><input type="radio" name="searchKeyword" value="남" >남</label>
        		<label><input type="radio" name="searchKeyword" value="여" >여</label>
        		<button type="submit">검색</button>
        	</form>
        </div>
      </div>
    </div>
	<script>
		$(()=>{
			$("#searchType").change(e=>{
				/* alert("type이 변경됨"); */
				const type=$(e.target).val();
				console.log(type);
				$("#search-container>div[id!=search-]").hide();
				$("#search-"+type).css("display","inline-block");
			});
			$("#searchType").change();
		})
		
		
	</script>
        	
	
        <%@ include file="/views/common/footer.jsp" %>