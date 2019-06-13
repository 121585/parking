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
    <script src="http://api.asilu.com/cdn/jquery.js,jquery.backstretch.min.js" type="text/javascript"></script>
    <script src="/js/verify.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/verify.css">
    <style>
        .btn-group, .btn-group-vertical {

            margin-top: 34px;
        }
    </style>
</head>
<body>
<%-- 登录 --%>
<script>
    $(document).ready(function () {

        $('#toLogin').click(function () {
            debugger
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
                        window.location.href = "/userIndex.jsp";
                    } else if (data.success == false) {
                        alert("错误,用户名或者密码错误！");
                        return;
                    }
                }
            });
        })
    });
</script>
<%-- 登录 --%>
<%-- 验证密码 --%>
<%-- 验证密码 --%>

<%-- 邮箱验证 --%>

<%-- 手机号验证 --%>


<%-- 背景轮播图 --%>
<script type="text/javascript">
    $.backstretch([
        'http://api.asilu.com/cdn/img/bg/444.jpg',
        'http://api.asilu.com/cdn/img/bg/445.jpg',
        'http://api.asilu.com/cdn/img/bg/446.jpg',
        'http://api.asilu.com/cdn/img/bg/447.jpg',
        'http://api.asilu.com/cdn/img/bg/448.jpg'
    ], {
        fade: 1000, // 动画时长
        duration: 2000 // 切换延时
    });
</script>

<%-- 正则表达式校验手机号格式 --%>
<script>

</script>

<%--<div style="text-align:center; margin-top: 18%">
    <button type="submit" data-toggle="modal" class="btn btn-success " data-target="#register"><span
            class="glyphicon glyphicon-user"></span>登录
    </button>
    <button type="button" data-toggle="modal" class="btn btn-danger " data-target="#login" href=""><span
            class="glyphicon glyphicon-log-in"></span>注册
    </button>
</div>--%>
<!--bs中所有的均应该包裹在其中。-->
<div class="container">
    <!-- row是珊栏系统的包裹容器-->
    <div class="row">
        <!-- col-md-x 表示此珊栏占据几个格子，offset-x 是偏移x格子-->
        <div class="col-md-4 col-md-offset-4">
            <!-- panel分为3个部分，heading,body,footer其中heading部分的颜色来自于panel-default的颜色-->
            <div class="panel panel-default" style="margin-top: 50%;">
                <!-- panel-headeing是有颜色的，此颜色来自于panel-default-->
                <div class="panel-heading">登录信息</div>
                <div class="panel-body">
                    <form action="#">
                        <!-- form-group设置了距离上下部分div的距离，更美观。-->
                        <div class="form-group">
                            <!-- form-control 设置了边框有弧度圆角以及其中输入字体的pading以及margin,placeholder为默认的问题-->
                            <input type="text" class="form-control" id="username" name="username"
                                   placeholder="请输入用户名或邮箱">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="请输入登录密码">
                        </div>
                        <%--<div class="form-group" style="display: none;">
                            <div id="verification"></div>
                        </div>--%>

                        <!-- checkbox 效果同form-group-->
                        <div class="checkbox">
                            <!-- 此处用label包裹checkbox 的原因是为了点击记住密码也能对复选框进行选择。-->
                            <label>
                                <input type="checkbox" name="remeber">记住密码
                            </label>

                            <a href="#" style="float: right; color: red">找回密码</a>
                        </div>
                        <!-- button的btn-block 可以占满当前珊栏而不用自适应。-->
                        <button type="button" id="toLogin" class="btn btn-success btn-block btn-lg">登录
                        </button>
                        <button type="button" class="btn btn-success btn-block btn-lg" data-toggle="modal"
                                data-target="#register">注册
                        </button>
                    </form>
                </div>
            </div>
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
                                           required onkeyup="validate()"/><span id="tishi"></span>
                                </div>
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
</body>
<%--<script>
    $('#toLogin').pointsVerify({
        defaultNum: 4,    //默认的文字数量
        checkNum: 2,  //校对的文字数量
        vSpace: 5,    //间隔
        imgName: ['1.jpg', '2.jpg'],
        imgSize: {
            width: '600px',
            height: '200px',
        },
        barSize: {
            width: '600px',
            height: '40px',
        },
        ready: function () {
        },
        success: function () {
            alert('验证成功，添加你自己的代码！');
            //......后续操作
        },
        error: function () {
//               alert('验证失败！');
        }

    });
</script>--%>
</html>