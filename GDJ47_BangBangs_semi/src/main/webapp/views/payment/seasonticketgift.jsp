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
    <div>
        <h1>정기권 선물하기</h1>
    </div>
    <div>
        <h3>이용권 사용안내</h3>
    </div>  
    <ul>
        <li>1회 1매씩 구매가 가능합니다</li>
        <li>기본대여시간은 <span>1시간권(60분),2시간권(120분)</span>입니다</li>
        <li>초과시 5분마다 추가요금(200원)과금됩니다</li>
        <span>예시)기본 초과 1분~5분:200원,6분~10분:400원</span>
        <li>추가요금은 이용권 결제수단으로 자동결제됩니다</li>
    </ul>

    <div id="selecttype">
        <p style="font-weight: bold;">정기권종류선택</p>
           <select id="comPaymentClsCd" name="comPaymentClsCd" class="fl" style="width: 55%" onchange="comPayment();">
                <option id="selectDefaltGen" value="">선택</option>
                <option id="BIL_001" value="3000" etc1="3000" etc2="3000">7일(1시간권)</option>
                <option id="BIL_002" value="5000" etc1="5000" etc2="5000">30일(1시간권)</option>
                <option id="BIL_004" value="15000" etc1="15000" etc2="15000">180일(1시간권)</option>
                <option id="BIL_005" value="30000" title="Y" etc1="30000" etc2="30000">365일(1시간권)</option>
                <option id="BIL_011" value="4000" etc1="4000" etc2="4000">7일(2시간권)</option>
                <option id="BIL_012" value="7000" etc1="7000" etc2="7000">30일(2시간권)</option>
                <option id="BIL_014" value="20000" etc1="20000" etc2="20000">180일(2시간권)</option>
                <option id="BIL_015" value="40000" title="Y" etc1="40000" etc2="40000">365일(2시간권)</option>
            </select>  
    </div>
    <br>
        <p style="font-weight: bold;">선물 받는 사람</p>
            
    
    <br><br>
    <div id="comPaymentClsCd">
        <p style="font-weight: bold;">결제방식</p>
        <table>
            <tr>
                <td>
                    <label>
                        <input type="radio" name="pay" value="toss"><img src="https://play-lh.googleusercontent.com/W607uSRreW4h6Ar4reYPYCtYXID0_AIsd9m2fgWwdAN7JyZGG3WVM782wa5CfCvKZVM" width="15" height="15">toss
                    </label>
                    <label>
                        <input type="radio" name="pay" value="kakao"><img src="https://play-lh.googleusercontent.com/W43xj43ErMIs5BQgCdMKEa0NXCoUUW8DjQc5SxcDfLrC26H8sHDmoFIUWLYmsQahpo0" width="15" height="15">kakao
                    </label>
                    <label>
                        <input type="radio" name="pay" value="card">신용/체크카드
                    </label>
                    <label>
                        <input type="radio" name="pay" value="phone">휴대전화
                    </label>
                </td>
            </tr>
        </table>
    </div>
</div>
</div>
    <div id="paybox" style="margin: 10px 15px 0 15px;">
        <p>결제금액</p>
        <input type="text" class="w80" id="TOT_AMOUNT" name="TOT_AMOUNT" value="0" readonly="readonly">
        <span style="color:green">원</span>
    </div>
    <style>
        span{
            color: red;
            font-weight: bold;
        }
        #selecttype{
            width: 300px;
        }
        #comPaymentClsCd{
            float: left;
            background: #fff;
           
            height: 32px;
            width: 55%;
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
            width: 20%;
            box-sizing: border-box;
            margin: 10px 15px 0 15px;
            float:right;
            position:absolute;
            left:1000px;
            top:45px;
        }
        #total{
        	margin-left:400px;
        }
    </style>
    <script>
    function comPayment() {
        var p = document.getElementById("comPaymentClsCd").value;
        document.getElementById("TOT_AMOUNT").value=p;
    }
    </script>
</body>
    
</html>

