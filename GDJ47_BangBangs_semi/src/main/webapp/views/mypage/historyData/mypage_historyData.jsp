<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" id="rentalHistory">대여반납이력</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="psTicket">이용권 보유내역</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="mileageHistory">마일리지</a>
        </li>
    </ul>

    <div id="subMenu-detail"></div>

<script>
$("#rentalHistory").attr("class","nav-link active")
$("#psTicket").attr("class","nav-link")
$("#mileageHistory").attr("class","nav-link")
$.ajax({
    url:"<%=request.getContextPath()%>/changememberdata.do",
    dataType:"html",
    success:(data)=>{
        console.log(data);
        $("#subMenu-detail").html(data);
    }
});
$("#rentalHistory").click(e=>{
    $("#rentalHistory").attr("class","nav-link active")
    $("#psTicket").attr("class","nav-link")
    $("#mileageHistory").attr("class","nav-link")
    $.ajax({
        url:"<%=request.getContextPath()%>/changememberdata.do",
        dataType:"html",
        success:(data)=>{
            console.log(data);
            $("#subMenu-detail").html(data);
        }
    });
});
$("#psTicket").click(e=>{
    $("#rentalHistory").attr("class","nav-link")
    $("#psTicket").attr("class","nav-link active")
    $("#mileageHistory").attr("class","nav-link")
    $.ajax({
        url:"<%=request.getContextPath()%>/changememberdata.do",
        dataType:"html",
        success:(data)=>{
            console.log(data);
            $("#subMenu-detail").html(data);
        }
    });
});
$("#mileageHistory").click(e=>{
    $("#rentalHistory").attr("class","nav-link")
    $("#psTicket").attr("class","nav-link")
    $("#mileageHistory").attr("class","nav-link active")
    $.ajax({
        url:"<%=request.getContextPath()%>/changememberdata.do",
        dataType:"html",
        success:(data)=>{
            console.log(data);
            $("#subMenu-detail").html(data);
        }
    });
});

</script>