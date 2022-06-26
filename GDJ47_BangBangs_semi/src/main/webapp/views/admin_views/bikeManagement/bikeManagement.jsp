<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.bbs.model.vo.Bike" %>
	

<%
	List<Bike> list=(List<Bike>)request.getAttribute("list");
	String searchType=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");
%>

<%@ include file="/views/common/header.jsp" %>
	

<style type="text/css">
	section#bikeList-container table#tbl-bike {height: 50%; width:70%; border:1px solid gray; border-collapse:collapse; margin: auto;}
	section#bikeList-container table#tbl-bike th, table#tbl-bike td {border:1px solid gray; padding:5px; font-size:13px; }
	section#bikeList-container table#tbl-bike th{font-size:15px;}
 	div#search-container {margin:0 0 10px 0; padding:3px; align: center;}
    div#search-BikeId{display:inline-block;}
    div#search-bikeStatus{display:none;}
    div#search-rentalAvail{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;} 
    #Bikelist-container{display:flex;}
    div.center{align-items: center;}
    .select-searchbar{justify-content: center;}
    #list-container{margin-top: 30px;}
    #tbl-bike{margin: 30px; justify-content: center;}
    div#whole-container{margin-top: 150px; text-align: center;}
    div#pageBar{margin: 20px;}
    
</style>

	<div id="whole-container">
	<div id="sub-container">
	    <section id="bikeList-container">
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
      				<td colspan="5"><h4>조회된결과가 없습니다!</h4></td>
     			</tr>
      		<%}else{
      			for(Bike b : list){%>
      			
	   				<tr>
	   					<td><%=b.getBikeId() %></td>
	   					<td><%=b.getBikeBrokenStatus() %></td>
	   					<td><%=b.getBikeEnrollDate() %></td>
	   					<td><%=b.getRentalShopId() %></td>
	   					<td><%=b.getRentalAvailability() %></td>
	       				<form id="bike-detail" action="<%=request.getContextPath()%>/admin/BikeDetail.do" method="post">
	       				<td><input type="hidden" name="bikeId" value="<%=b.getBikeId() %>" ><input type="submit" value="상세정보"></td>
	       				</form>
	       			</tr>
       			
   		<%	} 
   		 }%>
        </tbody>
	    </table>
		<div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
			
		</section>
		</div>
		
	
	<div id="search-container">
        	검색타입 : 
        <select id="searchType">
        	<option value="bikeId" <%=searchType!=null&&searchType.equals("bikeId")?"selected":"" %>>일련번호</option>
        	<option value="bikeBrokenStatus" <%=searchType!=null&&searchType.equals("bikeBrokenStatus")?"selected":"" %> >자전거상태</option>
        	<option value="rentalAvailability" <%=searchType!=null&&searchType.equals("rentalAvailability")?"selected":"" %> >대여여부</option>
        </select>
        <div id="search-bikeId">
        	<form action="<%=request.getContextPath()%>/admin/bikesearch.do">
        		<input type="hidden" name="searchType" value="Bike_Id">
        		<input type="text" name="searchKeyword" size="25" 
        		placeholder="검색할 일련번호를 입력하세요" >
        		<button type="submit">검색</button>
        	</form>
        </div>
        <div id="search-bikeBrokenStatus">
        	<form action="<%=request.getContextPath()%>/admin/bikesearch.do">
        		<input type="hidden" name="searchType" value="BIKE_BROKEN_STATUS">
        		<label><input type="radio" name="searchKeyword" value="정상" >정상</label>
        		<label><input type="radio" name="searchKeyword" value="고장" >고장</label>
        		<label><input type="radio" name="searchKeyword" value="수리중" >수리중</label>
        		<button type="submit">검색</button>
        	</form>
        </div>
        <div id="search-rentalAvailability">
        	<form action="<%=request.getContextPath()%>/admin/bikesearch.do">
        		<input type="hidden" name="searchType" value="RENTAL_AVAILABILITY">
        		<label><input type="radio" name="searchKeyword" value="Y" >대여가능</label>
        		<label><input type="radio" name="searchKeyword" value="N" >대여중</label>
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