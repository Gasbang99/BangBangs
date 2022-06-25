<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/footer.jsp" %>

<div id="wrapper">
	<form name="enrollrentalhistory" action="<%=request.getContextPath() %>/enrollrentalhistory.do" method="POST" class="joinForm" onsubmit="return fn_returnBikeValidate();">                                                                                           
      <h2 style="font-weight:bolder;">반납하기</h2>
      <div class="textForm">
		<select name="rentalshop" id="rentalshop" required>
			<option value="">대여소</option>
			<option value="GAS_BANG">GAS_BANG</option>
			<option value="MINGOOSE">MINGOOSE</option>
			<option value="JJULIUS">JJULIUS</option>
			<option value="DRAGON_CASTLE">DRAGON_CASTLE</option>
			<option value="JUN_DRAGON">JUN_DRAGON</option>
		</select> 
	  </div>
	  <div></div>
	  <div class="textForm">
		<label id="brokenReport"><input type="checkbox" name="brokenReport"> 고장 신고하기</label>
	  </div>
	  <div></div>
	  <div class="textForm">
	  	  <label><input type="checkbox" name="brokenArea" id="brokenArea1" value="타이어"> 타이어</label>&nbsp;&nbsp;
		  <label><input type="checkbox" name="brokenArea" id="brokenArea2" value="안장"> 안장</label>&nbsp;&nbsp;
		  <label><input type="checkbox" name="brokenArea" id="brokenArea3" value="페달"> 페달</label>&nbsp;&nbsp;
		  <label><input type="checkbox" name="brokenArea" id="brokenArea4" value="체인"> 체인</label>&nbsp;&nbsp;
		  <label><input type="checkbox" name="brokenArea" id="brokenArea5" value="기타"> 기타</label>
	  </div>
	  <div id="checkedOrNot"></div>
	  <div class="textForm">
	  	<textarea cols="50" rows="5" name="brokenContent" id="brokenContent" style="resize: none;"></textarea>
	  </div>
	  <div></div>
      <input type="submit" class="btn" value="대 여 하 기"/>
    </form>
 </div>
	  
	  <script>
	  $(()=>{
		  $("input, textarea").focus(e=>{ // 선택하면 밑줄 초록색으로
	          $(e.target).parent().css("border-color","green");
	      })
	      $("select").click(e=>{ // 선택하면 밑줄 초록색으로
                $(e.target).parent().css("border-color","green");
          })
          $("label").mouseover(e=>{ // 선택하면 밑줄 초록색으로
                $(e.target).parent().css("border-color","green");
          })
	      
	      $("input, select, textarea").blur(e=>{ // 벗어나면 밑줄 원래대로 / 입력 안하고 벗어날시 메세지 출력
	                $(e.target).parent().css("border-color","#adadad");
	                const val=e.target.value;
	                if(val.length==0){
	                    $(e.target).parent().next().text("필수 정보입니다.");
	                    $(e.target).parent().next().css("color","red");
	                }
           })
           $("label").mouseout(e=>{
            	$(e.target).parent().css("border-color","#adadad");
           })
            
           
           const fn_returnBikeValidate=()=>{
        	   if(!($("input[name=brokenArea]").is(":checked"))){
     			  $("#checkedOrNot").text("필수 정보입니다.");
                  $("#checkedOrNot").css("color","red");
                  return false;
     		  }else{
    			  $("#checkedOrNot").text("");
    			  return true;
    		  }
           }
	
			$("input, textarea").keyup(e=>{ // 입력시 필수정보 메세지 사라짐
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
	
	#rentalshop {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: black;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	#brokenReport {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: black;
	  font-size:16px;
	  height:25px;
	  background: none;
	  text-align:left;
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
