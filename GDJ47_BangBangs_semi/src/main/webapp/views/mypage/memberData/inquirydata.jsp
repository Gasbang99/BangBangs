<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.IbBoard" %>
<% 	List<IbBoard> ibBoards=(List<IbBoard>)request.getAttribute("ibBoards"); 
	String pageBar=(String)request.getAttribute("pageBar");%>

    <%@ page import="com.bbs.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp" %>
    <ul id="mypageHeaderNav" class="nav nav-pills  justify-content-center">
        <li class="nav-item ">
            <a class="nav-link active" id="memberData" href="<%=request.getContextPath()%>/memberdata.do?memberId=<%=loginMember.getMemberId()%>"><span>회원 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="purchaseData" href="<%=request.getContextPath()%>/purchasedata.do?memberId=<%=loginMember.getMemberId()%>"><span>결제 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="historyData" href="<%=request.getContextPath()%>/historydata.do?memberId=<%=loginMember.getMemberId()%>"><span>이용정보</span></a>
        </li>
    </ul>

    <div id="subMenu" >
    	<ul class="nav nav-tabs">
	        <li class="nav-item">
	            <a class="nav-link" id="change" href="<%=request.getContextPath()%>/memberdata.do?memberId=<%=loginMember.getMemberId()%>">회원정보수정</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link active" id="inquiry" href="<%=request.getContextPath()%>/inquirydata.do?memberId=<%=loginMember.getMemberId()%>">문의내용</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" id="resign" href="<%=request.getContextPath()%>/resignmember.do?memberId=<%=loginMember.getMemberId()%>">회원탈퇴</a>
	        </li>
		</ul>

		<div id="subMenu-detail" >
		<div>
			<table>
    			<tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>작성일</th>
			        <th>내용</th>
    			</tr>
    			<%if(ibBoards.isEmpty()) {%>
        			<tr>
					      	<td colspan='4'>조회된 결과가 없습니다.</td>
					    </tr>	
			    	<%}else{ 
			    		for(IbBoard b : ibBoards){%>
        				<tr>
		            		<td><%=b.getIbPostNum() %></td>
		            		<td>
		                		<a href="<%=request.getContextPath()%>/board/boardView.do?no=<%=b.getIbPostNum()%>">
		                		<%=b.getIbTitle() %>
		                		</a>
		            		</td>
				            <td><%=b.getIbEnrollDate() %></td>
				            <td><%=b.getIbContent() %></td>
        				</tr>
			    	<%}
			     } %>
    
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
            /* border:1px solid red; */
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
