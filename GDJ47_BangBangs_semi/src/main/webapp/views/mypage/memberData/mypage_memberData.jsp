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
            <a class="nav-link " id="purchaseData" href="<%=request.getContextPath()%>/purchasedata.do?memberId=<%=loginMember.getMemberId()%>"><span>결제 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="historyData" href="<%=request.getContextPath()%>/historydata.do?memberId=<%=loginMember.getMemberId()%>"><span>이용정보</span></a>
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
				        	<button onclick="updatePass();" class="btn btn-secondary">수정하기</button>
				        </td>
				    </tr>
				    <tr>
				        <td>이름</td>
				        <td>
				        <input type="text" name="member_name" id="member_name" class="form-control"
										value="<%=m.getMemberName()%>" >
				        </td>
				    </tr>
				    <tr>
				        <td>성별</td>
				        <td>
				        <input type="text" name="gender" id="gender" class="form-control"
										value="<%=m.getGender()%>" >
				        </td>
				    </tr>
				    <tr>
				        <td>생일</td>
				        <td>
				        	<div class="textForm">
								<input type="text" id="birthYear" name="birthYear" class="form-control" placeholder="연도(4자)" required> 
								<select name="birthMonth" id="birthMonth" class="form-select"	 required>
									<option value="">월</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select> 
								<input type="text" name="birthDay" id="birthDay" class="form-control" placeholder="일" maxlength="2" required>
								<div id="birth"></div>
						  </div>
				        </td>
				    </tr>
				    <tr>
				        <td>이메일</td>
				        <td>
				        <input type="text" name="email" id="email" class="form-control"
										value="<%=m.getEmail()%>" >
				        </td>
				    </tr>
				    <tr>
				        <td>전화번호</td>
				        <td>
				        <input type="text" name="phone" id="phone" class="form-control"
										value="<%=m.getPhone()%>" >
				        </td>
				    </tr>
				    <tr>
				        <td>주소</td>
				        <td>
					        <input type="text" class="form-control" id="sample6_postcode" name="postcode" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" name="postcode" value="우편번호 찾기"><br>
							<input type="text" class="form-control" id="sample6_address" name="address" placeholder="주소"><br>
							<input type="text" class="form-control" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
							<input type="text" class="form-control" id="sample6_extraAddress" name="extraAddress" placeholder="참고항목">
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
				    	<td colspan="2"><button type="submit" class="btn btn-secondary">수정하기</button></td>
				    </tr>
				</table>
				</div>
			</form>
		</div>
    </div>

	<script>
		const updatePass=()=>{
			open("<%=request.getContextPath()%>/updatePass.do?memberId=<%=m.getMemberId()%>", "_blank",
			"width=400, height=210");
		}
		
		$("#birthYear").blur(e=>{ // 생년월일
            regYear=/[0-9]{4}/;
            const year=e.target.value;
            if(!regYear.test(year)){
                $("#birth").text("태어난 연도 4자리를 정확하게 입력하세요.");
                $("#birth").css("color","red");
            }else{
                $("#birth").text("태어난 월을 선택하세요.");
                $("#birth").css("color","red");
                $("#birthMonth").on({
                    "change":e=>{
                        const month=e.target.value;
                        if(month.length==0){
                            $("#birth").text("태어난 월을 선택하세요.");
                            $("#birth").css("color","red");
                        }else if(month.length>0){
                            $("#birth").text("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
                            $("#birth").css("color","red");
                            $("#birthDay").blur(e=>{
                                regDay=/(0[1-9]|[12][0-9]|3[01])/;
                                const day=e.target.value;
                                if(!regDay.test(day)){
                                    $("#birth").text("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
                                    $("#birth").css("color","red");
                                }
                                if(regDay.test(day)){
                                    $("#birth").text("좋은 생일 날짜네요!");
									$("#birth").css("color","green");
                                }
                            })
                        }
                    },
                    "blur":e=>{
                        const month=e.target.value;
                        if(month.length==0){
                            $("#birth").text("태어난 월을 선택하세요.");
                            $("#birth").css("color","red");
                        }
                    }
                })
            }
        })
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
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
        
        #birth {
        	width:622px;
        }
    </style>
    <script type="text/javascript">
	$("tr").attr("class","border rounded");
	</script>
    
</body>
</html>