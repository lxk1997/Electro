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

    <!-- Theme styles START -->
    <link href="<c:url value='/css/style2.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/style-shop.css'/>" rel="stylesheet" type="text/css">

</head>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="<c:url value='/product/toAdd.do'/> "><i class="fa fa-phone"></i> +86-178-6421-3754</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> clxk1997@163.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                <li><a href="<c:url value='/user/toLogin.do'/>"><i class="fa fa-user-o"></i> My Account</a></li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="#" class="logo">
                            <img src="<c:url value='/img/logo.png'/>" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select class="input-select">
                                <option value="0">All Categories</option>
                                <option value="1">Laptops</option>
                                <option value="2">Smartphones</option>
                                <option value="3">Cameras</option>
                                <option value="4">Accessories</option>
                            </select>
                            <input class="input" placeholder="Search here">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <div id="account">
                    <!-- ACCOUNT -->
                    <div class="col-md-3 clearfix">
                        <div class="header-ctn">
                            <!-- Wishlist -->
                            <div>
                                <a href="#">
                                    <i class="fa fa-heart-o"></i>
                                    <span>Your Wishlist</span>
                                    <c:if test="${sessionScope.user != null}">
                                        <div class="qty">0</div>
                                    </c:if>
                                </a>
                            </div>
                            <!-- /Wishlist -->
                            <!-- Cart -->
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Your Cart</span>
                                    <c:if test="${sessionScope.user != null}">
                                        <div class="qty">${cartCnt}</div>
                                    </c:if>
                                </a>
                                <c:choose>
                                    <c:when test="${sessionScope.user eq null}">
                                        <div class="cart-dropdown">
                                            <div class="cart-list">

                                            </div>
                                            <div class="cart-summary">
                                                <small>0 Item(s) selected</small>
                                                <h5>SUBTOTAL: $0.00</h5>
                                            </div>
                                            <div class="cart-btns">
                                                <a href="<c:url value='/user/toLogin.do'/>" style="width: 100%;">Login <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="cart-dropdown">
                                            <div class="cart-list">
                                                <c:forEach items="${cart}" var="cartitem">
                                                    <div class="product-widget">
                                                        <div class="product-img">
                                                            <img src="<c:url value='/imgs${cartitem.product.productDetails.avatar1}'/>" alt="">
                                                        </div>
                                                        <div class="product-body">
                                                            <h3 class="product-name"><a href="<c:url value='/product/toProductDetails.do'><c:param name="pid" value="${cartitem.product.pid}"/></c:url>">${cartitem.product.pname}</a></h3>
                                                            <h4 class="product-price"><span class="qty">${cartitem.count}x</span>$<fmt:formatNumber type="number" value="${cartitem.product.price * cartitem.product.discount}" pattern="#.00"/> </h4>
                                                        </div>
                                                        <button class="delete" onclick="deleteCartItem('${cartitem.ciid}')"><i class="fa fa-close"></i></button>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="cart-summary">
                                                <small>${cartCnt} Item(s) selected</small>
                                                <h5>SUBTOTAL: $<fmt:formatNumber type="number" value="${cartTotal}" pattern="#.00"/> </h5>
                                            </div>
                                            <div class="cart-btns">
                                                <a href="<c:url value='/cart/toCart.do'/>">View Cart</a>
                                                <a href="<c:url value='/checkout/toCheckout.do'/>">Checkout <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <!-- /Cart -->
                            <!-- Menu Toogle -->
                            <div class="menu-toggle">
                                <a href="#">
                                    <i class="fa fa-bars"></i>
                                    <span>Menu</span>
                                </a>
                            </div>
                            <!-- /Menu Toogle -->
                        </div>
                    </div>
                    <!-- /ACCOUNT -->
                </div>
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Hot Deals</a></li>
                <li><a href="#">Categories</a></li>
                <li><a href="#">Laptops</a></li>
                <li><a href="#">Smartphones</a></li>
                <li><a href="#">Cameras</a></li>
                <li><a href="#">Accessories</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">LOGIN</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">HOME</a></li>
                    <li class="active">LOGIN</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SIDEBAR -->
            <div class="sidebar col-md-3 col-sm-3">
                <ul class="list-group margin-bottom-25 sidebar-menu">
                    <li class="list-group-item clearfix"><a href="javascript:void(0);" onclick="trasformFrame('my-account')"><i class="fa fa-angle-right"></i> My account</a></li>
                    <li class="list-group-item clearfix"><a href="javascript:void(0);" onclick="trasformFrame('restore-password')"><i class="fa fa-angle-right"></i> Restore Password</a></li>
                    <li class="list-group-item clearfix"><a href="javascript:void(0);" onclick="trasformFrame('address-book')"><i class="fa fa-angle-right"></i> Address book</a></li>
                    <li class="list-group-item clearfix"><a href="javascript:void(0);" onclick="trasformFrame('orders')"><i class="fa fa-angle-right"></i>My Orders</a></li>
                    <li class="list-group-item clearfix"><a href="<c:url value='/user/logout.do'/> "><i class="fa fa-angle-right"></i> Logout</a></li>
                </ul>
            </div>
            <!-- END SIDEBAR -->

            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7" id="content">

            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->


<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>Shandong Qingdao</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+86-178-6421-3754</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>clxk1997@163.com</a></li>
                            <li><a href="https://blog.csdn.net/l1832876815"><i class="fa fa-star"></i>blog@l1832876815</a></li>
                            <li><a href="https://github.com/lxk1997"><i class="fa fa-github"></i>github@lxk1997</a></li>
                            <li><a href="https://github.com/lxk1997"><i class="fa fa-bookmark-o"></i>Resume@lxk1997</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
								Copyright &copy;<script>document.write(new Date().getFullYear());</script>clxk1997
                    </span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/slick.min.js'/>"></script>
<script src="<c:url value='/js/nouislider.min.js'/>"></script>
<script src="<c:url value='/js/jquery.zoom.min.js'/>"></script>
<script src="<c:url value='/js/main.js'/>"></script>

<script type="text/javascript">
    window.onload = function () {
        if(${sessionScope.user != null and sessionScope.haveCart == null}) {
            window.location.href = '<c:url value="/cart/addCartInit.do"><c:param name="url" value="/index"/> </c:url>';
        }
    }


    function deleteCartItem(ciid) {
        $.ajax({
            type: 'post',
            url: '<c:url value="/cart/deleteCartItem.do"/> ',
            dataType: 'text',
            data: {
                ciid: ciid
            },
            success: function (data) {
                $("#account").load('<c:url value="/ajax/cart.jsp"/> ');

            }
        })
    }

    {
        if (${sessionScope.user != null} && ${sessionScope.haveCart == null}) {
            window.location.href = '<c:url value="/cart/addCartInit.do"><c:param name="url" value="/index"/> </c:url>';
        }
    }

</script>

</body>
</html>

