<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.model.vo.Member" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies!=null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId = c.getValue();
			}
		}
	}
%>
<%@ include file="/views/common/header.jsp" %>
        <!-- Masthead-->
       
        <header>
            <div id="qwer" class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <div class="text-center">
                    
                       
                        <h1 class="mx-auto my-0 text-uppercase"><img src="https://www.popco.net/zboard/data/photo_gallery/2018/10/06/15038507495bb8218e2f876.jpg" style="width:1500px"></h1>
                        <style>
                       
                        </style>
                        <div class="login-container position-absolute top-10 end-10">
							<% if(loginMember==null){ %>
								<form id="loginform" action="<%= request.getContextPath() %>/login.do" method="post">
									<table>
										<tr>
											<td>
												<input type="text" name="userId" id="userId" placeholder="아이디" value="<%=saveId!=null?saveId:""%>">
											</td>
											<td></td>
										</tr>
										<tr>
											<td>
												<input type="password" name="password" id="password" placeholder="패스워드">
											</td>
											<td>
												<input type="submit" value="로그인">
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked":"" %>>
												<label for="saveId">아이디 저장</label>
												&nbsp;&nbsp;
												<input type="button" value="회원가입" onclick="location.assign('<%=request.getContextPath()%>/member/enrollMember.do')">
											</td>
										</tr>
									</table>
								</form>
							<%}else{ %>
								<table id="logged-in">
									<tr>
										<td colspan="2">
											<%-- <%=loginMember.getUserName() %>님, 환영합니다. --%>
										</td>
									</tr>
									<tr>
										<td>
											<input type="button" value="내 정보 보기" onclick="location.assign('<%=request.getContextPath()%>/memberView.do?userId=<%-- <%=loginMember.getUserId()%> --%>');">
										</td>
										<td>
											<input type="button" value="로그아웃" onclick="location.assign('<%=request.getContextPath()%>/logout.do')">
										</td>
									</tr>
								</table>
							<%} %>
						</div>
                        <h2 class="text-white-50 mx-auto mt-2 mb-5"></h2>
                        
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
        <section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="text-white mb-4">Welcome, customer</h2>
                        <p class="text-white-50">
                            <div>
                                <div class="container5" style="width:60%; border-radius: 2em">
                                <a href="문의하기.html" target="_blank"><h2>문의하기</h2></a>
                                <p>궁금한 점이 있으세요?분야별 담당자들이 도와드리겠습니다.</p>
                                </div>
                                <div class="container5" style="width:60%; border-radius: 2em">
                                <a href="고장신고.html" target="_blank"><h2>고장신고</h2></a>
                                <p>궁금한 점이 있으세요?분야별 담당자들이 도와드리겠습니다.
                                </div>
                            </div>
                        </p>
                    </div>
                </div>
                <img class="img-fluid" src="assets/img/cus.jpg" >
            </div>
        </section>
        <!-- Projects-->
        <section class="projects-section bg-light" id="projects">
            <div class="container px-4 px-lg-5">
                <!-- Featured Project Row-->
                <div class="row gx-0 mb-4 mb-lg-5 align-items-center">
                    <div class="col-xl-8 col-lg-7"><img class="img-fluid mb-3 mb-lg-0" src="assets/img/bg-masthead.jpg" alt="..." /></div>
                    <div class="col-xl-4 col-lg-5">
                        <div class="featured-text text-center text-lg-left">
                            <h4>Introduce</h4>
                            <p class="text-black-50 mb-0">어서오세요 GooDeebike 입니다.</p>
                        </div>
                    </div>
                </div>
                <!-- Project One Row-->
                <div class="row gx-0 mb-5 mb-lg-0 justify-content-center">
                    <div class="col-lg-6"><img class="img-fluid" src="assets/img/demo-image-01.jpg" alt="..." /></div>
                    <div class="col-lg-6">
                        <div class="bg-black text-center h-100 project">
                            <div class="d-flex h-100">
                                <div class="project-text w-100 my-auto text-center text-lg-left">
                                    <h4 class="text-white">service</h4>
                                    <p class="mb-0 text-white-50">항상 고객님들에게 최선의 서비스를 제공합니다.</p>
                                    <hr class="d-none d-lg-block mb-0 ms-0" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Project Two Row-->
                <div class="row gx-0 justify-content-center">
                    <div class="col-lg-6"><img class="img-fluid" src="assets/img/demo-image-02.jpg" alt="..." /></div>
                    <div class="col-lg-6 order-lg-first">
                        <div class="bg-black text-center h-100 project">
                            <div class="d-flex h-100">
                                <div class="project-text w-100 my-auto text-center text-lg-right">
                                    <h4 class="text-white">best</h4>
                                    <p class="mb-0 text-white-50">항상 최고의 자리를 지키겠습니다.</p>
                                    <hr class="d-none d-lg-block mb-0 me-0" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Signup-->
        <section class="signup-section" id="signup">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-10 col-lg-8 mx-auto text-center">
                        <i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
                        <h2 class="text-white mb-5">GooDeebike 위치 찾기!</h2>
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                        <form class="form-signup" id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Email address input-->
                            <div class="row input-group-newsletter">
                                <div class="col"><input class="form-control" id="emailAddress" type="email" placeholder="Enter email address..." aria-label="Enter email address..." data-sb-validations="required,email" /></div>
                                <div class="col-auto"><button class="btn btn-primary disabled" id="submitButton" type="submit">Notify Me!</button></div>
                            </div>
                            <div class="invalid-feedback mt-2" data-sb-feedback="emailAddress:required">An email is required.</div>
                            <div class="invalid-feedback mt-2" data-sb-feedback="emailAddress:email">Email is not valid.</div>
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3 mt-2 text-white">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    To activate this form, sign up at
                                    <br />
                                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3 mt-2">Error sending message!</div></div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact-->
        <section class="contact-section bg-black">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-map-marked-alt text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">Address</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50">
                                    Gasan Digital Complex Area, Seoul</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-envelope text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">Email</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50"><a href="#!">GooDeebike@GooDeebike.com</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-mobile-alt text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">Phone</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50">+82 (02) 000-0000</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="social d-flex justify-content-center">
                    <a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                    <a class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                    <a class="mx-2" href="#!"><i class="fab fa-github"></i></a>
                </div>
            </div>
        </section>
        <%@ include file="/views/common/footer.jsp" %>