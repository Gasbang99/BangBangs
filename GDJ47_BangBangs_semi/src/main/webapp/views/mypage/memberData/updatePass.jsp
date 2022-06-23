<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div class="input-group input-group-sm mb-3">
			<span class="input-group-text" id="inputGroup-sizing-sm">새비밀번호확인</span>
			<input type="password" class="form-control" aria-label="Sizing  input"
			 		aria-describedby="inputGroup-sizing-sm" id="password_chk" name="password_chk" required>
		</div>
		<div id="passwordCheck"></div>
		<input type="submit" value="변경" id="changeButton" disabled/>&nbsp;
		
	</form>
	<button onclick="window.close();">닫기</button>
	
	<script>
	$("#password_chk").keyup(e=>{ 
        const pwck=e.target.value;
        const pwVal=$("#password_new").val();
        if(pwck.length>0){
            if(pwck==pwVal){
                $("#passwordCheck").text("비밀번호가 일치합니다!");
                $("#passwordCheck").css("color","green");
                $("#changeButton").disabled= false;
            }else{
                $("#passwordCheck").text("비밀번호가 일치하지 않습니다.");
                $("#passwordCheck").css("color","red");
                $("#changeButton").disabled= true;
            }
        }
    })
	</script>
</body>
</html>