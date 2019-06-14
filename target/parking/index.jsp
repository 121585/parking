<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="background" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://api.asilu.com/cdn/jquery.js,jquery.backstretch.min.js" type="text/javascript"></script>
</head>

<body>
<script>
    $(document).ready(function () {
        $('#toLogin').click(function () {
            var username = $("#username").val();
            var password = $("#password").val();
            var email = "";
            /* 判断空字符串 */
            if (username == '' || password == '' || username == null || password == null) {
                alert("错误，用户名或者密码为空！");
                return;
            }
            debugger
            /* 判断登录时使用的是用户名还是邮箱 */
            if (username.indexOf("@") == -1) {

            } else {

                email = username;
            }
            /* 发送ajax请求 */
            $.ajax({
                url: "/login",
                type: "post",
                data: {
                    "username": username,
                    "password": password,
                    "email": email
                },
                success: function (data) {
                    if (data.success == true) {
                        debugger
                        if(data.type==0){
                            window.location.href= "/userIndex.jsp";
                        }else if(data.type==1){
                            window.location.href= "/menWeiIndex.jsp";
                        }else  if(data.type==2){
                            window.location.href= "/adminIndex.jsp";
                        }
                    } else if (data.success == false) {
                        alert("错误,用户名或者密码错误！");
                        return;
                    }
                }
            });
        })
    });
</script>
<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box ">
                <div class="left">
                    <div class="content">
                        <div class="header">
                            <div class="logo text-center"><img src="assets/img/logo-dark.png" alt="Klorofil Logo"></div>
                            <p class="lead">Login to your account</p>
                        </div>
                        <form class="form-auth-small" action="index.php">
                            <div class="form-group">
                                <label  class="control-label sr-only">Email</label>
                                <input type="email" class="form-control" id="username" value="" placeholder="Email or usernamex`">
                            </div>
                            <div class="form-group">
                                <label  class="control-label sr-only">Password</label>
                                <input type="password" class="form-control" id="password" value="" placeholder="Password">
                            </div>
                            <div class="form-group clearfix">
                                <label class="fancy-checkbox element-left">
                                    <input type="checkbox">
                                    <span>Remember me</span>
                                </label>
                            </div>
                            <button type="button" class="btn btn-primary btn-lg btn-block" id="toLogin">LOGIN</button>
                            <button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#register">REGISTER</button>
                            <div class="bottom">
                                <span class="helper-text"><i class="fa fa-lock"></i> <a href="#">Forgot password?</a></span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="right">
                    <div class="overlay"></div>
                    <div class="content text">
                        <h1 class="heading">Free Bootstrap dashboard template</h1>
                        <p>by The Develovers</p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- 注册窗口 -->
    <div id="register" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">注册账号</h4>
                </div>
                <div class="modal-body">
                    <div class="row clearfix">
                        <div class="col-md-12 col-md-offset-2 column">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label><a
                                        style="color: red">*</a>
                                    <div class="col-sm-6">
                                        <input type="email" class="form-control" id="name" placeholder="请输入用户名" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pwd" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label><a
                                        style="color: red">*</a>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="pwd" placeholder="请输入密码" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="repwd" class="col-sm-2 control-label">确认密码</label><a
                                        style="color: red">*</a>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="repwd" placeholder="请确认密码"
                                               required /><span id="tishi"></span>
                                    </div>
                                </div>
                                <div>
                                    <div id="type" style="display: none; " hidden></div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label><a
                                        style="color: red">*</a>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="email" placeholder="请输入邮箱用于注册验证等"
                                               required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</label><a
                                        style="color: red">*</a>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="phone" placeholder="请输入电话号码" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像</label>
                                    <div class="col-sm-6">
                                        <button><span></span>点击上传头像</button>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label>
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
                    <button type="button" class="btn btn-primary" id="toAdd">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <%-- 注册窗口 --%>
</div>
<!-- END WRAPPER -->

</body>
</html>