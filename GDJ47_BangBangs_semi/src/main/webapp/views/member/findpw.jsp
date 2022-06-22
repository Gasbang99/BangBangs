<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<section class="joinForm">
<h2>비밀번호 찾기</h2>
<div class="textForm">
        <input name="loginId" type="text" id="id" class="id" placeholder="아이디를 입력하세요." required>
		<input type="button" id="idCkBtn" class="button" value="아이디 확인">
      </div>
	  <div id="idMsg"></div>
<div class="textForm">
        <input name="email" type="text" id="email" class="email" placeholder="가입시 등록한 이메일 입력" required>
		<input type="button" id="sendBtn" class="button" value="인증번호 받기">
      </div>
	  <div id="emailMsg"></div>
	  <div class="textForm">
	  	<input type="hidden" id="crtfcNoCk">
        <input type="text" name="crtfcNo" id="crtfcNo" class="email" placeholder="인증번호 입력" required>
		<input type="button" id="crtfcNoBtn" class="button" value="인증번호 확인">
      </div>
	  <div id="crtfcNoMsg"></div>
	  <input type="button" id="loginBtn" class="btn" value="L O G I N 하기"/>
	  </section>
	  
	  <script>
	  $(()=>{
		  $("input").focus(e=>{ // 선택하면 밑줄 초록색으로
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
		  
		  $("#sendBtn").click(e=>{
				reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	          const email=$("#email").val();
	          if(!reg.test(email)){
	              $("#emailMsg").text("이메일 주소를 다시 확인해주세요.");
	              $("#emailMsg").css("color","red");
	          }
	          else{
	          	$.ajax({
						url : "<%=request.getContextPath()%>/sendmail.do?mailAddress="+$("#email").val(),
						dataType : "json",
						success : data=>{
							$("#crtfcNoCk").val(data);
						},
						error : (r,d)=>{
							console.log(r);
							console.log(d);
						}
					})
					$("#emailMsg").text("인증번호를 발송했습니다. 이메일을 확인하세요.");
	              $("#emailMsg").css("color","green");
	          }
			})
			
			$("#crtfcNoBtn").click(e=>{
				const crtfcNo1 = $("#crtfcNo").val();
				const crtfcNo2 = $("#crtfcNoCk").val();
				if(crtfcNo1==crtfcNo2){
					$("#crtfcNoMsg").text("본인확인이 완료되었습니다!\n임시 비밀번호를 이메일로 보냈습니다.");
                    $("#crtfcNoMsg").css("color","green");
                    $.ajax({
						url : "<%=request.getContextPath()%>/sendTemporaryPassword.do?mailAddress="+$("#email").val()+"&id="+$("#id").val(),
						dataType : "json",
						success : data=>{
							
						},
						error : (r,d)=>{
							console.log(r);
							console.log(d);
						}
					})
				}else{
					$("#crtfcNoMsg").text("인증번호가 맞지 않습니다.");
                    $("#crtfcNoMsg").css("color","red");
				}
			})
<<<<<<< HEAD
=======
			
			$("#loginBtn").click(e=>{
				location.assign("<%=request.getContextPath()%>/login.do");
			})
>>>>>>> branch 'BangBangs' of https://github.com/Gasbang99/BangBangs.git
	  })
	  
	  $("#idCkBtn").click(e=>{
	    		const userId = $("#id").val();
	    		regid=/^[a-z0-9][a-z0-9_-]{4,19}$/;
	    		if(!regid.test(userId)){
	                alert("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
	    			$("#id").focus();
	    		}else{
	    			
	    		}
			})
	  </script>
	  
	  <style>
	  * {
	  margin: 0px;
	  padding: 0px;
	  text-decoration: none;
	  font-family:sans-serif;
	
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
	  color: black;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	.email {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: black;
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
	.button{
		background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
		  background-position: left;
		  color:white;
		  font-weight: bold;
		  border:none;
		  cursor:pointer;
	}
	  </style>
</body>
</html>