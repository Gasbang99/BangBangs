


<%@page import="java.util.List"%>
<%@page import="com.bbs.model.vo.RentalHistory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.bbs.model.vo.IbBoard" %>
<% 	List<RentalHistory> rentalHistory=(List<RentalHistory>)request.getAttribute("rentalHistory"); 
	String pageBar=(String)request.getAttribute("pageBar");%>
	
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
	            <a class="nav-link active" id="rentalHistory" href="<%=request.getContextPath()%>/historydata.do?memberId=<%=loginMember.getMemberId()%>">대여반납이력</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" id="psTicket" href="<%=request.getContextPath()%>/possessionHistory.do?memberId=<%=loginMember.getMemberId()%>">이용권 보유내역</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" id="mileageHistory" href="<%=request.getContextPath()%>/mileage.do?memberId=<%=loginMember.getMemberId()%>">마일리지</a>
	        </li>
	    </ul>
		<div id="subMenu-detail" class="row justify-content-center">
		<div>
			<table>
    			<tr>
			        <th>자전거번호</th>
			        <th>대여날짜</th>	        
			        <th>반납날짜</th>
			        <th>사용시간</th>
    			</tr>
    			<%if(!rentalHistory.isEmpty()) {
        			for(RentalHistory r : rentalHistory){%>
        		<tr>
		            <td><%=r.getBikeId()%></td>
		            <td><%=r.getRentalStartTime()%></td>
		            <td><%=r.getRentalReturnTime()%></td>
		            <td><%=r.getRentalUsedTime()%></td>
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
