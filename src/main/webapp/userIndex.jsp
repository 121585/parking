<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="background" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <script href="assets/vendor/jquery/jquery.min.js"></script>
    <script href="assets/vendor/bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script href="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">




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
                            $("#carNumber").val(data.user.carNumber);
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
                var carNumber = $("#carNumber").val();
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
                    data: {'username':username,'password':pwd,'carNumber':carNumber,'email':email,'phone':phone,'image':image,'remarks':remarks,'id':id},
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
<!-- WRAPPER -->
<div id="wrapper">

    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="index.html"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>


            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">


                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/user.png" class="img-circle" alt="Avatar"> <span>${sessionScope.user.username}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                        <ul class="dropdown-menu">
                            <li ><a  ><i class="lnr lnr-cog"></i> <span id="upt">修改信息</span></a></li>
                            <li><a ><i class="lnr lnr-exit"></i> <span id="exit">退出登录</span></a></li>
                        </ul>
                    </li>
                    <!-- <li>
                        <a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
                    </li> -->
                </ul>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="userIndex.jsp" class="active"><i class="lnr lnr-home"></i> <span>预约管理</span></a></li>

                </ul>
            </nav>
        </div>
    </div>

    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <blockquote class="pull-right" style="border-right: 0px; ">

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

    </div>
    <!-- END MAIN -->


    <!-- END WRAPPER -->
    <!-- Javascript -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
    <script src="assets/vendor/chartist/js/chartist.min.js"></script>
    <script src="assets/scripts/klorofil-common.js"></script>

    <%-- 修改模态框 --%>

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
                                    <label class="col-sm-2 control-label">车牌号</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="carNumber"/>
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

    </div>
</body>

</html>
