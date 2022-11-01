<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="margin: 380px 380px">
            <div class="login-panel panel panel-default" >
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: center;">注册</h3>
                </div>
                <div class="panel-body">
                        <fieldset>
                            <div class="form-group">
                                姓名<input class="form-control" placeholder="姓名" id="name" name="name" autofocus>
                            </div>
                            <div class="form-group">
                                性别<input type="radio" name="gender" value="男" <c:if test="${gender=='男'}">checked</c:if>>男
                                    <input type="radio" name="gender" value="女" <c:if test="${gender=='女'}">checked</c:if>>女

                            </div>
                            <div class="form-group">
                                用户名<input class="form-control" placeholder="用户名" id="username" name="username" autofocus>
                            </div>
                            <div class="form-group">
                                密码<input class="form-control" placeholder="密码" id="password" name="password" type="password" value="">
                            </div>
                            <div class="form-group">
                                邮箱<input class="form-control" placeholder="邮箱" id="email" name="email" type="text" value="" placeholder="zs@qq.com">
                            </div>
                            <div class="form-group">
                                        部门<select class="form-control"  name="departmentId" id="add_department">
                                        <%-- <option value="1">CEO</option>--%>
                                        </select>
                            </div>
                            <div class="form-group">
                                <span id="msg"></span>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <a href="javascript:void(0)" class="btn btn-lg btn-success btn-block" id='enroll_btn'>确定注册</a>
                            <a href="javascript:void(0)" class="btn btn-lg btn-success btn-block" id='next_btn' type="reset">重置</a>
                        </fieldset>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    body{
        background: url("/static/img/bg4.jpg") no-repeat;
        background-size: cover;
    }
</style>
<script type="text/javascript">

    // $(function () {
    //     $("#enroll_btn").click(function () {
    //         location.href="/hrms/emp/enroll"
    //     });
    // });
    $(function () {
        $("#enroll_btn").blur(function () {
            var name = $("#name").val();
            var gender = $("[gender='gender']").val();
            var loginname = $("#username").val();
            var password = $("#password").val();
            var email = $("#email").val();
            var departmentId = $("#add_department").val();
            var req=/^\s*$/;
            if (req.test(loginname)){
                $("#msg").html("用户名不能为空").css("color","red")
            }
            $.ajax({
                url:"/hrms/emp/addenroll",
                data:{
                    name:name,
                    gender:gender,
                    loginname:loginname,
                    password:password,
                    email:email,
                    departmentId:departmentId,
                },
                dataType:"text",
                success:function (a) {
                    if (a=="ok"){
                        alert("123")
                        $("#msg").html("用户名可以注册").css("color","green");
                    }else{
                        alert("000")
                        $("#msg").html("用户已被注册").css("color","red");
                    }
                }

            })
        })
    })

</script>


<script>
    //页面就绪事件
    //下拉框内容
    $(function () {
        $.ajax({
            url:"/hrms/dept/getDeptName",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.departmentList, function () {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                        optionEle.appendTo("#add_department");
                    });
                }
            }
        });

    });
</script>

</body>
</html>
