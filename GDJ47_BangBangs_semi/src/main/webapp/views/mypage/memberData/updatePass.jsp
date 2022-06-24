<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form action="<%=request.getContextPath()%>/updatePassEnd.do">
		<input type="hidden" name="memberId" value="<%=request.getParameter("memberId")%>">
		<div class="input-group input-group-sm mb-3">
			<span class="input-group-text" id="inputGroup-sizing-sm">현재비밀번호</span>
			<input type="password" class="form-control" aria-label="Sizing  input"
					aria-describedby="inputGroup-sizing-sm" name="password" required>
		</div>
		<div class="input-group input-group-sm mb-3">
			<span class="input-group-text" id="inputGroup-sizing-sm">새비밀번호</span>
			<input type="password" class="form-control" aria-label="Sizing  input"
					aria-describedby="inputGroup-sizing-sm" id="password_new" name="password_new" required>
		</div>
		<div id="password_newChk"></div>
		<div class="input-group input-group-sm mb-3">
			<span class="input-group-text" id="inputGroup-sizing-sm">새비밀번호확인</span>
			<input type="password" class="form-control" aria-label="Sizing  input"
			 		aria-describedby="inputGroup-sizing-sm" id="password_chk" name="password_chk" required>
		</div>
		<div id="passwordCheck"></div>
		<input type="hidden" value="변경" id="changeButton" />&nbsp;
		
	</form>
	<button onclick="window.close();">닫기</button>
	
	<script>

	$("#password_new").keyup(e=>{ // 비밀번호
        regPw=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
        const pwVal=e.target.value;
        if(!regPw.test(pwVal)){
            $("#password_newChk").text("비밀번호는 8글자 이상 16글자 이하, 숫자, 특수기호, 영문 대 소문자를 반드시 포함해야합니다.");
            $("#password_newChk").css("color","red");
            $("#changeButton").attr("type","hidden");
        }else{
			$("#password_newChk").text("안전한 비밀번호에요!");
            $("#password_newChk").css("color","green");
        }
    })
	
	$("#password_chk").keyup(e=>{ 
		regPw=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
        const pwck=e.target.value;
        const pwVal=$("#password_new").val();
        if(pwck.length>0){
            if((pwck==pwVal)&&(regPw.test(pwVal))){
                $("#passwordCheck").text("비밀번호가 일치합니다!");
                $("#passwordCheck").css("color","green");
                $("#changeButton").attr("type","submit");            }else{
                $("#passwordCheck").text("비밀번호가 일치하지 않습니다.");
                $("#passwordCheck").css("color","red");
                $("#changeButton").attr("type","hidden");
            }
        }
    })
	</script>
</body>
</html>