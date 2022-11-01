<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Add Page</title>
</head>
<body>
<div class="modal fade sal-add-modal" tabindex="-1" role="dialog" aria-labelledby="sal-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">发放工资</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_emp_form">
                    <div class="form-group">
                        <label  for="update_static_empName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control-static" id="update_static_empName" name="eid">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputase" class="col-sm-2 control-label">应发工资</label>
                        <div class="col-sm-8">
                            <input type="email" name="base" class="form-control" id="add_inputase">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">实发工资</label>
                        <div class="col-sm-8">
                            <input type="text" name="net" class="form-control" id="add_inputnet">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputgrant" class="col-sm-2 control-label">发放工资人员</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <input type="text" name="grant" class="form-control" id="add_inputgrant">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary emp_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------工资发放操作-------------------------------------->
    //=======0 点击 员工新增按钮，发送AJAX请求查询部门列表信息，弹出模态框，
    // 将查询得到的部门列表信息显示在对应模态框中部门信息处。=============================
    $(".emp_add_btn").click(function () {

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

        $('.emp-add-modal').modal({
            backdrop:static,
            keyboard:true
        });
    });

    //=========1 当鼠标从姓名输入框移开的时候，判断姓名输入框内的姓名是否重复 ============
/*    $("#add_inputName").change(function () {
        var empName = $("#add_inputName").val();
        $.ajax({
            url:"/hrms/emp/checkEmpExists",
            type:"GET",
            data:"empName="+empName,
            success:function (result) {
                if (result.code == 100){
                    $("#add_inputName").parent().parent().removeClass("has-error");
                    $("#add_inputName").parent().parent().addClass("has-success");
                    $("#helpBlock_add_inputName").text("用户名可用！");
                    $(".emp_save_btn").attr("btn_name_exists", "success");
                }else {
                    $("#add_inputName").parent().parent().removeClass("has-success");
                    $("#add_inputName").parent().parent().addClass("has-error");
                    $("#helpBlock_add_inputName").text(result.extendInfo.name_reg_error);
                    $(".emp_save_btn").attr("btn_name_exists", "error");
                }
            }
        });
    });*/

    //3 保存

    $(".emp_save_btn").click(function () {
        // $(this).attr("href", "/hrms/two/addSal");
        $.ajax({
                url:"/hrms/two/addSal",
                type:"POST",
                data:$(".add_emp_form").serialize(),
                success:function () {
                    alert("工资发放成功");
                }

            });

/*
        //1 获取到第3步：$(".emp_save_btn").attr("btn_name_exists", "success");中btn_name_exists的值
        // btn_name_exists = error，就是姓名重复
        if($(".emp_save_btn").attr("btn_name_exists") == "error"){
            return false;
        }

        //================2 对输入的姓名和邮箱格式进行验证===============
        var inputName = $("#add_inputName").val();
        var inputEmail = $("#add_inputEmail").val();
        //验证格式。姓名：2-5位中文或6-16位英文和数字组合；
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regName.test(inputName)){
            alert("测试：输入姓名格式不正确！");
            //输入框变红
            $("#add_inputName").parent().parent().addClass("has-error");
            //输入框下面显示红色提示信息
            $("#helpBlock_add_inputName").text("输入姓名为2-5位中文或6-16位英文和数字组合");
            return false;
        }else {
            //移除格式
            $("#add_inputName").parent().parent().removeClass("has-error");
            $("#add_inputName").parent().parent().addClass("has-success");
            $("#helpBlock_add_inputName").hide();
        }
        if (!regEmail.test(inputEmail)){
            //输入框变红
            $("#add_inputEmail").parent().parent().addClass("has-error");
            //输入框下面显示红色提示信息
            $("#helpBlock_add_inputEmail").text("输入邮箱格式不正确！");
            return false;
        }else {
            //移除格式
            $("#add_inputEmail").parent().parent().removeClass("has-error");
            $("#add_inputName").parent().parent().addClass("has-success");
            $("#helpBlock_add_inputEmail").hide();
        }*/



        // $.ajax({
        //     url:"/hrms/two/addSal",
        //     type:"POST",
        //     data:$(".add_emp_form").serialize(),
        //     success:function (result) {
        //         if (result.code == 100){
        //             alert("员工新增成功");
        //             $('#emp-add-modal').modal("hide");
        //             //跳往最后一页，由于新增记录，所以要重新查询总页数
        //             $.ajax({
        //                 url:"/hrms/two/getTotalPages",
        //                 type:"GET",
        //                 success:function (result) {
        //                     var totalPage = result.extendInfo.totalPages;
        //                     window.location.href="/hrms/two/getEmpList?pageNo="+totalPage;
        //                 }
        //             })
        //         } else {
        //             alert("员工新增失败！");
        //         }
        //     }
        //
        // });





    });



</script>
</body>
</html>
