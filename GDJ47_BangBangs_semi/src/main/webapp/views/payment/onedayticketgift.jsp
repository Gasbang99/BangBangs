<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/footer.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=medium-dpi" name="viewport">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link href="/css/jquery-ui.css" rel="stylesheet" type="text/css">
        <script id="frogue-embed" src="https://danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js"></script><script type="text/javascript" src="/js/jquery-1.12.4.js"></script> 
        <script type="text/javascript" src="/js/jquery-ui.js"></script>
        <script type="text/javascript" src="/js/easing/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="/js/gibberish-aes.js"></script>
        <script type="text/javascript" src="/js/jquery.simpler-sidebar.min.js"></script>
        <script type="text/javascript" src="/js/jquery-confirm.js"></script>
        <script type="text/javascript" src="/js/comm.js"></script>
        <script type="text/javascript" src="/js/common_spb.js"></script>
        
        <link rel="stylesheet" href="/css/style_kr_v2.css?ver=0412" type="text/css">
        <link rel="stylesheet" href="/css/common.css" type="text/css">
        <link rel="stylesheet" href="/css/jquery-confirm.css">
        <!--[if lt IE 9]>
        <link href="/css/pw.css" title="ie8chn" rel="stylesheet" type="text/css" />
        <script src="/js/html5.js"></script>
        <script src="/js/respond.min.js"></script>
        <![endif]-->
        <link id="frogue-embed-css" rel="stylesheet" href="https://danbee.ai/js/plugins/frogue-embed/frogue-embed.min.css"></head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정기권 선물하기</title>
</head>
<body>
<div id="total">
	<div id="voucher">
		<nav class="nav nav-pills nav-fill">	  
			  <a class="nav-link" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/seasonticket.jsp">정기권</a>
			  <a class="nav-link" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/onedayticket.jsp">일일권</a>
			  <a class="nav-link" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/groupticket.jsp">단체권</a>
			  <a class="nav-link" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/seasonticketgift.jsp">정기권 선물하기</a>
			  <a class="nav-link active" aria-current="page" href="http://localhost:9090/GDJ47_BangBangs_semi/views/payment/onedayticketgift.jsp">일일권 선물하기</a>
		</nav>
	</div>
	<div>
        <h1>일일권 선물하기</h1>
    </div>
    <div style="margin-left:30px;margin-top:50px;">
        <h3>이용권 사용안내</h3>
    </div>  
    <ul style="margin-left:30px;">
        <li>1회 1매씩 구매가 가능합니다</li>
        <li>기본대여시간은 <span>1시간권(60분),2시간권(120분)</span>입니다</li>
        <li>초과시 5분마다 추가요금(200원)과금됩니다</li>
        <span>예시)기본 초과 1분~5분:200원,6분~10분:400원</span>
        <li>추가요금은 이용권 결제수단으로 자동결제됩니다</li>
    </ul>

    <div id="selecttype">
        <p style="font-weight: bold;">&nbsp;일일권종류선택</p>
           <select id="comPaymentClsCd" name="comPaymentClsCd" class="fl" style="width: 55%" onchange="comPayment();">
                <option id="selectDefaltGen" value="">선택</option>
                <option id="BIL_001" value="1000" etc1="1000" etc2="1000">일일 회원(1시간권)</option>
                <option id="BIL_002" value="2000" etc1="2000" etc2="2000">일일 회원(2시간권)</option>
            </select> 
            <p>&nbsp;</p> 
    </div>
    <br>
        <p style="font-weight: bold;">선물 받는 사람</p>
        <input type="number">전화번호
    
    <br><br>
    <div id="comPaymentClsCd">
        <p style="font-weight: bold;">&nbsp;결제방식</p>
        <table>
            <tr>
                <td>
                    <label>
                        <input type="radio" name="pay" value="toss" id="w30"><img src="https://play-lh.googleusercontent.com/W607uSRreW4h6Ar4reYPYCtYXID0_AIsd9m2fgWwdAN7JyZGG3WVM782wa5CfCvKZVM" width="15" height="15">toss
                    </label>
                    <label>
                        <input type="radio" name="pay" value="kakao" id="w30"><img src="https://play-lh.googleusercontent.com/W43xj43ErMIs5BQgCdMKEa0NXCoUUW8DjQc5SxcDfLrC26H8sHDmoFIUWLYmsQahpo0" width="15" height="15">kakao
                    </label>
                    <label>
                        <input type="radio" name="pay" value="card" id="w30">신용/체크카드
                    </label>
                    <label>
                        <input type="radio" name="pay" value="phone" id="w30">휴대전화
                    </label>
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>
    </div>
</div>
</div>
    <div id="paybox">
        <h3 id="AmountOfPayment">결제금액</h3><br><br>
        <p id="use">이용권&nbsp;&nbsp;&nbsp;
        <input type="text" class="w80" id="TOT_AMOUNT1" name="TOT_AMOUNT" value="0" readonly="readonly">
        <span style="color:black">원</span></p>
       
        <p id="totalprice">총 금액&nbsp;&nbsp;
        <input type="text" class="w80" id="TOT_AMOUNT3" name="TOT_AMOUNT" value="0" readonly="readonly">
        <span style="color:black">원</span></p>
        
       	<label><input type="checkbox" id="agree">추가요금자동결제,환불규정, 이용약관에 동의하며 결제를 진행합니다.(이용권 사용안내)<br></label>
        <label><input type="checkbox" id="agree">만 13세 미만의 미성년자가 서비스를 이용하는 경우, 사고 발생 시 보험 적용을 받을 수 없는 등의 불이익을 받으실 수 있습니다. (만 15세 미만의 경우 상법 제732조에 의거하여 사망 보험 적용 불가)</label>
        <br>
        <div id="btn">
		  <button class="btn" type="button">결제하기</button>		  
		</div>
    </div>
    <style>
    	#voucher{
	    	display:flex;
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
    	#totalprice{
    		style=text-align:left;
    		font-weight:bolder;
    		border-width:2px;   		
    	}
        span{
            color: red;
            font-weight: bold;
        }
        #selecttype{
    		border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 400px;
        	height:100px;
    	}
        #comPaymentClsCd{
            background: #fff;          
            border: 1px solid #000;
    		box-sizing: border-box;
    		box-shadow: 5px 3px 3px #ccc;    	
            width: 400px;
        	height:auto;  
        	margin-top:10px;  
        	margin-10px;   	       
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
        #AmountOfPayment{
    		font-weight:bolder;
    	}
    	#TOT_AMOUNT1{
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
    	#use{
    		style=text-align:left;
    		font-weight:bolder;
    		border-top : 1px solid black;
    		border-width:2px;
    		border-bottom:2px solid black;
    	}
    </style>
    <script>
    function comPayment() {
        var p = document.getElementById("comPaymentClsCd").value;
        document.getElementById("TOT_AMOUNT1").value=p;
    }
    </script>
</body>
    
</html>

