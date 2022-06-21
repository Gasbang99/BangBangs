<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div style="height:100px"></div>
<div id="total">
	<div id="voucher">
		<nav class="nav nav-pills nav-fill">	  
			  <a class="nav-link active" id="btn1" aria-current="page" href="#">정기권</a>
			  <a class="nav-link" href="#" id="btn2">일일권</a>
			  <a class="nav-link" href="#" id="btn3">정기권 선물하기</a>
			  <a class="nav-link" href="#" id="btn4">일일권 선물하기</a>
		</nav>
	</div>
    <div id="ppap"></div>
</div>
    <%@ include file="/views/common/footer.jsp" %>    
<<<<<<< HEAD
    <script>   	
    	$.ajax({
			url : "<%=request.getContextPath()%>/possessionmileage.do?id=<%=loginMember.getMemberId()%>",
			dataType : "json",
			success : data=>{
				$("#posseMile").val(data);
			},
			error : (r,d)=>{
				console.log(r);
				console.log(d);
			}
		})
    	
	    function comPayment() {
	        var p = document.getElementById("comPaymentClsCd").value;
	        document.getElementById("TOT_AMOUNT1").value=p;
	        var i = document.getElementById("TOT_AMOUNT2").value;
	        document.getElementById("TOT_AMOUNT3").value=p-i;
	    }   	
	    function comPayment1() {
	        var i = document.getElementById("mileage1").value;
	        var m = $("#posseMile").val();
	        console.log(m);
	        console.log(i);
	        if(parseInt(i)>parseInt(m) || i>1000){
	        	alert("마일리지는 보유 마일리지에서 100단위로 최대 1000 마일리지까지 사용할 수 있습니다.");
	        	if(m>1000){
	        		$("#mileage1").val(1000);	        		
	        	}else{
	        		$("#mileage1").val(Math.floor(m/100)*100);
	        	}
	        }
	        document.getElementById("TOT_AMOUNT2").value=-i;
	        var p = document.getElementById("comPaymentClsCd").value;
	    	document.getElementById("TOT_AMOUNT3").value=p-i;
	    }
    </script>
    <script>
    	$("#btn1").attr("class","nav-link active");
		$.ajax({
			url:"<%=request.getContextPath()%>/seasonticket.do",
			dataType:"html",
			success:data=>{
				$("#ppap").html(data);
			}
		});
	$("#btn1").click(e=>{
    	$("#btn1").attr("class","nav-link active");
        $("#btn2").attr("class","nav-link")
        $("#btn3").attr("class","nav-link")
        $("#btn4").attr("class","nav-link")
		$.ajax({
			url:"<%=request.getContextPath()%>/seasonticket.do",
			dataType:"html",
			success:data=>{
				$("#ppap").html(data);
			}
		});
	});
	$("#btn2").click(e=>{
        $("#btn1").attr("class","nav-link")
        $("#btn2").attr("class","nav-link active")
        $("#btn3").attr("class","nav-link")
        $("#btn4").attr("class","nav-link")
		$.ajax({
			url:"<%=request.getContextPath()%>/onedayticket.do",
			dataType:"html",
			success:(data)=>{
				console.log(data);
				$("#ppap").html(data);
			}
		});
	});
	$("#btn3").click(e=>{
        $("#btn1").attr("class","nav-link")
        $("#btn2").attr("class","nav-link")
        $("#btn3").attr("class","nav-link active")
        $("#btn4").attr("class","nav-link")
		$.ajax({
			url:"<%=request.getContextPath()%>/seasonticketgift.do",
			dataType:"html",
			success:(data)=>{
				console.log(data);
				$("#ppap").html(data);
			}
		});
	});
	$("#btn4").click(e=>{
        $("#btn1").attr("class","nav-link")
        $("#btn2").attr("class","nav-link")
        $("#btn3").attr("class","nav-link")
        $("#btn4").attr("class","nav-link active")
		$.ajax({
			url:"<%=request.getContextPath()%>/onedayticketgift.do",
			dataType:"html",
			success:(data)=>{
				console.log(data);
				$("#ppap").html(data);
			}
		});
	});
    </script>
    <style>
    	#selecttype{
    		border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 500px;
        	height:100px;
        	margin-left: 40px;
    	}
    	#selecttype1{
    		border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 500px;
        	height:200px;
        	margin-left: 40px;
    	}
    	#totalprice{
    		style=text-align:left;
    		font-weight:bolder;
    		border-width:2px;   		
    	}
    	.btn:hover{
    		color:white;
    	}
    	#btn{
    		margin-top:20px;
    		width: 100%;
			background-color: #24384a;
			border-radius: 3px;
			height: 60px;
			line-height: 60px;
			font-size: 22px;
			color: white;
			font-weight: bold;
			display: block;		      
    	}
    	.btn{
    		font-family: 'notokr-regular', sans-serif;
		    -webkit-text-size-adjust: none;
		    text-align: center;
		    margin: 0;
		    padding: 0;
		    text-decoration: none;
		    width: 100%;
		    background-color: #24384a;
		    border-radius: 3px;
		    height: 60px;
		    line-height: 60px;
		    font-size: 22px;
		    color: #fff;
		    font-weight: bold;
		    display: block;
		    cursor: pointer;
    	}
    	#agree{
    		font-wight:bolder;
    	}
    	#use{
    		style=text-align:left;
    		font-weight:bolder;
    		border-top : 1px solid black;
    		border-width:2px;
    	}
    	#mileage{
    		style=text-align:left;
    		font-weight:bolder;
    		border-bottom : 1px solid black;
    		border-width:2px;
    	}
    	#voucher{
    		display:flex;
    	}   	
    	#AmountOfPayment,#mileage2{
    		font-weight:bolder;
    	}
    	#TOT_AMOUNT1{
    		font-size:100%;
    		text-align:right;
    		border:none;
    		outline: none;
    	}
    	#TOT_AMOUNT2{
    		font-size:100%;
    		text-align:right;
    		border:none;
    		outline: none;
    	}
    	#TOT_AMOUNT3{
    		font-size:100%;
    		text-align:right;
    		border:none;
    		outline: none;
    	}
        span{
            color: red;
            font-weight: bold;
        }
        #comPaymentClsCd{
            background: #fff;          
            border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 400px;
        	height:auto;  
        	margin-left: 40px;
        	margin-top:10px;     	
        }
        #comPaymentClsCd1{
            background: #fff;          
            border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 500px;
        	height:auto;  
        	margin-top:30px;   
        	margin-left:40px;  	
        }
        #comPaymentClsCd2{
            background: #fff;          
            border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 500px;
        	height:auto;  
        	margin-top:30px;   
