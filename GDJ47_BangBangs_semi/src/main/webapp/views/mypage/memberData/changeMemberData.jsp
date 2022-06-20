<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.Member" %>
    

<%
	Member m=(Member)request.getAttribute("member");
%>

<form>
	<table>
	    <tr>
	        <td>아이디</td>
	        <td><input type="text" name="memberId" id="memberId_" class="form-label"
							<%-- value="<%=//m.getMemberId()%>" --%> readonly></td>
	    </tr>
	    <tr>
	        <td>회원등급</td>
	        <td><input type="text" name="memberId" id="memberId_" class="form-label"
							<%-- value="<%=//m.getMemberLevel()%>" --%> readonly></td>
	    </tr>
	    <tr>
	        <td>비밀번호</td>
	        <td></td>
	    </tr>
	    <tr>
	        <td>이름</td>
	        <td></td>
	    </tr>
	    <tr>
	        <td>성별</td>
	        <td></td>
	    </tr>
	    <tr>
	        <td>나이</td>
	        <td></td>
	    </tr>
	    <tr>
	        <td>이메일</td>
	        <td></td>
	    </tr>
	    <tr>
	        <td>전화번호</td>
	        <td></td>
	    </tr>
	    <tr>
	        <td>주소</td>
	        <td></td>
	    </tr>
	    <tr>
	        <td>계정생성일자</td>
	        <td></td>
	    </tr>
	</table>
</form>

<script type="text/javascript">
	$("tr").attr("class","border rounded");
</script>
<%@ include file="/views/common/footer.jsp" %>