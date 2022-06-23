<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/footer.jsp" %>

<div id="wrapper">
	<form name="enrollMemberFrm" action="<%=request.getContextPath() %>/enrollmemberend.do" method="POST" class="joinForm" onsubmit="return fn_enrollmemberValidate();">                                                                                           
      <h2 style="font-weight:bolder;">대여하기</h2>
      <div class="textForm">
		<select name="gender" id="gender" required>
			<option value="">대여소</option>
			<option value="남">남자</option>
			<option value="여">여자</option>
		</select> 
	  </div>
	  <div></div>
	  <div class="textForm">
		<select name="gender" id="gender" required>
			<option value="">자전거</option>
			<option value="남">남자</option>
			<option value="여">여자</option>
		</select> 
	  </div>
	  <div></div>
      <input type="submit" class="btn" value="J O I N"/>
    </form>
 </div>
	  
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
	        		  url : "<%=request.getContextPath()%>/findidend.do?mailAddress="+$("#email").val()+"&name="+$("#name").val(),
						dataType : "json",
						async:false,
						success : data=>{
							$("#userId").val(data);
						},
						error : (r,d)=>{
							console.log(r);
							console.log(d);
						}
	        	  })
	        	  if($("#userId").val()=="no"){
	        		  $("#emailMsg").text("인증번호를 발송에 실패했습니다. 이름과 이메일을 다시 확인해주세요.");
	              		$("#emailMsg").css("color","red");
	        	  }else{
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
	          }
			})
			
			$("#crtfcNoBtn").click(e=>{
				const crtfcNo1 = $("#crtfcNo").val();
				const crtfcNo2 = $("#crtfcNoCk").val();
				if(crtfcNo1==crtfcNo2){
					$("#crtfcNoMsg").text("본인확인이 완료되었습니다!");
                    $("#crtfcNoMsg").css("color","green");
                    open("<%=request.getContextPath()%>/findidmsg.do?id="+$("#userId").val(), "", "width=300,height=200");
				}else{
					$("#crtfcNoMsg").text("인증번호가 맞지 않습니다.");
                    $("#crtfcNoMsg").css("color","red");
				}
			})
			
			$("#loginBtn").click(e=>{
				location.assign("<%=request.getContextPath()%>/login.do");
			})
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
	.name {
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
    position: relative;
    left: 40%;
    transform: translateX(-50%);
    margin-top: 40px;
    margin-bottom: 40px;
    width: 80%;
    background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
    background-position: left;
    background-size: 200%;
    color: white;
    font-weight: bold;
    border: none;
    cursor: pointer;
    transition: 0.4s;
    display: inline;
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
