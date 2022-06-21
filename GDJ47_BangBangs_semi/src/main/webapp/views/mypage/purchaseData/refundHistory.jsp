
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.IbBoard" %>
<% 	IbBoard ibBoards=(IbBoard)request.getAttribute("ibBoard"); 
	
	String pageBar=(String)request.getAttribute("pageBar");%>
	
    <%@ page import="com.bbs.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp" %>
    <ul id="mypageHeaderNav" class="nav nav-pills  justify-content-center">
        <li class="nav-item ">
            <a class="nav-link active" id="memberData" href="<%=request.getContextPath()%>/memberdata.do"><span>회원 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="purchaseData" href="<%=request.getContextPath()%>/purchasedata.do"><span>결제 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="historyData" href="<%=request.getContextPath()%>historydata.do"><span>이용정보</span></a>
        </li>
    </ul>

    <div id="subMenu">
		<ul class="nav nav-tabs">
	        <li class="nav-item">
	            <a class="nav-link" id="purchaseHistory" href="<%=request.getContextPath()%>/purchasedata.do">결제내역</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link active" id="refundHistory" href="<%=request.getContextPath()%>/refundHistory.do">환불내역</a>
	        </li>
		</ul>
		<div id="subMenu-detail">
			<table>
    			<tr>
			        <th>상품이름</th>
			        <th>금액</th>
			        <th>환불날짜</th>
    			</tr>
    			<%if(!ibBoards.isEmpty()) {
        			for(IbBoard b : ibBoards){%>
        		<tr>
		            <td><%=b.getIbPostNum() %>
		            </td>
		            <td>
		                <a href="<%=request.getContextPath()%>/board/boardView.do?no=<%=b.getIbPostNum()%>">
		                <%=b.getIbTitle() %>
		                </a>
		            </td>
		            <td><%=b.getIbEnrollDate() %></td>
		     
        		</tr>
			    <%}
			     }else{ %>
			    <tr>
			      	<td colspan='4'>조회된 결과가 없습니다.</td>
			    </tr>
			     <%} %>
    
			</table>
			<div id="pageBar">
				<%=pageBar %>
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
        #subMenu {
        	border:1px solid red;
        }
    </style>
    <script type="text/javascript">
	$("tr").attr("class","border rounded");
	</script>
</body>
</html>
        