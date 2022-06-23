<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div><br><br>
        <h1>일일권 선물하기</h1><hr>
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
<form name="regiform" action="<%=request.getContextPath() %>/enrollgifthistory.do" method="post">
    <div id="selecttype">
        <p style="font-weight: bold;">&nbsp;일일권종류선택</p>
           <select id="comPaymentClsCd" name="comPaymentClsCd" class="fl" style="width: 55%" onchange="comPayment();" required>
                <option id="selectDefaltGen" value="">선택</option>
                <option id="BIL_001" value="1000" etc1="1000" etc2="1000">일일 회원(1시간권)</option>
                <option id="BIL_002" value="2000" etc1="2000" etc2="2000">일일 회원(2시간권)</option>
            </select> 
            <p>&nbsp;</p> 
    </div>
    <br>
    <div id="selecttype" style="margin-top:5px">
        <p style="font-weight: bold;margin-top:10px">&nbsp;보유 마일리지 <input type="number" id="posseMile" readonly="readonly" style="margin-left:48px"></p>
        <p style="font-weight: bold;">&nbsp;사용할 마일리지<input type="number" id="mileage1" placeholder="100단위로 사용가능" style="margin-left:40px" onkeyup="comPayment1();" >
        <br><br>
    </div>
	<style>
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
		<br>
        <div id="selecttype">
        <p style="font-weight: bold;">&nbsp;선물받는 분의ID</p>
        <input type="text" name="giftid" style="margin-left:40px" required>
    
    <br><br>
    <div id="comPaymentClsCd2">
        <p style="font-weight: bold;">&nbsp;결제방식</p>
        <table>
            <tr>
                <td>
                    <label>
                        <input type="radio" name="pay" value="toss" id="w30"><img src="https://play-lh.googleusercontent.com/W607uSRreW4h6Ar4reYPYCtYXID0_AIsd9m2fgWwdAN7JyZGG3WVM782wa5CfCvKZVM" width="15" height="15" required>toss
                    </label>
                    <label>
                        <input type="radio" name="pay" value="kakao" id="w30"><img src="https://play-lh.googleusercontent.com/W43xj43ErMIs5BQgCdMKEa0NXCoUUW8DjQc5SxcDfLrC26H8sHDmoFIUWLYmsQahpo0" width="15" height="15" required>kakao
                    </label>
                    <label>
                        <input type="radio" name="pay" value="card" id="w30" required>신용/체크카드
                    </label>
                    <label>
                        <input type="radio" name="pay" value="phone" id="w30" required>휴대전화
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
        <input type="text" class="w80" id="TOT_AMOUNT1" name="TOT_AMOUNT1" value="0" readonly="readonly">
        <span style="color:black">원</span></p>
       	
       	<p id="mileage2">마일리지
        <input type="text" class="w80" id="TOT_AMOUNT2" name="TOT_AMOUNT2" value="0" readonly="readonly">
        <span style="color:black">원</span></p>
        
        <p id="totalprice">총 금액&nbsp;&nbsp;
        <input type="text" class="w80" id="TOT_AMOUNT3" name="TOT_AMOUNT3" value="0" readonly="readonly">
        <span style="color:black">원</span></p>
        
       	<label><input type="checkbox" id="agree" required>추가요금자동결제,환불규정, 이용약관에 동의하며 결제를 진행합니다.(이용권 사용안내)<br></label>
        <label><input type="checkbox" id="agree" required>만 13세 미만의 미성년자가 서비스를 이용하는 경우, 사고 발생 시 보험 적용을 받을 수 없는 등의 불이익을 받으실 수 있습니다. (만 15세 미만의 경우 상법 제732조에 의거하여 사망 보험 적용 불가)</label>
        <br>
        <div id="btn">
		  <button class="btn" id="submitBtn" type="submit">결제하기</button>	  
		</div>
    </div>
    </form>
    <script>
    	$(document).ready(function(){  //한글입력 안되게 처리 
    	$("input[name=giftid]").keyup(function(event){    
    		if (!(event.keyCode >=37 && event.keyCode<=40)) {   
    			var inputVal = $(this).val();    
    			$(this).val(inputVal.replace(/[^a-z0-9]/gi,'')); 
    			 }  
    			});
    	});
    </script>