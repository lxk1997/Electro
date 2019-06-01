<%@ page import="java.util.Date" %>
<%@ page import="com.clxk.electro.common.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin-ProductTable</title>
    <!-- ================= Favicon ================== -->
    <!-- ================= Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">

    <!-- Styles -->
    <link href="<c:url value='/assets/css/lib/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/lib/themify-icons.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/lib/data-table/buttons.bootstrap.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/assets/css/lib/menubar/sidebar.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/lib/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/lib/helper.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/style.css'/>" rel="stylesheet">
</head>

<body>

<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <ul>
                <div class="logo"><a href="<c:url value='/admin_index.jsp'/> "><!-- <img src="assets/images/logo.png" alt="" /> --><span>Electro</span></a></div>
                <li class="label">Main</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-home"></i> 总览</a></li>

                <li class="label">Table</li>
                <li><a href="<c:url value='/user/table/getUserTable.do'/>"><i class="ti-layout-grid4-alt"></i> 用户管理 </a></li>
                <li><a class="sidebar-sub-toggle"><i class="ti-layout-grid4-alt"></i> 商品管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="<c:url value='/product/table/getProductTable.do?category=all&type=simple'/>">所有分类</a></li>

                        <li><a href="<c:url value='/product/table/getProductTable.do?category=1&type=simple'/>">电脑</a></li>
                        <li><a href="<c:url value='/product/table/getProductTable.do?category=2&type=simple'/>">智能手机</a></li>
                        <li><a href="<c:url value='/product/table/getProductTable.do?category=3&type=simple'/>">相机 </a></li>
                        <li><a href="<c:url value='/product/table/getProductTable.do?category=4&type=simple'/>">穿戴设备 </a></li>
                    </ul>
                </li>
                <li><a href="<c:url value='/department/table/getDepartment.do?type=simple'/>"><i class="ti-layout-grid4-alt"></i> 部门管理 </a></li>
                <li><a href="<c:url value='/manager/table/getManagerTable.do?type=simple'/>"><i class="ti-layout-grid4-alt"></i> 管理员管理 </a></li>
                <li><a href="<c:url value='/category/table/getCategory.do?type=simple'/>"><i class="ti-layout-grid4-alt"></i> 商品分类管理 </a></li>
                <li><a class="sidebar-sub-toggle"><i class="ti-layout-grid4-alt"></i> 订单管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="table-basic.html">所有分类</a></li>

                        <li><a href="table-export.html">未付款</a></li>
                        <li><a href="table-row-select.html">未发货</a></li>
                        <li><a href="table-jsgrid.html">未收货 </a></li>
                        <li><a href="table-jsgrid.html">已完成 </a></li>
                    </ul>
                </li>
                <li><a href="app-event-calender.html"><i class="ti-calendar"></i> Calender </a></li>
                <li><a href="app-email.html"><i class="ti-email"></i> Email</a></li>
                <li><a href="app-profile.html"><i class="ti-user"></i> Profile</a></li>
                <li><a href="app-widget-card.html"><i class="ti-layout-grid2-alt"></i> Widget</a></li>
                <li class="label">Features</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-layout"></i> UI Elements <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="ui-typography.html">Typography</a></li>
                        <li><a href="ui-alerts.html">Alerts</a></li>

                        <li><a href="ui-button.html">Button</a></li>
                        <li><a href="ui-dropdown.html">Dropdown</a></li>


                        <li><a href="ui-progressbar.html">Progressbar</a></li>

                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-panel"></i> Components <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="uc-calendar.html">Calendar</a></li>
                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-layout-grid4-alt"></i> Table <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="table-basic.html">Basic</a></li>

                        <li><a href="table-export.html">Datatable Export</a></li>
                        <li><a href="table-row-select.html">Datatable Row Select</a></li>
                        <li><a href="table-jsgrid.html">Editable </a></li>
                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-heart"></i> Icons <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="font-themify.html">Themify</a></li>
                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-map"></i> Maps <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="vector-map.html">Vector Map</a></li>
                    </ul>
                </li>
                <li class="label">Form</li>
                <li><a href="form-basic.html"><i class="ti-view-list-alt"></i> Basic Form </a></li>
                <li class="label">Extra</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-files"></i> Invoice <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="invoice.html">Basic</a></li>
                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-target"></i> Pages <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="page-login.html">Login</a></li>
                        <li><a href="page-register.html">Register</a></li>
                        <li><a href="page-reset-password.html">Forgot password</a></li>
                    </ul>
                </li>
                <li><a><i class="ti-close"></i> Logout</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- /# sidebar -->

