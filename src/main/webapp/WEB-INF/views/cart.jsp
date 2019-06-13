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

    <title>Electro - Cart</title>

    !-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/slick.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/slick-theme.css'/>"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/nouislider.min.css'/>"/>

    <!-- layui-->
    <link type="text/css" rel="stylesheet" href="<c:url value='/layui/css/layui.css'/>"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="<c:url value='/css/font-awesome.min.css'/>">

    <!-- Custom stlylesheet -->

    <link rel="stylesheet" type="text/css" href="<c:url value='/css/shortcode.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style1.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>

    <!--[endif]-->

    <!-- jQuery Plugins -->
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/slick.min.js'/>"></script>
    <script src="<c:url value='/js/nouislider.min.js'/>"></script>
    <script src="<c:url value='/js/jquery.zoom.min.js'/>"></script>
    <script src="<c:url value='/js/main.js'/>"></script>
    <script src="<c:url value='/layui/layui.js'/>"></script>


    <script type="text/javascript">
        window.onload = function () {
            if (${sessionScope.user != null and sessionScope.haveCart == null}) {
                window.location.href = '<c:url value="/cart/addCartInit.do"><c:param name="url" value="/index"/> </c:url>';
            } else if(${sessionScope.user eq null}) {
                window.location.href = '<c:url value="/user/toLogin.do"></c:url>';
            }
        }

        function searchProduct() {
            var name = $("#search").val();
            var categoryId = $("#category").select().val();
            var url = '<c:url value="/product/searchProduct.do"/>';
            url += '?categoryId=' + categoryId + '&name=' + name;
            location.href = url;
            return false;
        }

        function deleteCartItem(ciid) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/cart/deleteCartItem.do"/> ',
                dataType: 'json',
                data: {
                    ciid: ciid
                },
                success: function (data) {
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.msg('Delete Successful', {icon: 1});
                    });
                    $("#account").load('<c:url value="/ajax/cart.jsp"/> ');

                }
            })
        }

        function deleteAllCartItem(ciid) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/cart/deleteCartItem.do"/> ',
                dataType: 'json',
                data: {
                    ciid: ciid,
                    is_all: 1
                },
                success: function (data) {
                    $("#cart").load('<c:url value="/ajax/cart-home.jsp"/> ');
                }
            })
        }



        function addToCast(pid, type) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/cart/addCartItem.do"/> ',
                dataType: 'json',
                data: {
                    pid: pid
                },
                success: function (data) {
                    if (type == "cart") {
                        $("#cart").load('<c:url value="/ajax/cart-home.jsp"/> ');
                    } else {
                        $("#account").load('<c:url value="/ajax/cart.jsp"/> ');
                    }

                }
            })
        }

    </script>

