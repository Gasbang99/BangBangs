<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <section id="mypage-container">
        <h2>마이페이지</h2>
        <div class="container border rounded">
            <div class="row align-items-start">
                <div class="col border rounded" id="privacy">
                    <h3>개인정보</h3>        
                    <ul>
                        <li id="myName">
                            <span class="userData">"이름"</span>
                            <span>
                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseName" aria-expanded="false" aria-controls="collapseExample">
                                수정하기
                                </button>
                            </span>   
                        </li>
                        <div class="collapse" id="collapseName">
                                <div class="card card-body">
                                    <input type="text" placeholder="현재이름">
                                    <input type="text" placeholder="새이름">
                                    <input type="text" placeholder="새이름 확인">
                                </div>
                        </div>
                        <li id="myAge">
                            <span class="userData">"나이"</span>
                            <span>
                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAge" aria-expanded="false" aria-controls="collapseExample">
                                수정하기
                                </button>
                            </span>                           
                        </li>
                        <div class="collapse" id="collapseAge">
                                <div class="card card-body">
                                    <input type="text" placeholder="현재이름">
                                    <input type="text" placeholder="새이름">
                                    <input type="text" placeholder="새이름 확인">
                                </div>
                        </div>
                        <li id="myGender">
                            <span class="userData">"성별"</span>
                            <span>
                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGender" aria-expanded="false" aria-controls="collapseExample">
                                수정하기
                                </button>
                            </span>                            
                        </li>
                        <div class="collapse" id="collapseGender">
                                <div class="card card-body">
                                    <input type="text" placeholder="현재이름">
                                    <input type="text" placeholder="새이름">
                                    <input type="text" placeholder="새이름 확인">
                                </div>
                        </div>
                        <li id="myPhone">
                            <span class="userData">"전화번호"</span>
                            <span>
                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePhone" aria-expanded="false" aria-controls="collapseExample">
                                수정하기
                                </button>
                            </span>                           
                        </li>
                        <div class="collapse" id="collapsePhone">
                                <div class="card card-body">
                                    <input type="text" placeholder="현재이름">
                                    <input type="text" placeholder="새이름">
                                    <input type="text" placeholder="새이름 확인">
                                </div>
                        </div>
                        <li id="myEmail">
                            <span class="userData">"이메일"</span>
                            <span>
                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEmail" aria-expanded="false" aria-controls="collapseExample">
                                수정하기
                                </button>
                            </span>                            
                        </li>
                        <div class="collapse" id="collapseEmail">
                                <div class="card card-body">
                                    <input type="text" placeholder="현재이름">
                                    <input type="text" placeholder="새이름">
                                    <input type="text" placeholder="새이름 확인">
                                </div>
                        </div>
                        <li id="myAddress">
                            <span class="userData">"주소"</span>
                            <span>
                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAddress" aria-expanded="false" aria-controls="collapseExample">
                                수정하기
                                </button>
                            </span>
                        </li>
                        <div class="collapse" id="collapseAddress">
                                <div class="card card-body">
                                    <input type="text" placeholder="현재이름">
                                    <input type="text" placeholder="새이름">
                                    <input type="text" placeholder="새이름 확인">
                                </div>
                        </div> 
                    </ul>
                </div>
                <div class="col border rounded" id="security">
                    <h3>보안설정</h3>
                    <h3></h3>
                </div>
                <div class="col border rounded" id="record">
                    <h3>이력관리</h3>
                    <nav class="nav flex-column">
                        <a class="nav-link" href="#">구매내역</a>
                        <a class="nav-link" href="#">대여내역</a>
                        <a class="nav-link" href="#">문의내역</a>
                    </nav>
                </div>
            </div>
        </div>      
    </section>

    <style>
        #mypage-container {
            text-align: center;
        }
        ul{
            list-style-type: none;
            padding: 0;
            
        }
        li {
            /* border: 1px solid red; */
            margin: 15px;
            /* text-align: right; */
            display: flex;
            justify-content: space-between;
        }
        .col{
            width: 30%;
            margin: 15px;
        }
        .userData {
            /* text-align: left; */
            font-size: 20px;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>