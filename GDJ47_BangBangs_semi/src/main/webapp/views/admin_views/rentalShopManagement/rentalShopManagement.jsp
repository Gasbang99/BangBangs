<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/views/admin_views/common/header.jsp" %>

	<%@ include file="/views/admin_views/common/navigationBar.jsp" %>
	
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
   					<td><%=m.getMember_id() %></td>
   					<td><%=m.getMember_name() %></td>
   					<td><%=m.getGender() %></td>
   					<td><%=m.getAge() %></td>
   					<td><%=m.getEmail() %></td>
   					<td><%=m.getPhone() %></td>
       				<td><%=m.getAddress() %></td>
       				<td><%=m.getEnroll_date() %></td> 
       				<td><%=m.getMember_level() %> </td>
       				<td><%=m.getTotal_mileage() %></td>
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
        		<input type="hidden" name="searchType" value="userId" >
        		<input type="text" name="searchKeyword" size="25" 
        		placeholder="검색할 아이디를 입력하세요" >
        		<button type="submit">검색</button>
        	</form>
        </div>
        <div id="search-userName">
        	<form action="<%=request.getContextPath()%>/admin/searchMember">
        		<input type="hidden" name="searchType" value="userName">
        		<input type="text" name="searchKeyword" size="25" 
        		placeholder="검색할 이름을 입력하세요">
        		<button type="submit">검색</button>
        	</form>
        </div>
        <div id="search-gender">
        	<form action="<%=request.getContextPath()%>/admin/searchMember">
        		<input type="hidden" name="searchType" value="gender">
        		<label><input type="radio" name="searchKeyword" value="M" >남</label>
        		<label><input type="radio" name="searchKeyword" value="F" >여</label>
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
	

	<%@ include file="/views/admin_views/common/footer.jsp" %>
	