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
                        <li><a href="#">个人工作</a></li>
                        <li class="active">个人信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="emp_table">
                    <thead>
                    <th>员工编号</th>
                    <th>员工姓名</th>
                    <th>邮箱</th>
                    <th>性别</th>
                    <th>部门</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${employee.empId}</td>
                            <td>${employee.empName}</td>
                            <td>${employee.empEmail}</td>
                            <td>${employee.gender == "F"? "女": "男"}</td>
                            <td>${employee.department.deptName}</td>
                            <td>
                                <a href="#" role="button" class="btn btn-primary emp_edit_btn" data-toggle="modal" data-target=".emp-update-modal">编辑</a>
                                <a href="#" role="button" class="btn btn-danger emp_delete_btn">离职</a>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="./commom/foot.jsp"%>
    </div><!-- /.hrms_body -->
</div><!-- /.container -->

<%@ include file="employeeUpdate.jsp"%>


<script >
    <!-- ==========================员工删除操作=================================== -->
    $(".emp_delete_btn").click(function () {
        var curPage = ${curPage};
        var delEmpId = $(this).parent().parent().find("td:eq(0)").text();
        var delEmpName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delEmpName+ "】的信息吗？")){
            $.ajax({
                url:"/hrms/emp/deleteEmp/"+delEmpId,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="/hrms/emp/getEmpList?pageNo="+curPage;
                    }else {
                        alert(result.extendInfo.emp_del_error);
                    }
                }
            });
        }
    });
</script>
</body>
</html>

