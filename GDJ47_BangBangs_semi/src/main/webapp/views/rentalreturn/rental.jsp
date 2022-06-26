<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.payment.model.vo.PossessionTicket,java.util.List" %>
<%
	List<PossessionTicket> pslist = (List<PossessionTicket>)request.getAttribute("pslist");
%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/footer.jsp" %>

	<%if(pslist.isEmpty()){ %>
		<form name="enrollrentalhistory" action="<%=request.getContextPath() %>/enrollrentalhistory.do" method="POST" class="joinForm">                                                                                           
        	<h2>사용가능한 이용권이 없습니다.<br>이용권을 구매해주세요.</h2>
			<input type="button" class="btn" id="buyBtn" value="이 용 권 구 매 하 기">
		</form>
	<%}else{ %>
		<%int count=0; %>
		<%for(PossessionTicket p : pslist){
			if((p.getPsTicketActive()).equals("활성")){
				count++;
			}
		}%>
		<%if(count>0){ %>
			<div id="wrapper">
				<form name="enrollrentalhistory" action="<%=request.getContextPath() %>/enrollrentalhistory.do" method="POST" class="joinForm">                                                                                           
			      <h2 style="font-weight:bolder;">대여하기</h2>
			      <div class="textForm">
			      	<%String tn = ""; %>
						<%for(PossessionTicket p : pslist){ %>
							<%if(p.getPsTicketActive().equals("활성")){ %>
								<%if(p.getPsTicketCode().contains("D")) tn+="일일권 ";
								else if(p.getPsTicketCode().contains("W")) tn+="7일권 ";
								else if(p.getPsTicketCode().contains("M")) tn+="30일권 ";
								else if(p.getPsTicketCode().contains("H")) tn+="180일권 ";
								else if(p.getPsTicketCode().contains("Y")) tn+="365일권 ";
								%>
								<%if(p.getPsTicketCode().contains("1")) tn+="1시간";
								if(p.getPsTicketCode().contains("2")) tn+="2시간";%>
							<%} %>
						<%} %>
			      	<h3 class="name" style="color:grey"><%=tn %></h3>
			      </div>
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
					<select name="bike" id="bike" required>
						<option value="">자전거</option>
					</select> 
				  </div>
				  <div></div>
			      <input type="submit" class="btn" value="대 여 하 기"/>
			    </form>
			 </div>
 		<%}else{ %>
 			<div id="wrapper">
				<form name="enrollrentalhistory" action="<%=request.getContextPath() %>/enrollrentalhistory.do" method="POST" class="joinForm">                                                                                           
			      <h2 style="font-weight:bolder;">대여하기</h2>
			      <div class="textForm">
			      	<select name="possessionticket" id="possessionticket" required>
						<option value="">보유 이용권</option>
						<%String tn = ""; %>
						<%for(PossessionTicket p : pslist){ %>
							<%if(p.getPsTicketCode().contains("D")) tn+="일일권 ";
							else if(p.getPsTicketCode().contains("W")) tn+="7일권 ";
							else if(p.getPsTicketCode().contains("M")) tn+="30일권 ";
							else if(p.getPsTicketCode().contains("H")) tn+="180일권 ";
							else if(p.getPsTicketCode().contains("Y")) tn+="365일권 ";
							%>
							<%if(p.getPsTicketCode().contains("1")) tn+="1시간";
							if(p.getPsTicketCode().contains("2")) tn+="2시간";%>
							<option value="<%=p.getPsTicketId() %>"><%=tn%></option>
							<%tn="";%>
						<%} %>
					</select> 
			      </div>
			      <div></div>
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
					<select name="bike" id="bike" required>
						<option value="">자전거</option>
					</select> 
				  </div>
				  <div></div>
			      <input type="submit" class="btn" value="대 여 하 기"/>
			    </form>
			 </div>
 		<%} %>
	<%}%>
	  
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
		  
		  $("#rentalshop").change(e=>{
			  const val = e.target.value;
			  $.ajax({
					url : "<%=request.getContextPath()%>/findbike.do?rentalshop="+val,
					dataType : "json",
					success : data=>{
						$("#bike").children().remove();
						const firstOption = $("<option>").attr("value","").text("자전거");
						$("#bike").append(firstOption);
						for(let i=0; i<data.length; i++){
							let option = $("<option>").attr("value",Object.values(data[i])[0]).text(Object.values(data[i])[0]);
							$("#bike").append(option);
						}
					},
					error : (r,d)=>{
						console.log(r);
						console.log(d);
					}
				})
		  })
		  
		  $("#buyBtn").click(e=>{
			  location.assign("<%=request.getContextPath()%>/member.do");
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
	
	#rentalshop {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: black;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	#possessionticket {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: black;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	#bike {
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
