<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" id="change">회원정보수정</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="inquiry">문의내용</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="resign">회원탈퇴</a>
        </li>
</ul>

<div id="subMenu-detail"></div>

<script>
    $("#change").attr("class","nav-link active")
    $("#inquiry").attr("class","nav-link")
    $("#resign").attr("class","nav-link")
    $.ajax({
        url:"<%=request.getContextPath()%>/changememberdata.do",
        dataType:"html",
        success:(data)=>{
            console.log(data);
            $("#subMenu-detail").html(data);
        }
    });
    $("#change").click(e=>{
        $("#change").attr("class","nav-link active")
        $("#inquiry").attr("class","nav-link")
        $("#resign").attr("class","nav-link")
        $.ajax({
            url:"<%=request.getContextPath()%>/changememberdata.do",
            dataType:"html",
            success:(data)=>{
                console.log(data);
                $("#subMenu-detail").html(data);
            }
        });
    });
    $("#inquiry").click(e=>{
        $("#change").attr("class","nav-link")
        $("#inquiry").attr("class","nav-link active")
        $("#resign").attr("class","nav-link")
        $.ajax({
            url:"<%=request.getContextPath()%>/inquirydata.do",
            dataType:"html",
            success:(data)=>{
                console.log(data);
                $("#subMenu-detail").html(data);
            }
        });
    });
    $("#resign").click(e=>{
        $("#change").attr("class","nav-link")
        $("#inquiry").attr("class","nav-link")
        $("#resign").attr("class","nav-link active")
        $.ajax({
            url:"<%=request.getContextPath()%>/resignmember.do",
            dataType:"html",
            success:(data)=>{
                console.log(data);
                $("#subMenu-detail").html(data);
            }
        });
    });
            
</script>
    
    