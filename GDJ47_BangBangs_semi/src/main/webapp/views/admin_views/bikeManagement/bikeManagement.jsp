<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/views/admin_views/common/header.jsp" %>

	<%@ include file="/views/admin_views/common/navigationBar.jsp" %>
	

<%
	List<Bike> list=(List<Bike>)request.getAttribute("list");
	String searchType=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");
%>

<%@ include file="/views/common/header.jsp" %>
	

<style type="text/css">
	section#BikeList-container {text-align:center;}	
	section#BikeList-container table#tbl-Bike {width:100%; border:1px solid gray; border-collapse:collapse;}
	section#BikeList-container table#tbl-Bike th, table#tbl-bike td {border:1px solid gray; padding:5px; font-size:10px; width: 10%}
 	div#search-container {margin:0 0 10px 0; padding:3px; align: center;}
    div#search-BikeId{display:inline-block;}
    div#search-bikeStatus{display:none;}
    div#search-rentalAvail{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;} 
    #Bikelist-container{display:flex;}
    div.center{align-items: center;}
    .select-searchbar{justify-content: center;}
    #tbl-container{}
    
</style>

	<div>
	<div>
	    <section id="BikeList-container">
	       <h2>자전거관리</h2> 
	       <table id="tbl-bike">
	           <thead>
	               <tr>
		                <th>일련번호</th>
					    <th>고장여부</th>
					    <th>등록일자</th>
					    <th>대여소 번호</th>
					    <th>대여여부</th>
					    <th>상세정보</th>
	               </tr>
	           </thead>
           <tbody>
      		<%if(list.isEmpty()){ %>
      			<tr>
      				<td colspan="5"><h3>조회된결과가 없습니다!</h3></td>
     			</tr>
      		<%}else{
      			for(Bike b : list){%>
      			
	   				<tr>
	   					<td><%=b.getBikeId() %></td>
	   					<td><%=b.getBikeStatus() %></td>
	   					<td><%=b.getBikeEnollDate() %></td>
	   					<td><%=b.getRentalShopId() %></td>
	   					<td><%=b.getRentalAvail() %></td>
	       				<form id="bike-detail" action="<%=request.getContextPath()%>/admin/BikeDetail.do" method="post">
	       				<td><input type="hidden" name="bikeId" value="<%=b.getBikeId() %>" ><input type="submit" value="상세정보"></td>
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
        	<option value="BikeId" <%=searchType!=null&&searchType.equals("BikeId")?"selected":"" %>>아이디</option>
        	<option value="bikeStatus" <%=searchType!=null&&searchType.equals("bikeStatus")?"selected":"" %> >회원이름</option>
        	<option value="rentalAvail" <%=searchType!=null&&searchType.equals("rentalAvail")?"selected":"" %> >성별</option>
        </select>
        <div id="search-BikeId">
        	<form action="<%=request.getContextPath()%>/admin/searchBike">
        		<input type="hidden" name="searchType" value="BikeId" >
        		<input type="text" name="searchKeyword" size="25" 
        		placeholder="검색할 일련번호를 입력하세요" >
        		<button type="submit">검색</button>
        	</form>
        </div>
        <div id="search-bikeStatus">
        	<form action="<%=request.getContextPath()%>/admin/searchBike">
        		<input type="hidden" name="searchType" value="bikeStatus">
        		<label><input type="radio" name="searchKeyword" value="정상" >정상</label>
        		<label><input type="radio" name="searchKeyword" value="고장" >고장</label>
        		<label><input type="radio" name="searchKeyword" value="수리중" >수리중</label>
        		<button type="submit">검색</button>
        	</form>
        </div>
        <div id="search-rentalAvail">
        	<form action="<%=request.getContextPath()%>/admin/searchBike">
        		<input type="hidden" name="searchType" value=rentalAvail>
        		<label><input type="radio" name="searchKeyword" value="y" >대여가능</label>
        		<label><input type="radio" name="searchKeyword" value="n" >대여중</label>
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
	