<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/slick.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/slick-theme.css'/>"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/nouislider.min.css'/>"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="<c:url value='/css/font-awesome.min.css'/>">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>

    <script src="<c:url value='/js/jquery.min.js'/>"></script>

    <script type="text/javascript">

        updateAccount = function () {
            var email = $("input[name='email']").val();
            var phone = $("input[name='telphone']").val();

            $.ajax({
                type: 'post',
                url: '<c:url value="/user/updateAccount.do"/> ',
                dataType: 'json',
                data: {
                    email: email,
                    phone, phone
                },
                success: function (data) {
                    if(data != "SUCCESS") {
                        $("span[name='errorstatus']").text(data);
                    } else {
                        alert("修改成功!");
                    }
                }
            })
        }
    </script>

</head>
<body>
<h1>MY ACCOUNT</h1>

<div class="form-group">
    <input class="input" style="width: 600px" type="text" name="uname" placeholder="User Name" readonly="readonly" value="${sessionScope.user.uname}">
</div>
<div class="form-group">
    <input class="input" style="width: 600px" type="text" name="email" placeholder="Email" value="${sessionScope.user.email}">
</div>
<div class="form-group">
    <input class="input" style="width: 600px" type="text" name="telphone" placeholder="Telphone" value="${sessionScope.user.phone}">
</div>
<a href="javascript:updateAccount();" class="btn btn-default" style="margin-left: 2px">UPDATE</a>
<span style="color: red;margin-left: 3px;" name="errorstatus"></span>
<!-- jQuery Plugins -->

<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/slick.min.js'/>"></script>
<script src="<c:url value='/js/nouislider.min.js'/>"></script>
<script src="<c:url value='/js/jquery.zoom.min.js'/>"></script>
<script src="<c:url value='/js/main.js'/>"></script>
</body>
</html>

