<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

    <title>게시판</title>
  </head>
  <body>
  

  <div class="content">

    <div class="container">
      <h2 class="mb-5">문의사항 게시판</h2>
      <div class="table-responsive custom-table-responsive">

        <table class="table custom-table">
          <thead>
            <tr>  

              <th scope="col">
                <label class="control control--checkbox">
                  <input type="checkbox"  class="js-check-all"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
              <th scope="col">번호</th>
              <th scope="col">작성자</th>
              <th scope="col">제목</th>
              <th scope="col">파일</th>
              <th scope="col">작성일</th>
              <th scope="col">조회수</th>
            </tr>
          </thead>
          <tbody>
           <!--  for문적용 -->
            <tr scope="row">
              <th scope="row">
                <label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
              <td> 1111</td>
              <td><a href="#">김용성</a></td>
              <td>
              <a href="<%=request.getContextPath()%>/board/boardView.do>">문의합니다</a>
                <small class="d-block">바퀴가 고장났어요</small>
              </td>
              <td> <img src="<%=request.getContextPath()%>/images/file.png"
				 width="20"></td>
              <td>2022/6/14</td>
              <td>0</td>
            </tr>
            <tr class="spacer"><td colspan="100"></td></tr>
            <tr class="active">
              <th scope="row">
                <label class="control control--checkbox">
                  <input type="checkbox" checked="" />
                  <div class="control__indicator"></div>
                </label>
              </th>
               <!--  for문적용 -->
               
               
              <td>null</td>
              <td><a href="#">null</a></td>
              <td>
               null
                <small class="d-block">null</small>
              </td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
            </tr>
            <tr class="spacer"><td colspan="100"></td></tr>
            <tr>
              <th scope="row">
                <label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
              
              <td>null</td>
              <td><a href="#">null</a></td>
              <td>
                null
                <small class="d-block">null</small>
              </td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
            </tr>
            <tr class="spacer"><td colspan="100"></td></tr>
            <tr>
              <th scope="row">
                <label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
              
              <td>null</td>
              <td><a href="#">null</a></td>
              <td>
               null
                <small class="d-block">null</small>
              </td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
            </tr>
            
             <tr class="spacer"><td colspan="100"></td></tr>
            <tr>
              <th scope="row">
                <label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
              
              <td>null</td>
              <td><a href="#">null</a></td>
              <td>
               null
                <small class="d-block">null</small>
              </td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
            </tr>
            
             <tr class="spacer"><td colspan="100"></td></tr>
            <tr>
              <th scope="row">
                <label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator"></div>
                </label>
              </th>
              
              <td>null</td>
              <td><a href="#">null</a></td>
              <td>
               null
                <small class="d-block">null</small>
              </td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
            </tr>
          </tbody>
              <tr>
		    <td colspan="7" style="text-align:right">
		   
		      <button class="btn btn-primary"
		      onclick="location.assign('<%=request.getContextPath()%>/board/boardWriter.do')">
		      글쓰기
		      </button>
		      </td>
		</tr>
        </table>
      </div>
     <section id="memberList-container">
      
                <div id="search-container">
        	검색어 
        	<select id="searchType">
        		<option value="userId">번호</option>
        		<option value="userName">작성자</option>
        		<option value="gender">제목</option>
        	</select>
        	<div id="search-userId">
        		<form action="">
        			<input type="hidden" name="searchType" value="userId" >
        			<input type="text" name="searchKeyword" size="25" style=height:22px;
        			placeholder="검색할 번호를 입력하세요" list="ids">
        			<datalist id="ids">
        			</datalist>
        			<button type="submit" class="btn btn-primary">찾기</button>
        		</form>
       </section>

    </div>

  </div>
   
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
  </body>
  <style>
    section#memberList-container {text-align:center;}
    
    section#memberList-container table#tbl-member {width:100%; border:1px solid gray;}
    section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
        div#search-container {margin:0 0 10px 0; padding:3px;}
    div#search-userId{display:inline-block;}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;}
    .mb-5{
      text-align: center;
      font-weight: bold;
    }
    .btn btn-primary{
     
    }
  </style>
</html>