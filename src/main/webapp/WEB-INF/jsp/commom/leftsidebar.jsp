<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="panel-group col-sm-2" id="hrms_sidebar_left" role="tablist" aria-multiselectable="true">
    <ul class="nav nav-pills nav-stacked sign_sidebar">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_sign">
                <span class="glyphicon glyphicon-map-marker" aria-hidden="true">工作打卡</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_sign">
                <li role="presentation"><a href="#" class="emp_signin">签到</a></li>
                <li role="presentation"><a href="#" class="emp_signout">签退</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked myEmp_sidebar">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_myEmp">
                <span class="glyphicon glyphicon-lock" aria-hidden="true">个人工作</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_myEmp">
                <li role="presentation"><a href="#" class="emp_myinfo">个人信息</a></li>
                <li role="presentation"><a href="#" role="button" id="emp_leave" class="emp_leave" >请假</a></li>
                <li role="presentation"><a href="#" role="button" class="emp_leave_btn" data-toggle="modal" data-target=".emp-leave-modal">员工请假</a></li>
                <li role="presentation"><a href="#" class="emp_sign">打卡记录</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked emp_sidebar" id="userlist">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_emp" >
                <span class="glyphicon glyphicon-user" aria-hidden="true" >员工管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_emp">
                <li role="presentation"><a href="#" class="emp_info" >员工信息</a></li>
                <li role="presentation"><a href="#" role="button" class="emp_add_btn" data-toggle="modal" data-target=".emp-add-modal">员工新增</a></li>
                <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_dept">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true">部门管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_dept">
                <li role="presentation"><a href="#" class="dept_info">部门信息</a></li>
                <li role="presentation"><a href="#" class="dept_add_btn" data-toggle="modal" data-target=".dept-add-modal">部门新增</a></li>
                <li role="presentation"><a href="#" class="dept_clearall_btn">部门清零</a></li>
            </ul>
        </li>
    </ul>

    <ul class="nav nav-pills nav-stacked sal">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_dept">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true">财务管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_dep">
                <li role="presentation"><a href="#" class="sal_info">工资发放信息</a></li>
                <li role="presentation"><a href="#" class="employee_info">工资发放</a></li>
                <li role="presentation"><a href="#" class="dept_add_btn" data-toggle="modal" data-target=".dept-add-modal">报销管理</a></li>
            </ul>
        </li>
    </ul>

</div><!-- /.panel-group，#hrms_sidebar_left -->

<%--弹出的人数div--%>
<div id="all_light">
</div>
<div id="contes" style="width: 400px;height: 340px; ">
    <div style="width:500px;height:40px; ">

        <form  style=" margin-left: 100px;" action="/hrms/attendance/addLeaveDay" method="get">
            <table>
                <td>
                    <tr cosplan="4" ><p id="note1" style="font-family:'Microsoft YaHei UI';font-size: 24px;font-weight: bolder " >请假条</p></tr><br>
                </td>
                <td>
                    <tr></tr>
                    <tr>请假开始:</tr>
                    <tr><input type="text" name="dayTime"></tr><br>
                    <tr></tr>
                </td>
                <td>
                    <tr></tr>
                    <tr>请假天数:</tr>
                    <tr><input type="text" name="dayNum"></tr><br>
                    <tr></tr>
                <td>
                    <tr></tr>
                    <tr>请假结束:</tr>
                    <tr><input type="text" name="num"></tr><br>
                    <tr></tr>
                </td>
                <button type="submit" class="btn btn-success" id="note2">提交</button>
                <button type="reset" class="btn btn-warning" id="note3">重置</button>
            </table>
<%--            <h1 align="center"style="color:red;font-size:30px">请假开始：</h1><input type="text"  name="dayTime" ><br>--%>
<%--            <h1 align="center"style="color:red;font-size:30px">请假天数：</h1><input type="text"  name="dayNum"><br>--%>
<%--            <h1 align="center"style="color:red;font-size:30px">请假结束：</h1><input type="text"  name="num" ><br>--%>
<%--            <input type="submit" value="提交">--%>
<%--            <input type="reset" value="重置">--%>
        </form>
        <button onclick="tui()" class="btn btn-danger" style="margin-top: 10px;margin-left: 306px">退出</button>
    </div>
</div>
<style>
    #contes{
        border: 2px solid deepskyblue;
        border-radius: 7%;
        border-width: 10px;
        border-style: inset;
    }
    #note1{
        margin-left:60px ;
        margin-top: 30px;
    }
    #note2{
        margin-top:20px ;
        margin-left: 30px;
    }
    #note3{
        margin-top:20px ;
        margin-left: 44px;
    }

