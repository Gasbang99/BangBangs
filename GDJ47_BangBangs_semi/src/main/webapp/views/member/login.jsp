<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies!=null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId = c.getValue();
			}
		}
	}
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
		* {
	    margin: 0;
	    padding: 0;
	    font-family: sans-serif;
		}
		.wrap {
		    height: 100%;
		    width: 100%;
		    background-position: center;
		    background-size: cover;
		    position: absolute;
		    
		}
		.form-wrap {
		    width: 380px;
		    height: 500px;
		    position: relative;
		    margin: 6% auto;
		    background: #fff;
		    padding: 5px;
		    overflow: hidden;
		    border: 1px solid grey;
		    border-radius: 60px;
		}
		.title-wrap {
		    width: 230px;
		    margin: 35px auto;
		    position: relative;
		    border-radius: 30px;
		    text-align: center;
		    font-size: 35px;
		    
		}
		.input-group {
		    top: 150px;
		    position: absolute;
		    width: 280px;
		    transition: .5s;
		    
		}
		.input-field {
		    width: 100%;
		    padding: 10px 0;
		    margin: 5px 0;
		    border: none;
		    border-bottom: 1px solid #999;
		    outline: none;
		    background: transparent;
		}
		.submit {
		    width: 100%;
		    padding: 10px 30px;
		    cursor: pointer;
		    display: block;
		    margin: auto;
		    background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
			color:white;
	  		font-weight: bold;
		    border: 0;
		    outline: none;
		    border-radius: 30px;
		}
		.submit1 {
		    width: 100%;
		    padding: 10px 30px;
		    cursor: pointer;
		    display: block;
		    margin: auto;
		    background: gray;
			color:white;
	  		font-weight: bold;
		    border: 0;
		    outline: none;
		    border-radius: 30px;
		}
		.checkbox {
		    margin: 30px 10px 30px 0;
		    
		}
		span {
		    color: #777;
		    font-size: 12px;
		    bottom: 68px;
		    position: absolute;
		}
		#login {
		    left: 50px;
		}
		.find_wrap {
			top: 400px;
		    position: absolute;
		    width: 280px;
		    transition: .5s;
		    display: flex;
		    list-style-type: none;
		    justify-content: space-around;
			margin-left: 45px;
		    
		}
		.find_text{
			font-size: 12px;
			text-decoration: none;
			color: black;
		}
		#sub-wrap{
			font-size: 14px;
		    color: #222;
		    letter-spacing: -.5px;
		    margin: 0;
		    -webkit-text-size-adjust: none;
		    font-family: -apple-system,BlinkMacSystemFont,helvetica,"Apple SD Gothic Neo",sans-serif;
		    list-style: none;
		    padding: 20px 0 35px;
		    text-align: center;
		}
	
	</style>
</head>
<body>
	<div class="wrap">
	    <div class="form-wrap">
	        <div class="title-wrap"><h2>방방쓰</h2></div>
	        <form id="login" action="<%= request.getContextPath() %>/loginend.do" method="post" class="input-group">
	            <input name="id" type="text" class="input-field" placeholder="아이디를 입력하세요" value="<%=saveId!=null?saveId:""%>" required>
	            <input name="password" type="password" class="input-field" placeholder="비밀번호를 입력하세요" required>
	            <label><input type="checkbox" class="checkbox" <%=saveId!=null?"checked":"" %>>아이디 저장</label>
				<div><input type="submit" class="submit" value="L O G I N"></div>	
				<div style="margin-top:5px"><input type="button" id="nonmember" class="submit1" value="비회원로그인"></div>		
	        </form>
	        <div id="sub-wrap" style="margin-top:100px">
	        	<ul class="find_wrap" id="find_wrap" style="margin-top:30px">
	                <li><a href="findid.do"
	                       class="find_text">아이디 찾기</a></li>
	                <li>|</li>
	                <li><a href="findpw.do"
	                       class="find_text">비밀번호 찾기</a></li>
	                <li>|</li>
	                <li><a href="<%=request.getContextPath() %>/enrollmember.do"
	                	   class="find_text">회원가입</a></li>
	            </ul>
	        </div>
	    </div>
	</div>
	
	<script>
	   $("#nonmember").click(e=>{
		   location.assign("<%=request.getContextPath() %>/nonmember.do");
	   })
	</script>
	<style>
		* {
	    margin: 0;
	    padding: 0;
	    font-family: sans-serif;
		}
		.wrap {
		    height: 100%;
		    width: 100%;
		    background-position: center;
		    background-size: cover;
		    position: absolute;
		    
		}
		.form-wrap {
		    width: 380px;
		    height: 500px;
		    position: relative;
		    margin: 6% auto;
		    background: #fff;
		    padding: 5px;
		    overflow: hidden;
		    border: 1px solid grey;
		    border-radius: 60px;
		}
		.title-wrap {
		    width: 230px;
		    margin: 35px auto;
		    position: relative;
		    border-radius: 30px;
		    text-align: center;
		    font-size: 35px;
		    
		}
		.input-group {
		    top: 150px;
		    position: absolute;
		    width: 280px;
		    transition: .5s;
		    
		}
		.input-field {
		    width: 100%;
		    padding: 10px 0;
		    margin: 5px 0;
		    border: none;
		    border-bottom: 1px solid #999;
		    outline: none;
		    background: transparent;
		}
		.submit {
		    width: 100%;
		    padding: 10px 30px;
		    cursor: pointer;
		    display: block;
		    margin: auto;
		    background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
			color:white;
	  		font-weight: bold;
		    border: 0;
		    outline: none;
		    border-radius: 30px;
		}
		.submit1 {
		    width: 100%;
		    padding: 10px 30px;
		    cursor: pointer;
		    display: block;
		    margin: auto;
		    background: gray;
			color:white;
	  		font-weight: bold;
		    border: 0;
		    outline: none;
		    border-radius: 30px;
		}
		.checkbox {
		    margin: 30px 10px 30px 0;
		    
		}
		span {
		    color: #777;
		    font-size: 12px;
		    bottom: 68px;
		    position: absolute;
		}
		#login {
		    left: 50px;
		}
		.find_wrap {
			top: 400px;
		    position: absolute;
		    width: 280px;
		    transition: .5s;
		    display: flex;
		    list-style-type: none;
		    justify-content: space-around;
			margin-left: 45px;
		    
		}
		.find_text{
			font-size: 12px;
			text-decoration: none;
			color: black;
		}
		#sub-wrap{
			font-size: 14px;
		    color: #222;
		    letter-spacing: -.5px;
		    margin: 0;
		    -webkit-text-size-adjust: none;
		    font-family: -apple-system,BlinkMacSystemFont,helvetica,"Apple SD Gothic Neo",sans-serif;
		    list-style: none;
		    padding: 20px 0 35px;
		    text-align: center;
		}
	
	</style>
	
</body>
</html>