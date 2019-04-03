<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="../css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="../css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="../img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../img/favicon.png">
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box ">
                <div class="left">
                    <div class="content">
                        <div class="header">
                            <div class="logo text-center"><img src="../img/logo.png" style="background-color: #15161D"
                                                               alt="Electro Logo"></div>
                            <p class="lead">Login to your account</p>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="username" name="username" value=""
                                   placeholder="Username">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="password" name="password" value=""
                                   placeholder="Password">
                        </div>
                        <div class="form-group clearfix">
                            <label class="fancy-checkbox element-left">
                                <input type="checkbox">
                                <span>Remember me</span>
                            </label>
                        </div>
                        <button class="btn btn-primary btn-lg btn-block" onclick="login()">LOGIN</button>
                        <span style="color: red;margin-left: 3px;" name="errorstatus"></span>
                        <div class="bottom">
                            <span class="helper-text"><i class="fa fa-lock"></i> <a href="#">Forgot password?</a></span>
                        </div>
                    </div>
                </div>
                <div class="right">
                    <div class="overlay"></div>
                    <div class="content text">
                        <h1 class="heading">The Backstage Management System</h1>
                        <p>by Clxk@Electro</p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
</body>

<!-- jQuery Plugins -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/slick.min.js"></script>
<script src="../js/nouislider.min.js"></script>
<script src="../js/jquery.zoom.min.js"></script>
<script src="../js/main.js"></script>

<script type="text/javascript">

    function login() {
        var username = $("input[name='username']").val();
        var password = $("input[name='password']").val();
        $.ajax({
            type: 'post',
            url: 'login',
            dataType: 'text',
            data: {
                username: username,
                password: password
            },
            success: function (data) {
                if(data == 'SUCCESS') {
                    window.location.href='/eshop_war_exploded/index.jsp';
                } else {
                    $("span[name='errorstatus']").html(data);
                    $("input[name='username']").val('');
                    $("input[name='password']").val('');
                }
            }
        })
    }
</script>

</html>
