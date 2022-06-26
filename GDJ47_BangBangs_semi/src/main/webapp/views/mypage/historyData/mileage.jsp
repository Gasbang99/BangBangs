
<%@page import="com.bbs.payment.model.vo.PurchaseHistory"%>
<%@page import="java.util.List"%>
<%@page import="com.bbs.model.vo.RentalHistory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 	List<PurchaseHistory> mileageHistory=(List<PurchaseHistory>)request.getAttribute("mileageHistory"); 
	String pageBar=(String)request.getAttribute("pageBar");
	int totalMileage=(int)request.getAttribute("totalMileage");
	
	%>
	
    <%@ page import="com.bbs.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp" %>
    <ul id="mypageHeaderNav" class="nav nav-pills  justify-content-center">
        <li class="nav-item ">
            <a class="nav-link" id="memberData" href="<%=request.getContextPath()%>/memberdata.do?memberId=<%=loginMember.getMemberId()%>"><span>회원 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="purchaseData" href="<%=request.getContextPath()%>/purchasedata.do?memberId=<%=loginMember.getMemberId()%>"><span>결제 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link active" id="historyData" href="<%=request.getContextPath()%>/historydata.do?memberId=<%=loginMember.getMemberId()%>"><span>이용정보</span></a>
        </li>
    </ul>

    <div id="subMenu">
		<ul class="nav nav-tabs">
	        <li class="nav-item">
	            <a class="nav-link" id="rentalHistory" href="<%=request.getContextPath()%>/historydata.do?memberId=<%=loginMember.getMemberId()%>">대여반납이력</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" id="psTicket" href="<%=request.getContextPath()%>/possessionHistory.do?memberId=<%=loginMember.getMemberId()%>">이용권 보유내역</a>
	        </li>
	        <li class="nav-item active">
	            <a class="nav-link" id="mileageHistory" href="<%=request.getContextPath()%>/mileage.do?memberId=<%=loginMember.getMemberId()%>">마일리지</a>
	        </li>
	    </ul>
		<div id="subMenu-detail" class="row justify-content-center">
		<div>
			<table>
				<tr colspan='4'><h2>총 마일리지 : <%=totalMileage %></h2></tr>
    			<tr>
			        <th>날짜</th>
			        <th>내용</th>	        
			        <th>사용 마일리지</th>
			        <th>적립 마일리지</th>
    			</tr>
    			<%if(!mileageHistory.isEmpty()) {
        			for(PurchaseHistory mH : mileageHistory){%>
        		<tr>
		            <td><%=mH.getPurchaseDate()%></td>
		            <td><%=mH.getTicketCode()%></td>
		            <td><%=mH.getMileageDeduction()%></td>
		            <td><%=mH.getMileageSave()%></td>
        		</tr>
			    <%}
			     }else{ %>
			    <tr>
			      	<td colspan='4'>조회된 결과가 없습니다.</td>
			    </tr>
			     <%} %>
    
			</table>
			<ul id="pageBar" class="pagination">
				<%=pageBar %>
			</ul>
			</div>
		</div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <style>
        #mypageHeaderNav{
        	padding-top:100px;
            padding-left: 100px;
            padding-right: 100px;
        }
        #mypageHeaderNav span{
            font-size: 30px;
        }
        body {
            padding-left: 300px;
            padding-right: 300px;
            border:1px solid red;
        }
        #subMenu-detail {
        	/* border:1px solid red; */
        	/* margin:auto; */
        	display:flex;
        	justify-content: center;
        }
        table {
        width: 800px;
        }
    </style>
    <script type="text/javascript">
	$("tr").attr("class","border rounded");
	</script>
</body>
</html>