</head>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +86-178-6421-3754</a></li>
                <li><a href="https://mailto:clxk1997@163.com"><i class="fa fa-envelope-o"></i> clxk1997@163.com</a></li>
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
                        <a href="<c:url value='/index.jsp'/> " class="logo">
                            <img src="<c:url value='/img/logo.png'/>" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select id="category" class="input-select">
                                <option value="0">All Categories</option>
                                <option value="1">Laptops</option>
                                <option value="2">Smartphones</option>
                                <option value="3">Cameras</option>
                                <option value="4">Accessories</option>
                            </select>
                            <input id="search" class="input" placeholder="Search here">
                            <button class="search-btn" onclick="return searchProduct()">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <div id="account">
                    <!-- ACCOUNT -->
                    <div class="col-md-3 clearfix">
                        <div class="header-ctn">
                            <!-- Cart -->
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Your Cart</span>
                                        <div class="qty">${cartCnt}</div>
                                </a>

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
                <li><a href="#">Home</a></li>
                <li><a href="<c:url value='/product/toStore.do?categoryId=-1'/> ">Hot Deals</a></li>
                <li><a href="<c:url value='/product/toStore.do?categoryId=0'/>">Categories</a></li>
                <li><a href="<c:url value='/product/toStore.do?categoryId=1'/> ">Laptops</a></li>
                <li><a href="<c:url value='/product/toStore.do?categoryId=2'/>">Smartphones</a></li>
                <li><a href="<c:url value='/product/toStore.do?categoryId=3'/>">Cameras</a></li>
                <li><a href="<c:url value='/product/toStore.do?categoryId=4'/>">Accessories</a></li>
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
                <h3 class="breadcrumb-header">CART</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="<c:url value='/index.jsp'/> ">HOME</a></li>
                    <li class="active">CART</li>
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
        <!-- row -->
        <div class="row">
            <div id="cart">
                <!-- Cart -->
                <div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
                    <!-- Cart Table -->
                    <div class="cart-table">
                        <table class="table table-bordered table-responsive">
                            <thead>
                            <tr>
                                <th class="product-thumbnail">Item</th>
                                <th class="product-name">Product Name</th>
                                <th class="product-quantity">Quantity</th>
                                <th class="product-unit-price">Unit Price</th>
                                <th class="product-subtotal">Total</th>
                                <th class="product-remove">Remove</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${sessionScope.cart}" var="item">
                                <tr class="cart_item">
                                    <td data-title="Item" class="product-thumbnail"><a href="#"><img
                                            src="<c:url value='/imgs${item.product.productDetails.avatar1}'/> "
                                            alt="Product"/></a></td>
                                    <td data-title="Product Name"><a
                                            href="<c:url value='/product/toProductDetails.do'><c:param name="pid" value="${item.product.pid}"/></c:url>">${item.product.pname}</a>
                                    </td>
                                    <td data-title="Quantity" class="product-quantity">
                                        <div class="prd-quantity" data-title="Quantity">
                                            <input value="-" class="qtyminus btn"
                                                   onclick="deleteCartItem('${item.ciid}','cart')" type="button">
                                            <input name="quantity1" value="${item.count}" class="qty" type="text">
                                            <input value="+" class="qtyplus btn"
                                                   onclick="addToCast('${item.product.pid}','cart')" type="button">
                                        </div>
                                    </td>
                                    <td data-title="Unit Price" class="product-unit-price">$<fmt:formatNumber
                                            type="number"
                                            value='${item.product.price * item.product.discount}'
                                            pattern="#.00"/></td>
                                    <td data-title="Total" class="product-subtotal">$${item.subTotal}</td>
                                    <td data-title="Remove" class="product-remove">
                                        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="deleteAllCartItem('${item.ciid}');">
                                            <i class="layui-icon de">DELETE</i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- Cart Table /- -->
                    <div class="col-md-4 col-sm-6 col-xs-6 cart-collaterals" style="float:right">
                        <div class="cart_totals">
                            <h3>cart totals</h3>
                            <table>
                                <tr>
                                    <th>Sub Total</th>
                                    <td>$${sessionScope.cartTotal}</td>
                                </tr>
                                <tr>
                                    <th>Shipping</th>
                                    <td>Free</td>
                                </tr>
                            </table>
                            <div class="wc-proceed-to-checkout">
                                <a href="<c:url value='/checkout/toCheckout.do'/> " class="checkout-button button alt wc-forward">Proceed to Checkout</a>
                            </div>
                        </div>
                    </div>
                </div><!-- Cart /- -->
            </div></div>

        </div>
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
                            <li><a href="http://mailto:clxk1997@163.com"><i class="fa fa-envelope-o"></i>clxk1997@163.com</a></li>
                            <li><a href="https://blog.csdn.net/l1832876815"><i
                                    class="fa fa-star"></i>blog@l1832876815</a></li>
                            <li><a href="https://github.com/lxk1997"><i class="fa fa-github"></i>github@lxk1997</a></li>
                            <li><a href="https://github.com/lxk1997"><i class="fa fa-bookmark-o"></i>Resume@lxk1997</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <li><a href="<c:url value='/product/toStore.do?categoryId=-1'/> ">Hot deals</a></li>
                            <li><a href="<c:url value='/product/toStore.do?categoryId=0'/>">Laptops</a></li>
                            <li><a href="<c:url value='/product/toStore.do?categoryId=1'/>">Smartphones</a></li>
                            <li><a href="<c:url value='/product/toStore.do?categoryId=2'/>">Cameras</a></li>
                            <li><a href="<c:url value='/product/toStore.do?categoryId=3'/>">Accessories</a></li>
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
                            <li><a href="<c:url value='/user/toLogin.do'/>">My Account</a></li>
                            <li><a href="<c:url value='/cart/toCart.do'/> ">View Cart</a></li>
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

</body>
</html>