</style>
<%--弹出的签退div弹框--%>
<div id="out_light">
</div>
<div id="out_contes" style="width: 500px;height: 300px; ">
    <div style="width:500px;height:40px; ">
        <p style="color:coral;font-size: 14px">今天这个班就上到这里吧，下班下班下班。</p>
        <hr>

        <form  style=" margin-left: 100px;" action="" method="get" >
            <button onclick="signOut()" class="btn btn-info " style="margin-left: 100px;margin-top: 30px">签退</button>
        </form>
        <button onclick="tui()" class="btn btn-danger" style="margin-left:400px;margin-top: 90px">退出</button>
    </div>
</div>
<style>
    #out_contes{
        border: 2px solid mediumspringgreen;
        border-radius: 7%;
        border-width: 10px;
        border-style: inset;
    }
</style>

<script type="text/javascript">
    //跳转到个人信息
    $(".emp_myinfo").click(function () {
        $(this).attr("href", "/hrms/emp/getMyEmpList");
    });
    //跳转到打卡记录
    $(".emp_sign").click(function () {
        $(this).attr("href", "/hrms/attendance/getAttendance");
    });

    //跳转到签到页面
    $(".emp_signin").click(function () {
        $(this).attr("href", "/hrms/attendance/signIn");
    });
    //签退弹框
    $(".emp_signout").click(function () {
        document.getElementById('out_light').style.display = 'block';
        document.getElementById('out_contes').style.display = 'block';
    })
    function signOut(){
        $.ajax({
            url:"/hrms/attendance/getSignOut",
            asycn : true,
            type : "get",
            success : function(data) {
                // data 就是responseText返回的数据,但是这里是jQuery处理完成之后的数据
                if(!data.success){
                    alert(data.msg);
                }else{
                    alert("下班啦，干饭，还是逛公园")
                }
            },
        })
    }




    //跳转到员工页面
    $(".emp_info").click(function () {
        $(this).attr("href", "/hrms/emp/getEmpList");

    });



    //跳转到部门页面
    $(".dept_info").click(function () {
        $(this).attr("href", "/hrms/dept/getDeptList");
    });
    //员工清零这个功能暂未实现
    $(".emp_clearall_btn").click(function () {
        alert("对不起，您暂无权限进行操作！请先获取权限");
    });
    //部门清零这个功能暂未实现
    $(".dept_clearall_btn").click(function () {
        alert("对不起，您暂无权限进行操作！请先获取权限");
    });
    //请假
    $(".emp_leave").click(function () {
        document.getElementById('all_light').style.display = 'block';
        document.getElementById('contes').style.display = 'block';
    })



    //跳转到工资发放信息
    $(".sal_info").click(function () {
        $(this).attr("href", "/hrms/sal/getSalList");
    });
    //跳转到工资发放
    $(".employee_info").click(function () {
        $(this).attr("href", "/hrms/two/getTwoList");
    });

</script>

<%--  请假DIV样式  --%>
<style type="text/css">
#all_light { /*整个弹窗的页面*/
opacity: 0; /*透明度*/
width: 100%; /*宽度*/
height: 2300px; /*高度，不能百分百*/
background: #000; /*背景色*/
position: absolute;
top: 0;
left: 0; /*定位*/
display: none; /*隐藏*/
z-index: 2; /*覆盖*/
}
#contes { /* 弹框的页面*/
width: 500px; /*宽度*/
height: 500px; /*高度*/
background: url(/static/img/bg2.jpg) no-repeat; /*背景色*/
    background-size: cover;
display: none; /*隐藏*/
z-index: 2; /*覆盖*/
position: absolute;
top: 100px;
left: 400px; /* 定位*/
}
input{
margin-bottom: 10px;
}
</style>
<%--  签退的DIV样式  --%>
<style type="text/css">
    #out_light { /*整个弹窗的页面*/
        opacity: 0; /*透明度*/
        width: 100%; /*宽度*/
        height: 2300px; /*高度，不能百分百*/
        background: #000; /*背景色*/
        position: absolute;
        top: 0;
        left: 0; /*定位*/
        display: none; /*隐藏*/
        z-index: 2; /*覆盖*/
    }
    #out_contes { /* 弹框的页面*/
        width: 500px; /*宽度*/
        height: 500px; /*高度*/
        background: url(/static/img/gooffwork.jpeg);  /*背景色*/
        background-size: cover;
        display: none; /*隐藏*/
        z-index: 2; /*覆盖*/
        position: absolute;
        top: 100px;
        left: 400px; /* 定位*/
    }
    input{
        margin-bottom: 10px;
    }
</style>
<style>
    h1{
        background-color: aqua;
        z-index:5;
    }
</style>

</body>
</html>
