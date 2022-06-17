<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <ul id="mypageHeaderNav" class="nav nav-pills  justify-content-center">
        <li class="nav-item ">
            <a class="nav-link active" id="memberData"><span>회원 정보</span></a>
            
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="purchaseData"><span>결제 정보</span></a>
        </li>
        <li class="nav-item ">
            <a class="nav-link " id="historyData" ><span>이용정보</span></a>
        </li>
    </ul>

    <div id="subMenu"></div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <style>
        #mypageHeaderNav{
            padding-left: 100px;
            padding-right: 100px;
        }
        #mypageHeaderNav span{
            font-size: 30px;
        }
        body {
            padding-left: 300px;
            padding-right: 300px;
            border:1px solid red;
        }
        #subMenu {
        	border:1px solid red;
        }
    </style>
    <script>
	    $("#memberData").attr("class","nav-link active")
	    $("#purchaseData").attr("class","nav-link")
	    $("#historyData").attr("class","nav-link")
		$.ajax({
			url:"<%=request.getContextPath()%>/memberdata.do",
			dataType:"html",
			success:(data)=>{
				console.log(data);
				$("#subMenu").html(data);
			}
		});
    	$("#memberData").click(e=>{
            $("#memberData").attr("class","nav-link active")
            $("#purchaseData").attr("class","nav-link")
            $("#historyData").attr("class","nav-link")
			$.ajax({
				url:"<%=request.getContextPath()%>/memberdata.do",
				dataType:"html",
				success:(data)=>{
					console.log(data);
					$("#subMenu").html(data);
				}
			});
		});
    	$("#purchaseData").click(e=>{
    		 $("#memberData").attr("class","nav-link")
             $("#purchaseData").attr("class","nav-link active")
             $("#historyData").attr("class","nav-link")
			$.ajax({
				url:"<%=request.getContextPath()%>/purchasedata.do",
				dataType:"html",
				success:(data)=>{
					console.log(data);
					$("#subMenu").html(data);
				}
			});
		});
    	$("#historyData").click(e=>{
    		 $("#memberData").attr("class","nav-link")
             $("#purchaseData").attr("class","nav-link")
             $("#historyData").attr("class","nav-link active")
			$.ajax({
				url:"<%=request.getContextPath()%>/historydata.do",
				dataType:"html",
				success:(data)=>{
					console.log(data);
					$("#subMenu").html(data);
				}
			});
		});
    </script>
</body>
</html>