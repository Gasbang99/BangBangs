<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

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
    <script>
    function comPayment() {
        var p = document.getElementById("comPaymentClsCd").value;
        document.getElementById("TOT_AMOUNT1").value=p;
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
        $("#btn3").attr("class","nav-link")
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
        $("#btn3").attr("class","nav-link")
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
        	margin-top:10px;     	
        }
        #seasonticket{
            border: solid 1px black;
        }
        #paybox{
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
            top: 0;
            width: 400px;
            box-sizing: border-box;
            margin: 10px 15px 0 15px;
            float:right;
            position:absolute;
            left:850px;
            top:220px;
            margin: 150px 15px 0 20px
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