<div class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="float-left">
                    <div class="hamburger sidebar-toggle">
                        <span class="line"></span>
                        <span class="line"></span>
                        <span class="line"></span>
                    </div>
                </div>
                <div class="float-right">
                    <div class="dropdown dib">
                        <div class="header-icon" data-toggle="dropdown">
                            <i class="ti-bell"></i>
                            <div class="drop-down dropdown-menu dropdown-menu-right">
                                <div class="dropdown-content-heading">
                                    <span class="text-left">Recent Notifications</span>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">5 members joined today </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mariam</div>
                                                    <div class="notification-text">likes a photo of you</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Tasnim</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="text-center">
                                            <a href="#" class="more-link">See All</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown dib">
                        <div class="header-icon" data-toggle="dropdown">
                            <i class="ti-email"></i>
                            <div class="drop-down dropdown-menu dropdown-menu-right">
                                <div class="dropdown-content-heading">
                                    <span class="text-left">2 New Messages</span>
                                    <a href="email.html">
                                        <i class="ti-pencil-alt pull-right"></i>
                                    </a>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li class="notification-unread">
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/1.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Michael Qin</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/2.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/3.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Michael Qin</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/2.jpg" alt="" />
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="text-center">
                                            <a href="#" class="more-link">See All</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown dib">
                        <div class="header-icon" data-toggle="dropdown">
                                <span class="user-avatar">John
                                    <i class="ti-angle-down f-s-10"></i>
                                </span>
                            <div class="drop-down dropdown-profile dropdown-menu dropdown-menu-right">
                                <div class="dropdown-content-heading">
                                    <span class="text-left">Upgrade Now</span>
                                    <p class="trial-day">30 Days Trail</p>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <i class="ti-user"></i>
                                                <span>Profile</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <i class="ti-email"></i>
                                                <span>Inbox</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="ti-settings"></i>
                                                <span>Setting</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <i class="ti-lock"></i>
                                                <span>Lock Screen</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="ti-power-off"></i>
                                                <span>Logout</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>Hello, <span>Welcome Here</span></h1>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <li class="breadcrumb-item active">User-Table</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <section id="main-content">
                <div class="row" style="text-align: center">
                    <form id="form" action="<c:url value='/product/upload.do'/> " method="POST" enctype="multipart/form-data">
                        <input type="text" class="form-control input-default"
                               name="pname" placeholder="Product Name*" style="margin-bottom: 20px;" value="${requestScope.pname}">
                        <select name="categoryId" class="form-control" style="margin-bottom: 20px;" value="${requestScope.categoryId}">
                            <option value="1">Laptops</option>
                            <option value="2">Smartphones</option>
                            <option value="3">Cameras</option>
                            <option value="4">Accessories</option>
                        </select>
                        <input type="text" class="form-control input-default"
                               name="price" placeholder="Product Price*" style="margin-bottom: 20px;" value="${requestScope.price}">
                        <input type="text" class="form-control input-default"
                               name="firstcost" placeholder="Firstcost*" style="margin-bottom: 20px;" value="${requestScope.firstcost}">
                        <input type="text" class="form-control input-default"
                               name="discount" placeholder="Discount*" style="margin-bottom: 20px;" value="${requestScope.discount}">
                        <input type="number" class="form-control input-default"
                               name="stock" placeholder="Stock*" style="margin-bottom: 20px;" value="${requestScope.stock}">
                        <input type="hidden" name="date" value="<%=new Date()%>">
                        Avatar: <input type="file" class="file-input" name="img1" style="margin-bottom: 20px;">
                        <input type="file" class="file-input" name="img2" style="margin-bottom: 20px;">
                        <input type="file" class="file-input" name="img3" style="margin-bottom: 20px;">
                        <input type="file" class="file-input" name="img4" style="margin-bottom: 20px;">
                        <textarea class="form-control" rows="3" name="description" placeholder="Description*" style="margin-bottom: 20px;">${requestScope.description}</textarea>
                        <textarea class="form-control" rows="3" name="details" placeholder="Details*" style="margin-bottom: 20px;" >${requestScope.details}</textarea>
                        <input type="hidden" name="ratings"><br>
                        <a  href="#" id="msg" style="color: red">${requestScope.msg}</a><br>
                        <input type="button" class="btn btn-primary" value="Upload" style="margin-right: 120px;" onclick="upload();">
                        <input type="reset" class="btn btn-primary" value="Reset">
                    </form>
                </div>
                <!-- /# row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer">
                            <p>2018 © Admin Board. - <a href="#">example.com</a> / More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<!-- jquery vendor -->
