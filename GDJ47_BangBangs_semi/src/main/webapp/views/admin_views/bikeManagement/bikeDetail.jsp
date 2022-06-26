<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.bbs.model.vo.Bike" %>
<%
	Bike b=(Bike)request.getAttribute("bike");

%>
<%@ include file="/views/common/header.jsp" %>

		<div id="subMenu-detail">
		<form action="<%=request.getContextPath()%>/admin/changeBike.do">

				<table>
				    <tr>
				        <td>자전거 일련번호</td>
				        <td><input type="text" name="bikeId" id="bike_Id" class="form-control" value="<%=b.getBikeId()%>" required></td>
				    </tr>
				    <tr>
				        <td>고장상태</td>
				        <td><input type="text" name="brokenStatus" id="brokenStatus" class="form-control" value="<%=b.getBikeBrokenStatus()%>" required>						</td>
				    </tr>
				    <tr>
				        <td>등록일자</td>
				        <td><input type="text" name="enrolldate" id="enrolldate" class="form-control"value="<%=b.getBikeEnrollDate()%>" readonly	></td>
				    </tr>
				    <tr>
				        <td>거치대여소</td>
				        <td><input type="text" name="rentalShop" id="rentalShop" class="form-control" value="<%=b.getRentalShopId()%>" required></td>
				    </tr>
				    
				    <tr>
				        <td>대여상태</td>
				        <td><input type="text" name="Availability" id="Availability" class="form-control" value="<%=b.getRentalAvailability()%>" required></td>
				    </tr>
				    <tr>
				    	<td colspan="2"><button type="submit" class="btn btn-secondary">수정하기</button></td>
				    </tr>
				</table>
				</div>
			</form>
		</div>
    </div>

	<script>
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   
</script>
    <style>
        #mypageHeaderNav{
        	padding-top:100px;
            padding-left: 100px;
            padding-right: 100px;
        }
        #mypageHeaderNav span{
            font-size: 30px;
        }
        body {
            padding-left: 300px;
            padding-right: 300px;
            /* border:1px solid red; */
        }
        #subMenu-detail {
        	/* border:1px solid red; */
        	/* margin:auto; */
        	display:flex;
        	justify-content: center;
        }
        table {
        width: 800px;
        }
        
        #birth {
        	width:622px;
        }
    </style>
    <script type="text/javascript">
	$("tr").attr("class","border rounded");
	</script>
    
</body>
</html>