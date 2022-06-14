<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용권구매</title>
</head>
<body>
    <head>
        <h1>이용권 구매</h1>
    </head>
    <body>
    <table class="table">
        <tr>
            <tr>
                <th>이용권 구분</th>
                <td>
                <select id="ticektTime" name="ticketTime">
                    <option value="ticket1">1시간</option>
                    <option value="ticket2">2시간</option>
                </select>
                </td>
            </tr>  
            <tr>
                <th>매수</th>
                <td>
                    <select id="buy" name="buy">
                        <option value="ticketbuy1">1개</option>
                        <option value="ticketbuy2">2개</option>
                        <option value="ticketbuy3">3개</option>
                        <option value="ticketbuy4">4개</option>
                        <option value="ticketbuy5">5개</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>가격</th>
                <td>
                    60분에 원 60분초과시 분당 원
                </td>
            </tr>
            <tr>
                <th>결제수단</th>
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
            <tr>
                <th>생년월일</th>
                <td>
                    <label>
                <select id="year" name="year">
                    <option value>연도</option>
                    <option value="1922">1922 년</option>
                    <option value="1923">1923 년</option>
                    <option value="1924">1924 년</option>
                    <option value="1925">1925 년</option>
                    <option value="1926">1926 년</option>
                    <option value="1927">1927 년</option>
                    <option value="1928">1928 년</option>
                    <option value="1929">1929 년</option>
                    <option value="1930">1930 년</option>
                    <option value="1931">1931 년</option>
                    <option value="1932">1932 년</option>
                    <option value="1933">1933 년</option>
                    <option value="1934">1934 년</option>
                    <option value="1935">1935 년</option>
                    <option value="1936">1936 년</option>
                    <option value="1937">1937 년</option>
                    <option value="1938">1938 년</option>
                    <option value="1939">1939 년</option>
                    <option value="1940">1940 년</option>
                    <option value="1941">1941 년</option>
                    <option value="1942">1942 년</option>
                    <option value="1943">1943 년</option>
                    <option value="1944">1944 년</option>
                    <option value="1945">1945 년</option>
                    <option value="1946">1946 년</option>
                    <option value="1947">1947 년</option>
                    <option value="1948">1948 년</option>
                    <option value="1949">1949 년</option>
                    <option value="1950">1950 년</option>
                    <option value="1951">1951 년</option>
                    <option value="1952">1952 년</option>
                    <option value="1953">1953 년</option>
                    <option value="1954">1954 년</option>
                    <option value="1955">1955 년</option>
                    <option value="1956">1956 년</option>
                    <option value="1957">1957 년</option>
                    <option value="1958">1958 년</option>
                    <option value="1959">1959 년</option>
                    <option value="1960">1960 년</option>
                    <option value="1961">1961 년</option>
                    <option value="1962">1962 년</option>
                    <option value="1963">1963 년</option>
                    <option value="1964">1964 년</option>
                    <option value="1965">1965 년</option>
                    <option value="1966">1966 년</option>
                    <option value="1967">1967 년</option>
                    <option value="1968">1968 년</option>
                    <option value="1969">1969 년</option>
                    <option value="1970">1970 년</option>
                    <option value="1971">1971 년</option>
                    <option value="1972">1972 년</option>
                    <option value="1973">1973 년</option>
                    <option value="1974">1974 년</option>
                    <option value="1975">1975 년</option>
                    <option value="1976">1976 년</option>
                    <option value="1977">1977 년</option>
                    <option value="1978">1978 년</option>
                    <option value="1979">1979 년</option>
                    <option value="1980">1980 년</option>
                    <option value="1981">1981 년</option>
                    <option value="1982">1982 년</option>
                    <option value="1983">1983 년</option>
                    <option value="1984">1984 년</option>
                    <option value="1985">1985 년</option>
                    <option value="1986">1986 년</option>
                    <option value="1987">1987 년</option>
                    <option value="1988">1988 년</option>
                    <option value="1989">1989 년</option>
                    <option value="1990">1990 년</option>
                    <option value="1991">1991 년</option>
                    <option value="1992">1992 년</option>
                    <option value="1993">1993 년</option>
                    <option value="1994">1994 년</option>
                    <option value="1995">1995 년</option>
                    <option value="1996">1996 년</option>
                    <option value="1997">1997 년</option>
                    <option value="1998">1998 년</option>
                    <option value="2000">2000 년</option>
                    <option value="2001">2001 년</option>
                    <option value="2002">2002 년</option>
                    <option value="2003">2003 년</option>
                    <option value="2004">2004 년</option>
                    <option value="2005">2005 년</option>
                    <option value="2006">2006 년</option>
                    <option value="2007">2007 년</option>
                    <option value="2008">2008 년</option>
                    <option value="2009">2009 년</option>

                </select>
                <select id="month" name="month">
                    <option value="">월</option>
                    <option value="1">1월</option>
                    <option value="2">2월</option>
                    <option value="3">3월</option>
                    <option value="4">4월</option>
                    <option value="5">5월</option>
                    <option value="6">6월</option>
                    <option value="7">7월</option>
                    <option value="8">8월</option>
                    <option value="9">9월</option>
                    <option value="10">10월</option>
                    <option value="11">11월</option>
                    <option value="12">12월</option>
                </select>
                <select id="day" name="day">
                    <option value="">일</option>
                    <option value="1">1일</option>
                    <option value="2">2일</option>
                    <option value="3">3일</option>
                    <option value="4">4일</option>
                    <option value="5">5일</option>
                    <option value="6">6일</option>
                    <option value="7">7일</option>
                    <option value="8">8일</option>
                    <option value="9">9일</option>
                    <option value="10">10일</option>
                    <option value="11">11일</option>
                    <option value="12">12일</option>
                    <option value="13">13일</option>
                    <option value="14">14일</option>
                    <option value="15">15일</option>
                    <option value="16">16일</option>
                    <option value="17">17일</option>
                    <option value="18">18일</option>
                    <option value="19">19일</option>
                    <option value="20">20일</option>
                    <option value="21">21일</option>
                    <option value="22">22일</option>
                    <option value="23">23일</option>
                    <option value="24">24일</option>
                    <option value="25">25일</option>
                    <option value="26">26일</option>
                    <option value="27">27일</option>
                    <option value="28">28일</option>
                    <option value="29">29일</option>
                    <option value="30">30일</option>
                    <option value="31">31일</option>
                </select>
                </td>
            </tr>
            <tr>
                <th>휴대전화번호</th>
                <td>
                    <input type="number" min="0" max="0" maxlength="3" name="phone1" id="phone1">-
                
                    <input type="number" min="0" max="0" maxlength="4" name="phone2" id="phone2">-
                
                    <input type="number" min="0" max="0" maxlength="4" name="phone3" id="phone3">
                </td>
            </tr>
            <tr>
                <th>결제금액</th>
            </tr>
        </tr>
    </table>
   
    <div id="payagree">
        <table>
            <tr>
                <th>
                    <label>
                    <input type="checkbox" name="entry" height="300px">전체동의
                    <br>
                </th>
            </tr>
                <td>
                <input type="checkbox" name="terms">만 14세 이상입니다<br>
                <input type="checkbox" name="terms">서비스 이용약관 동의<br>
                <input type="checkbox" name="terms">개인정보 수집,이용 동의<br>
                <input type="checkbox" name="terms">수집한 개인정보의 제3자 정보제공 동의<br>
                <input type="checkbox" name="terms">환불규정 동의<br>
                <input type="checkbox" name="terms">위치기반 서비스 이용약관에 동의<br>
                </td>
            </label>
        </table>
    </div>
    <script>
        document.getElementsByName("entry")[0].addEventListener("click",(e)=>{
            const terms=document.getElementsByName("terms");
            for(let i=0;i<terms.length;i++){
                terms[i].checked=e.target.checked;
            }
        });

    </script>
    <div id="paymentbtn">
    <button type="button"  class="btn btn-success" style="width:500px;">결제하기</button>
    </div>
    <style>
        #payagree{
            margin:0 auto; 
            display: flex;
            justify-content: center;
        }
        #paymentbtn{
            display: flex;
            justify-content: center;

        }
    </style>
    </style>
    </body>
    <div>
    <h3 id="foot">이용권 사용안내</h3>
    <table>
        <tr>
            <td><img src="https://thumb.ac-illust.com/d0/d0b693e58627f1de0edd19cc207c47d7_w.jpeg" width="50" height="50px"></td>
            <td>이용시간</td>
            <td>6:00am ~ 22:00pm</td>
        </tr>
        <tr>
            <td><img src="https://w7.pngwing.com/pngs/363/769/png-transparent-location-icon-landmark-map-location-information-thumbnail.png" width="50px" height="50px"></td>
            <td>대여소</td>
            <td>구디자전거 모든 대여소에서 사용이 가능합니다</td>
        </tr>
        <tr>
            <td><img src="https://previews.123rf.com/images/chekman/chekman1702/chekman170200068/71028924-%EB%8F%88%EC%9D%84-%ED%99%98%EB%B6%88-%EC%95%84%EC%9D%B4%EC%BD%98-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%A0%88%EC%9D%B4-%EC%85%98-%ED%8F%89%EB%A9%B4-%EB%94%94%EC%9E%90%EC%9D%B8-%ED%99%98%EB%B6%88-%EB%8F%88%EC%9D%84-%ED%9A%8C%EC%83%89-%EA%B8%B0%ED%98%B8-.jpg" width="50px" height="50px"></td>
            <td>취소,환불</td>
            <td>자전거 환불규정에 따릅니다<a href="https://www.bikeseoul.com:457/info/infoCoupon.do?part=refund&lang=ko"><환불규정></a></td>
        </tr>
    </table>
    
    </div>
    <style>
        #foot{
            color: red;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>