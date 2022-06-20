<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.Member" %>
    

<%
	Member m=(Member)request.getAttribute("member");
%>

<form action="">
	<div style="text-align:center;">
		<table>
		    <tr>
		        <td>아이디</td>
		        <td><input type="text" name="memberId" id="memberId_" class="form-control"
								value="<%=m.getMemberId()%>" readonly>
				</td>
		    </tr>
		    <tr>
		        <td>회원등급</td>
		        <td><input type="text" name="memberId" id="memberId_" class="form-control"
								value="<%=m.getMemberLevel()%>" readonly>
				</td>
		    </tr>
		    <tr>
		        <td>비밀번호</td>
		        <td>
		        	<div class="input-group input-group-sm mb-3">
	  					<span class="input-group-text" id="inputGroup-sizing-sm">현재비밀번호</span>
	  					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
					</div>
		        	<div class="input-group input-group-sm mb-3">
	  					<span class="input-group-text" id="inputGroup-sizing-sm">새비밀번호</span>
	  					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
					</div>
		        	<div class="input-group input-group-sm mb-3">
	  					<span class="input-group-text" id="inputGroup-sizing-sm">새비밀번호확인</span>
	  					<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
					</div>
		        </td>
		    </tr>
		    <tr>
		        <td>이름</td>
		        <td>
		        <input type="text" name="memberId" id="memberId_" class="form-control"
								value="<%=m.getMemberName()%>" readonly>
		        </td>
		    </tr>
		    <tr>
		        <td>성별</td>
		        <td>
		        <input type="text" name="memberId" id="memberId_" class="form-control"
								value="<%=m.getGender()%>" readonly>
		        </td>
		    </tr>
		    <tr>
		        <td>나이</td>
		        <td>
		        <input type="text" name="memberId" id="memberId_" class="form-control"
								value="<%=m.getBirthday()%>" readonly>
		        </td>
		    </tr>
		    <tr>
		        <td>이메일</td>
		        <td>
		        <input type="text" name="memberId" id="memberId_" class="form-control"
								value="<%=m.getEmail()%>" readonly>
		        </td>
		    </tr>
		    <tr>
		        <td>전화번호</td>
		        <td>
		        <input type="text" name="memberId" id="memberId_" class="form-control"
								value="<%=m.getPhone()%>" readonly>
		        </td>
		    </tr>
		    <tr>
		        <td>주소</td>
		        <td>
		        <input type="text" name="memberId" id="memberId_" class="form-control"
								value="<%=m.getAddress()%>" readonly>
		        </td>
		    </tr>
		    <tr>
		        <td>계정생성일자</td>
		        <td>
		        <input type="text" name="memberId" id="memberId_" class="form-control"
								value="<%=m.getEnrollDate()%>" readonly>
		        </td>
		    </tr>
		</table>
		</div>

</form>

<script type="text/javascript">
	$("tr").attr("class","border rounded");
</script>
<%@ include file="/views/common/footer.jsp" %>