<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a class="nav-link " id="purchaseData" href="<%=request.getContextPath()%>/purchasedata.do"><span>결제 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="historyData" href="<%=request.getContextPath()%>/historydata.do"><span>이용정보</span></a>
        </li>
    </ul>

    <div id="subMenu">
    	<ul class="nav nav-tabs">
	        <li class="nav-item">
	            <a class="nav-link active" id="change" href="<%=request.getContextPath()%>/memberdata.do?memberId=<%=loginMember.getMemberId()%>">회원정보수정</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" id="inquiry" href="<%=request.getContextPath()%>/inquirydata.do?memberId=<%=loginMember.getMemberId()%>">문의내용</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" id="resign" href="<%=request.getContextPath()%>/resignmember.do?memberId=<%=loginMember.getMemberId()%>">회원탈퇴</a>
	        </li>
		</ul>

		<div id="subMenu-detail">
		<form action="<%=request.getContextPath()%>/changememberdata.do">
			<div style="text-align:center;">
				<table>
				    <tr>
				        <td>아이디</td>
				        <td><input type="text" name="member_Id" id="member_Id" class="form-control"
										value="<%=m.getMemberId()%>" readonly>
						</td>
				    </tr>
				    <tr>
				        <td>회원등급</td>
				        <td><input type="text" name="member_level" id="member_level" class="form-control"
										value="<%=m.getMemberLevel()%>" readonly>
						</td>
				    </tr>
				    <tr>
				        <td>비밀번호</td>
				        <td>
				        	<div class="input-group input-group-sm mb-3">
			  					<span class="input-group-text" id="inputGroup-sizing-sm">현재비밀번호</span>
			  					<input type="text" class="form-control" aria-label="Sizing  input" aria-describedby="inputGroup-sizing-sm">
							</div>
				        	<div class="input-group input-group-sm mb-3">
			  					<span class="input-group-text" id="inputGroup-sizing-sm">새비밀번호</span>
			  					<input type="text" class="form-control" aria-label="Sizing  input" aria-describedby="inputGroup-sizing-sm">
							</div>
				        	<div class="input-group input-group-sm mb-3">
			  					<span class="input-group-text" id="inputGroup-sizing-sm">새비밀번호확인</span>
			  					<input type="text" class="form-control" aria-label="Sizing  input" aria-describedby="inputGroup-sizing-sm">
							</div>
				        </td>
				    </tr>
				    <tr>
				        <td>이름</td>
				        <td>
				        <input type="text" name="member_name" id="member_name" class="form-control"
										value="<%=m.getMemberName()%>" readonly>
				        </td>
				    </tr>
				    <tr>
				        <td>성별</td>
				        <td>
				        <input type="text" name="gender" id="gender" class="form-control"
										value="<%=m.getGender()%>" readonly>
				        </td>
				    </tr>
				    <tr>
				        <td>생일</td>
				        <td>
				        <input type="text" name="birthday" id="birthday" class="form-control"
										value="<%=m.getBirthday()%>" readonly>
				        </td>
				    </tr>
				    <tr>
				        <td>이메일</td>
				        <td>
				        <input type="text" name="email" id="email" class="form-control"
										value="<%=m.getEmail()%>" readonly>
				        </td>
				    </tr>
				    <tr>
				        <td>전화번호</td>
				        <td>
				        <input type="text" name="phone" id="phone" class="form-control"
										value="<%=m.getPhone()%>" readonly>
				        </td>
				    </tr>
				    <tr>
				        <td>주소</td>
				        <td>
				        <input type="text" name="address" id=""address"" class="form-control"
										value="<%=m.getAddress()%>" readonly>
				        </td>
				    </tr>
				    <tr>
				        <td>계정생성일자</td>
				        <td>
				        <input type="text" name="enroll-date" id="enroll-date" class="form-control"
										value="<%=m.getEnrollDate()%>" readonly>
				        </td>
				    </tr>
				    <tr>
				    	<td colspan="2"><button type="submit">수정하기</button></td>
				    </tr>
				</table>
				</div>
			</form>
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