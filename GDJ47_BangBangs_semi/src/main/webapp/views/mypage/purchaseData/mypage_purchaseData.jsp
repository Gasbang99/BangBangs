<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" id="purchaseHistory">결제내역</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="refundHistory">환불내역</a>
        </li>
    </ul>
    
        <div id="subMenu-detail"></div>

<script>
$("#purchaseHistory").attr("class","nav-link active")
$("#refundHistory").attr("class","nav-link")
$.ajax({
    url:"<%=request.getContextPath()%>/changememberdata.do",
    dataType:"html",
    success:(data)=>{
        console.log(data);
        $("#subMenu-detail").html(data);
    }
});    
$("#purchaseHistory").click(e=>{
    $("#purchaseHistory").attr("class","nav-link active")
    $("#refundHistory").attr("class","nav-link")
    $.ajax({
        url:"<%=request.getContextPath()%>/changememberdata.do",
        dataType:"html",
        success:(data)=>{
            console.log(data);
            $("#subMenu-detail").html(data);
        }
    });
});
$("#refundHistory").click(e=>{
    $("#purchaseHistory").attr("class","nav-link")
    $("#refundHistory").attr("class","nav-link active")
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