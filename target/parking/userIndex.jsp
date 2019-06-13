<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="background" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- 可选的Bootstrap主题文件（一般不使用） -->
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            /* 退出登录 */
            $("#exit").click(function () {
                /* 发送ajax请求 */
                $.ajax({
                    url: "/exit",
                    type: "get",
                    success: function (data) {
                        if (data.success == true) {
                            alert("成功退出登录");
                            window.location.href = "/index.jsp";
                        }
                    }
                });
            });


            $("#upt").click(function () {
                $('#uptModal').modal('show');
                var id = '${sessionScope.user.id}';
                $.ajax({
                    url: "/upt",
                    data: {"id":id},
                    type: "get",
                    success: function (data) {
                        if (data.success==true){
                            $('#uptModal').modal('show')
                            /* 赋值 */
                            $("#username").val(data.user.username);
                            $("#pwd").val(data.user.password);
                            $("#email").val(data.user.email);
                            $("#phone").val(data.user.phone);
                            $("#image").val(data.user.image);
                            $("#remarks").val(data.user.remarks);
                            $("#id").val(id);
                        }
                    }
                });

            });

            /* 修改用户 */
            $("#doUpt").click(function () {
                /* 取值 */
                var id = $("#id").val();
                var username = $("#username").val();
                var pwd = $("#pwd").val();
                var email = $("#email").val();
                var phone = $("#phone").val();
                var image = $("#image").val();
                var remarks = $("#remarks").val();
                /* 非空判断 */
                if(pwd == null ){
                    alert("密码不能为空");
                    return;
                }
                /* 发送ajax请求 */
                $.ajax({
                    url: "/doUpt",
                    data: {'username':username,'password':pwd,'email':email,'phone':phone,'image':image,'remarks':remarks,'id':id},
                    type: "post",
                    success: function (data) {
                        debugger
                        if (data.success==true){
                            $('#uptModal').modal('hide');
                            alert("修改成功");
                            location.reload();
                        }
                    }

                });
            })
        })
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <blockquote class="pull-right" style="border-right: 0px; ">
                <p>
                <div>
                    <div style="display: inline; float: left">
                        <iframe width="450" scrolling="no" height="18" frameborder="0" allowtransparency="true"
                                src="//i.tianqi.com/index.php?c=code&id=1&icon=1&wind=1&num=2&site=12"></iframe>
                    </div>
                    <div style="display: inline">
                        <button id="upt">${sessionScope.user.username} </button>
                    </div>
                    <div style="display: inline"><button id="exit">退出</button></div>
                </div>
                </p>
            </blockquote>
            <table class="table">
                <thead>
                <tr>
                    <th>
                        <span>已预约数</span>
                    </th>
                    <th>
                        <span>剩余可预约数</span>
                    </th>
                    <th>
                        <span>今日收费金额</span>
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr class="info">
                    <td>
                        1
                    </td>
                    <td>
                        TB - Monthly
                    </td>
                    <td>
                        01/04/2012
                    </td>
                    <td>
                        <a href="">预约</a>
                    </td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>
</div>
<%-- 修改模态框 --%>
<div class="container">


    <div id="uptModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">修改信息</h4>
                </div>
                <div class="modal-body">
                    <div class="row clearfix">
                        <div class="col-md-12 col-md-offset-2 column">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户名</label>
                                    <div class="col-sm-6">
                                        <input type="email" class="form-control" id="username"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="pwd"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">确认密码</label>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="repwd"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="email"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="phone" placeholder="请输入电话号码"
                                               required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像</label>
                                    <div class="col-sm-6">
                                        ${session.user.image}<br/>
                                        <button id="image"><span></span>点击修改头像</button>
                                    </div>
                                </div>

                                <input type="hidden" class="form-control" id="id"/>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">备注</label>
                                    <div class="col-sm-6">
                                        <textarea id="remarks" class="form-control" rows="5"></textarea>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="doUpt">修改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>
</body>
</html>