=======
    <script>
    	$.ajax({
			url : "<%=request.getContextPath()%>/possessionmileage.do?id=<%=loginMember.getMemberId()%>",
			dataType : "json",
			success : data=>{
				$("#posseMile").val(data);
			},
			error : (r,d)=>{
				console.log(r);
				console.log(d);
			}
		})
    	
	    function comPayment() {
	        var p = document.getElementById("comPaymentClsCd").value;
	        document.getElementById("TOT_AMOUNT1").value=p;
	    }
	    function comPayment1() {
	        var i = document.getElementById("mileage1").value;
	        var m = $("#posseMile").val();
	        console.log(m);
	        console.log(i);
	        if(parseInt(i)>parseInt(m) || i>1000){
	        	alert("마일리지는 보유 마일리지에서 100단위로 최대 1000 마일리지까지 사용할 수 있습니다.");
	        	if(m>1000){
	        		$("#mileage1").val(1000);	        		
	        	}else{
	        		$("#mileage1").val(Math.floor(m/100)*100);
	        	}
	        }
	        document.getElementById("TOT_AMOUNT2").value=-i;
	        var p = document.getElementById("comPaymentClsCd").value;
	    	document.getElementById("TOT_AMOUNT3").value=p-i;
	    }
    </script>
    <script>
    	$("#btn1").attr("class","nav-link active");
		$.ajax({
			url:"<%=request.getContextPath()%>/seasonticket.do",
			dataType:"html",
			success:data=>{
				$("#ppap").html(data);
			}
		});
	$("#btn1").click(e=>{
    	$("#btn1").attr("class","nav-link active");
        $("#btn2").attr("class","nav-link")
        $("#btn3").attr("class","nav-link")
        $("#btn4").attr("class","nav-link")
		$.ajax({
			url:"<%=request.getContextPath()%>/seasonticket.do",
			dataType:"html",
			success:data=>{
				$("#ppap").html(data);
			}
		});
	});
	$("#btn2").click(e=>{
        $("#btn1").attr("class","nav-link")
        $("#btn2").attr("class","nav-link active")
        $("#btn3").attr("class","nav-link")
        $("#btn4").attr("class","nav-link")
		$.ajax({
			url:"<%=request.getContextPath()%>/onedayticket.do",
			dataType:"html",
			success:(data)=>{
				console.log(data);
				$("#ppap").html(data);
			}
		});
	});
	$("#btn3").click(e=>{
        $("#btn1").attr("class","nav-link")
        $("#btn2").attr("class","nav-link")
        $("#btn3").attr("class","nav-link active")
        $("#btn4").attr("class","nav-link")
		$.ajax({
			url:"<%=request.getContextPath()%>/seasonticketgift.do",
			dataType:"html",
			success:(data)=>{
				console.log(data);
				$("#ppap").html(data);
			}
		});
	});
	$("#btn4").click(e=>{
        $("#btn1").attr("class","nav-link")
        $("#btn2").attr("class","nav-link")
        $("#btn3").attr("class","nav-link")
        $("#btn4").attr("class","nav-link active")
		$.ajax({
			url:"<%=request.getContextPath()%>/onedayticketgift.do",
			dataType:"html",
			success:(data)=>{
				console.log(data);
				$("#ppap").html(data);
			}
		});
	});
    </script>
    <style>
    	#selecttype{
    		border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 400px;
        	height:100px;
        	margin-left: 40px;
    	}
    	#totalprice{
    		style=text-align:left;
    		font-weight:bolder;
    		border-width:2px;   		
    	}
    	.btn:hover{
    		color:white;
    	}
    	#btn{
    		margin-top:20px;
    		width: 100%;
			background-color: #24384a;
			border-radius: 3px;
			height: 60px;
			line-height: 60px;
			font-size: 22px;
			color: white;
			font-weight: bold;
			display: block;		      
    	}
    	.btn{
    		font-family: 'notokr-regular', sans-serif;
		    -webkit-text-size-adjust: none;
		    text-align: center;
		    margin: 0;
		    padding: 0;
		    text-decoration: none;
		    width: 100%;
		    background-color: #24384a;
		    border-radius: 3px;
		    height: 60px;
		    line-height: 60px;
		    font-size: 22px;
		    color: #fff;
		    font-weight: bold;
		    display: block;
		    cursor: pointer;
    	}
    	#agree{
    		font-wight:bolder;
    	}
    	#use{
    		style=text-align:left;
    		font-weight:bolder;
    		border-top : 1px solid black;
    		border-width:2px;
    	}
    	#mileage{
    		style=text-align:left;
    		font-weight:bolder;
    		border-bottom : 1px solid black;
    		border-width:2px;
    	}
    	#voucher{
    		display:flex;
    	}   	
    	#AmountOfPayment{
    		font-weight:bolder;
    	}
    	#TOT_AMOUNT1{
    		font-size:100%;
    		text-align:right;
    		border:none;
    		outline: none;
    	}
    	#TOT_AMOUNT2{
    		font-size:100%;
    		text-align:right;
    		border:none;
    		outline: none;
    	}
    	#TOT_AMOUNT3{
    		font-size:100%;
    		text-align:right;
    		border:none;
    		outline: none;
    	}
        span{
            color: red;
            font-weight: bold;
        }
        #comPaymentClsCd{
            background: #fff;          
            border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 400px;
        	height:auto;  
        	margin-left: 40px;
        	margin-top:10px;     	
        }
        #comPaymentClsCd1{
            background: #fff;          
            border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 400px;
        	height:auto;  
        	margin-top:30px;     	
>>>>>>> branch 'BangBangs' of https://github.com/Gasbang99/BangBangs.git
        }
        #seasonticket{
            border: solid 1px black;
        }
        #paybox {
	    font-family: 'notokr-regular', sans-serif;
	    -webkit-text-size-adjust: none;
	    text-align: left;
	    color: #333;
	    font-size: 100%;
	    background-color: #fff;
	    border: 4px #000 solid;
	    height: 550px;
	    line-height: 1.5;
	    padding: 30px;
	    position: relative;
	    right: 100;
	    top: 150px;
	    width: 500px;
	    box-sizing: border-box;
	    margin: 10px 15px 0 15px;
	    float: right;
	    position: absolute;
	    left: 1200px;
	    margin: 150px 15px 0 20px;
		}
        #total{
        	margin-left:400px;
        	height:1000px;
        }
        #w30{
        	width:50px;
        }
    </style>
</body>
    
</html>