<script src="<c:url value='/assets/js/lib/jquery.min.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jquery.nanoscroller.min.js'/>"></script>
<!-- nano scroller -->
<script src="<c:url value='/assets/js/lib/menubar/sidebar.js'/>"></script>
<script src="<c:url value='/assets/js/lib/preloader/pace.min.js'/>"></script>
<!-- sidebar -->

<!-- bootstrap -->

<script src="<c:url value='/assets/js/lib/bootstrap.min.js'/>"></script><script src="assets/js/scripts.js'/>"></script>
<!-- scripit init-->
<script src="<c:url value='/assets/js/lib/data-table/datatables.min.js'/>"></script>
<script src="<c:url value='/assets/js/lib/data-table/dataTables.buttons.min.js'/>"></script>
<script src="<c:url value='/assets/js/lib/data-table/buttons.flash.min.js'/>"></script>
<script src="<c:url value='/assets/js/lib/data-table/jszip.min.js'/>"></script>
<script src="<c:url value='/assets/js/lib/data-table/pdfmake.min.js'/>"></script>
<script src="<c:url value='/assets/js/lib/data-table/vfs_fonts.js'/>"></script>
<script src="<c:url value='/assets/js/lib/data-table/buttons.html5.min.js'/>"></script>
<script src="<c:url value='/assets/js/lib/data-table/buttons.print.min.js'/>"></script>
<script src="<c:url value='/assets/js/lib/data-table/datatables-init.js'/>"></script>
</body>

<script type="text/javascript">
    function upload() {
        var pname = $("input[name='pname']").val();
        var categoryId = $("select[name='categoryId']").val();
        var price = $("input[name='price']").val();
        var firstcost = $("input[name='firstcost']").val();
        var discount = $("input[name='discount']").val();
        var stock = $("input[name='stock']").val();
        var avatar1 = $("input[name='img1']").val();
        var avatar2 = $("input[name='img2']").val();
        var avatar3 = $("input[name='img3']").val();
        var avatar4 = $("input[name='img4']").val();
        var description = $("textarea[name='description']").val();
        var details = $("textarea[name='details']").val();
        var rating = $("input[name='rating']").val();
        if(pname == "") {
            $("a[id='msg']").text("Null Product Name!");
        } else if(price == "") {
            $("a[id='msg']").text("Null Price!");
        } else if(firstcost == "") {
            $("a[id='msg']").text("Null Firstcost!");
        } else if(discount == "") {
            $("a[id='msg']").text("Null Discount!");
        } else if(stock == "") {
            $("a[id='msg']").text("Null Stock!");
        } else if(description == "") {
            $("a[id='msg']").text("Null Description!");
        } else if(details == "") {
            $("a[id='msg']").text("Null Details!");
        } else if(avatar1 == "" || avatar2 == "" || avatar3 == "" || avatar4 == "") {
            $("a[id='msg']").text("Null Avatar!");
        } else if(isNaN(price) == true) {
            $("a[id='msg']").text("Price Error!");
        } else if(isNaN(firstcost) == true) {
            $("a[id='msg']").text("Firstcost Error!");
        } else if(isNaN(discount) == true) {
            $("a[id='msg']").text("Discount Error!");
        } else {
            $("form[id='form']").submit();
        }
    }
</script>
</html>


