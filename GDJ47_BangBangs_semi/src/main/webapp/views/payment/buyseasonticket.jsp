<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div><br><br>
        <h1>정기권 구매하기</h1><hr>
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
        <p style="font-weight: bold;">&nbsp;정기권종류선택</p>
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
            <p>&nbsp;</p>
</div>
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

    <div id="paybox">
        <h3 id="AmountOfPayment">결제금액</h3><br><br>
        <p id="use">이용권&nbsp;&nbsp;&nbsp;
        <input type="text" class="w80" id="TOT_AMOUNT1" name="TOT_AMOUNT" value="0" readonly="readonly">
        <span style="color:black">원</span></p>
        
        <p id="mileage">마일리지
        <input type="text" class="w80" id="TOT_AMOUNT2" name="TOT_AMOUNT" value="0" readonly="readonly">
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