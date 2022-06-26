
<%@page import="java.util.List"%>
<%@page import="com.bbs.payment.model.vo.PurchaseHistory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.IbBoard" %>
<% 	List<PurchaseHistory>  pH=(List<PurchaseHistory>)request.getAttribute("purchaseHistory"); 
	
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
            <a class="nav-link  active" id="purchaseData" href="<%=request.getContextPath()%>/purchasedata.do?memberId=<%=loginMember.getMemberId()%>"><span>결제 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="historyData" href="<%=request.getContextPath()%>/historydata.do?memberId=<%=loginMember.getMemberId()%>"><span>이용정보</span></a>
        </li>
    </ul>

    <div id="subMenu">
		<ul class="nav nav-tabs">
	        <li class="nav-item">
	            <a class="nav-link active" id="purchaseHistory" href="<%=request.getContextPath()%>/purchasedata.do?memberId=<%=loginMember.getMemberId()%>">결제내역</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" id="refundHistory" href="<%=request.getContextPath()%>/refundHistory.do?memberId=<%=loginMember.getMemberId()%>">환불내역</a>
	        </li>
		</ul>
		<div id="subMenu-detail"  class="row justify-content-center">
		<div>
			<table>
    			<tr>
			        <th>결제상품</th>
			        <th>금액</th>
			        <th>결제날짜</th>
			        <th>결제수단</th>
			        <th>환불</th>
    			</tr>
    			<%if(!pH.isEmpty()) {
        			for(PurchaseHistory b : pH){%>
        		<tr>
		            <td id="<%=b.getPurchaseId()%>"></td>
		            <td><%=b.getPaymentAmount()%></td>
		            <td><%=b.getPurchaseMethod()%></td>
		            <td><%=b.getPurchaseDate() %></td>
		            <td><form action="<%=request.getContextPath()%>/"><input type="submit" value="환불"></form></td>
		            <script>
        			$.ajax({
        				url:"<%=request.getContextPath()%>/findTicketName.do?ticketCode=<%=b.getTicketCode()%>",
        						dataType:"json",
        						success:data=>{
        							console.log(data);
        							$("#<%=b.getPurchaseId()%>").text(data);
        						},
        						error : (r,d)=>{
        							console.log(r);
        							console.log(d);
        						}
        			});
        		</script>
        		</tr>
        		
			    <%}
			     }else{ %>
			    <tr>
			      	<td colspan='5'>조회된 결과가 없습니다.</td>
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
        