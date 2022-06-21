<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	div#checkId-container{
		text-align:center;
		padding-top:50px;
	}
	span#duplicated{
		color:red;
		font-weight:bolder;
	}
</style>
</head>
<body>
<div id="checkId-container">
	입력한 정보와 일치하는 아이디입니다.
	방방쓰 아이디 : <span><%=id %></span>
	<br><br>
	<button type="button">닫기</button>
	</div>
	<script>
		const btn=document.querySelector("[type=button]");
		btn.addEventListener("click",(e)=>{
			close();
		});
	</script>
</body>
</html>