<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	* {
	  margin: 0px;
	  padding: 0px;
	  text-decoration: none;
	  font-family:sans-serif;
	
	}
	
	body {
	  background-image:#34495e;
	}
	
	.joinForm {
	  position:absolute;
	  width:400px;
	  height:400px;
	  padding: 30px, 20px;
	  background-color:#FFFFFF;
	  text-align:center;
	  top:40%;
	  left:50%;
	  transform: translate(-50%,-50%);
	  border-radius: 15px;
	}
	
	.joinForm h2 {
	  text-align: center;
	  margin: 30px;
	}
	
	.textForm {
	  border-bottom: 2px solid #adadad;
	  margin: 30px;
	  padding: 10px 10px;
	  display: flex;
	}
	
	
	.id {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	.pw {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	.name {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	.email {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	#birthYear {
	  width: 40%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	#birthMonth {
	  width: 20%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}

	#birthDay {
	  width: 40%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}

	#gender {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}

	.cellphoneNo {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	.btn {
	  position:relative;
	  left:40%;
	  transform: translateX(-50%);
	  margin-top: 40px;
	  margin-bottom: 40px;
	  width:80%;
	  height:40px;
	  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
	  background-position: left;
	  background-size: 200%;
	  color:white;
	  font-weight: bold;
	  border:none;
	  cursor:pointer;
	  transition: 0.4s;
	  display:inline;
	}
	
	.btn:hover {
	  background-position: right;
	}
</style>
</head>
<body>
	<form action="<%=request.getContextPath() %>/enrollmember.do" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">                                                                                           
      <h2>회원가입</h2>
      <div class="textForm">
        <input name="loginId" type="text" id="id" class="id" placeholder="아이디">
      </div>
	  <div id="idMsg"></div>
      <div class="textForm">
        <input name="loginPw" type="password" id="pw" class="pw" placeholder="비밀번호">
      </div>
	  <div id="pwMsg"></div>
      <div class="textForm">
        <input name="loginPwConfirm" type="password" id="pwConfirm" class="pw" placeholder="비밀번호 확인">
      </div>
	  <div id="pwConfirmMsg"></div>
      <div class="textForm">
        <input name="name" type="text" id="name" class="name" placeholder="이름">
      </div>
	  <div></div>
	  <div class="textForm">
		<input type="text" id="birthYear" name="birthYear" placeholder="년(4자)"> 
		<select name="birthMonth" id="birthMonth">
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
		<input type="text" name="birthDay" id="birthDay" placeholder="일" maxlength="2">
	  </div>
	  <div id="birth"></div>
	  <div class="textForm">
		<select name="gender" id="gender">
			<option value="">성별</option>
			<option value="남">남자</option>
			<option value="여">여자</option>
		</select> 
	  </div>
	  <div></div>
	  <div class="">
		<input type="text" id="sample4_postcode" placeholder="우편번호">
		<input type="button" id="daumPostcode" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소">
		<input type="text" id="sample4_extraAddress" placeholder="참고항목">
	  </div>
      <div class="textForm">
        <input name="email" type="text" id="email" class="email" placeholder="이메일">
      </div>
	  <div id="emailMsg"></div>
      <div class="textForm">
        <input name="cellphoneNo" type="text" id="cellphoneNo" class="cellphoneNo" placeholder="휴대전화 번호">
      </div>
	  <div id="phoneMsg"></div>
      <input type="submit" class="btn" value="J O I N"/>
    </form>

	<script>
		$(()=>{
            $("input").focus(e=>{ // 선택하면 밑줄 초록색으로
                $(e.target).parent().css("border-color","green");
            })
			$("select").click(e=>{ // 선택하면 밑줄 초록색으로
                $(e.target).parent().css("border-color","green");
            })
            $("input, select").blur(e=>{ // 벗어나면 밑줄 원래대로 / 입력 안하고 벗어날시 메세지 출력
                $(e.target).parent().css("border-color","#adadad");
                const val=e.target.value;
                if(val.length==0){
                    $(e.target).parent().next().text("필수 정보입니다.");
                    $(e.target).parent().next().css("color","red");
                }
            })

			$("input").keyup(e=>{ // 입력시 필수정보 메세지 사라짐
                const val=e.target.value;
                if(val.length>0){
                    $(e.target).parent().next().text("");
                }
            })
            $("select").change(e=>{ // select에서 값 선택시 필수정보 메세지 사라짐
                const val=e.target.value;
                if(val.length>0){
                    $(e.target).parent().next().text("");
                }
            })

            $("#id").keyup(e=>{ // 아이디 체크
                regid=/^[a-z0-9][a-z0-9_-]{4,19}$/;
                const id=e.target.value;
                if(!regid.test(id)){
                    $("#idMsg").text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
                    $("#idMsg").css("color","red");
                }else{
                    $("#idMsg").text("멋진 아이디네요!");
                    $("#idMsg").css("color","green");
                }
            })

            $("#pw").keyup(e=>{ // 비밀번호
                regPw=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
                const pwVal=e.target.value;
                if(!regPw.test(pwVal)){
                    $("#pwMsg").text("비밀번호는 8글자 이상 16글자 이하, 숫자, 특수기호, 영문 대 소문자를 반드시 포함해야합니다.");
                    $("#pwMsg").css("color","red");
                }else{
					$("#pwMsg").text("안전한 비밀번호에요!");
                    $("#pwMsg").css("color","green");
                }
            })
            $("#pwConfirm").keyup(e=>{ // 비밀번호 확인
                const pwck=e.target.value;
                const pwVal=$("#pw").val();
                if(pwck.length>0){
                    if(pwck==pwVal){
                        $("#pwConfirmMsg").text("비밀번호가 일치합니다!");
                        $("#pwConfirmMsg").css("color","green");
                    }else{
                        $("#pwConfirmMsg").text("비밀번호가 일치하지 않습니다.");
                        $("#pwConfirmMsg").css("color","red");
                    }
                }
            })

            $("#birthYear").blur(e=>{ // 생년월일
                regYear=/[0-9]{4}/;
                const year=e.target.value;
                if(!regYear.test(year)){
                    $("#birth").text("태어난 년도 4자리를 정확하게 입력하세요.");
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

            $("#email").blur(e=>{
                reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                const email=e.target.value;
                if(!reg.test(email)){
                    $("#emailMsg").text("이메일 주소를 다시 확인해주세요.");
                    $("#emailMsg").css("color","red");
                }else{
                    $("#emailMsg").text("멋진 이메일이에요!");
					$("#emailMsg").css("color","green");
                }
            })

            $("#cellphoneNo").blur(e=>{
                reg=/^01(?:0|1|[6-9])-?(?:\d{3}|\d{4})-?\d{4}$/;
                const phone=e.target.value;
                if(!reg.test(phone)){
                    $("#phoneMsg").text("형식에 맞지 않는 번호입니다.");
                    $("#phoneMsg").css("color","red");
                }else{
                    $("#phoneMsg").text("좋은 번호네요!");
                    $("#phoneMsg").css("color","green");
                }
            })

			//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
			$("#daumPostcode").click(e=>{
				new daum.Postcode({
					oncomplete: function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if(data.buildingName !== '' && data.apartment === 'Y'){
						extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if(extraRoadAddr !== ''){
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
						
						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if(roadAddr !== ''){
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if(data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if(data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
			})
		});
	</script>
</body>
</html>