<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin-Editable-ManagerTable</title>
    <!-- ================= Favicon ================== -->
    <!-- ================= Favicon ================== -->
    <!-- Standard -->
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
    <link href="<c:url value='/assets/css/lib/jsgrid/jsgrid-theme.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/assets/css/lib/jsgrid/jsgrid.min.css'/>" type="text/css" rel="stylesheet" />
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
                        <li><a href="<c:url value='/orderItem/table/getOrderTable.do?type=simple&status=0'/>">所有分类</a></li>

                        <li><a href="<c:url value='/orderItem/table/getOrderTable.do?type=simple&status=1'/>">未付款</a></li>
                        <li><a href="<c:url value='/orderItem/table/getOrderTable.do?type=simple&status=2'/>">未发货</a></li>
                        <li><a href="<c:url value='/orderItem/table/getOrderTable.do?type=simple&status=3'/>">未收货 </a></li>
                        <li><a href="<c:url value='/orderItem/table/getOrderTable.do?type=simple&status=4'/>">已完成 </a></li>
                    </ul>
                </li>
                <li><a href="app-event-calender.html"><i class="ti-calendar"></i> Calender </a></li>
                <li><a href="app-email.html"><i class="ti-email"></i> Email</a></li>
                <li><a href="app-profile.html"><i class="ti-user"></i> Profile</a></li>
                <li><a href="app-widget-card.html"><i class="ti-layout-grid2-alt"></i> Widget</a></li>
                <li class="label">Features</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-layout"></i> UI Elements <span
                        class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="ui-typography.html">Typography</a></li>
                        <li><a href="ui-alerts.html">Alerts</a></li>

                        <li><a href="ui-button.html">Button</a></li>
                        <li><a href="ui-dropdown.html">Dropdown</a></li>


                        <li><a href="ui-progressbar.html">Progressbar</a></li>

                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-panel"></i> Components <span
                        class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="uc-calendar.html">Calendar</a></li>
                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-layout-grid4-alt"></i> Table <span
                        class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="table-basic.html">Basic</a></li>

                        <li><a href="table-export.html">Datatable Export</a></li>
                        <li><a href="table-row-select.html">Datatable Row Select</a></li>
                        <li><a href="table-jsgrid.html">Editable </a></li>
                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-heart"></i> Icons <span
                        class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="font-themify.html">Themify</a></li>
                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-map"></i> Maps <span
                        class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="vector-map.html">Vector Map</a></li>
                    </ul>
                </li>
                <li class="label">Form</li>
                <li><a href="form-basic.html"><i class="ti-view-list-alt"></i> Basic Form </a></li>
                <li class="label">Extra</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-files"></i> Invoice <span
                        class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="invoice.html">Basic</a></li>
                    </ul>
                </li>
                <li><a class="sidebar-sub-toggle"><i class="ti-target"></i> Pages <span
                        class="sidebar-collapse-icon ti-angle-down"></span></a>
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
                                                <img class="pull-left m-r-10 avatar-img"
                                                     src="assets/images/avatar/3.jpg" alt=""/>
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">5 members joined today</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img"
                                                     src="assets/images/avatar/3.jpg" alt=""/>
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mariam</div>
                                                    <div class="notification-text">likes a photo of you</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img"
                                                     src="assets/images/avatar/3.jpg" alt=""/>
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Tasnim</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you
                                                        ...
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img"
                                                     src="assets/images/avatar/3.jpg" alt=""/>
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you
                                                        ...
                                                    </div>
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
                                                <img class="pull-left m-r-10 avatar-img"
                                                     src="assets/images/avatar/1.jpg" alt=""/>
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Michael Qin</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you
                                                        ...
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img"
                                                     src="assets/images/avatar/2.jpg" alt=""/>
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you
                                                        ...
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img"
                                                     src="assets/images/avatar/3.jpg" alt=""/>
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Michael Qin</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you
                                                        ...
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img class="pull-left m-r-10 avatar-img"
                                                     src="assets/images/avatar/2.jpg" alt=""/>
                                                <div class="notification-content">
                                                    <small class="notification-timestamp pull-right">02:34 PM</small>
                                                    <div class="notification-heading">Mr. John</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you
                                                        ...
                                                    </div>
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
                                <li class="breadcrumb-item active">Editable-Manager-Table</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <div id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="jsgrid-table-panel">
                                <div id="jsGrid"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer">
                            <p>2018 © Admin Board. - <a href="#">example.com</a> / More Templates <a
                                    href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from
                                <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
                        </div>
                    </div>
                </div>
            </div>
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



<!-- JS Grid Scripts Start-->
<script src="<c:url value='/assets/js/lib/jsgrid/jsgrid.core.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jsgrid/jsgrid.load-indicator.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jsgrid/jsgrid.load-strategies.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jsgrid/jsgrid.sort-strategies.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jsgrid/jsgrid.field.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jsgrid/fields/jsgrid.field.text.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jsgrid/fields/jsgrid.field.number.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jsgrid/fields/jsgrid.field.select.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jsgrid/fields/jsgrid.field.checkbox.js'/>"></script>
<script src="<c:url value='/assets/js/lib/jsgrid/fields/jsgrid.field.control.js'/>"></script>
<!-- JS Grid Scripts End-->

<script src="<c:url value='/assets/js/lib/bootstrap.min.js'/>"></script><script src="<c:url value='/assets/js/scripts.js'/>"></script>
<!-- scripit init-->

<script type="text/javascript">
    window.onload = function () {
        var users;
        var db = {

            loadData: function (filter) {
                $.ajax({
                    type: "post",
                    url: "<c:url value='/user/table/loadDataToGrad.do'/>",
                    dataType: 'json',
                    async: false,
                    success: function (data) {
                        users = eval("(" + data + ")");
                    }
                });
                return users;
            },

            updateItem: function (updatingClient) {
                $.ajax({
                    type: 'post',
                    url: '<c:url value="/user/updateUser.do?type=editable"/> ',
                    data: {
                        uid: updatingClient["User Id"],
                        uname: updatingClient["User Name"],
                        password: updatingClient["Password"],
                        email: updatingClient["Email"],
                        phone: updatingClient["Telphone"],
                    }
                })
            },


        };

        $("#jsGrid").jsGrid({
            height: "100%",
            width: "100%",
            filtering: false,
            editing: true,
            sorting: true,
            paging: true,
            autoload: true,
            pageCount: 15,
            pageButtonCount: 10,
            deleteConfirm: "Do you really want to delete the item?",
            controller: db,
            fields: [
                {name: "User Id", type: "text", editing: false},
                {name: "User Name", type: "text", editing: false},
                {name: "Password", type: "text"},
                {name: "Email", type: "text"},
                {name: "Telphone", type: "text"},
                {type: "control"}
            ]
        })
    }
</script>
</body>

</html>


