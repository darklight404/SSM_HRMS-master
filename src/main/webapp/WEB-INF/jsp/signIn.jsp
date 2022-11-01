<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工管理页面</title>

</head>
<body>
<div class="hrms_container">
    <!-- 导航条 -->
    <%@ include file="./commom/head.jsp"%>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="hrms_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="./commom/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="emp_myinfo col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">工作打卡</a></li>
                        <li class="active">签到</li>
                    </ol>
                </div>
                <div style="text-align: center">
                <button onclick="signIn()" class="btn btn-info btn-lg">点我签到</button>
<%--                <button  onclick="signIn()">点我签到</button>--%>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="./commom/foot.jsp"%>
    </div><!-- /.hrms_body -->
</div><!-- /.container -->
<script>
    function signIn() {
        $.ajax({
            url:"/hrms/attendance/getSignIn",
            asycn : true,
            type : "get",
            success : function(data) {
                // data 就是responseText返回的数据,但是这里是jQuery处理完成之后的数据
                if(!data.success){
                    alert(data.msg);
                }else{
                    alert("签到成功")
                }
            },
        })
    }
</script>
</body>
</html>
