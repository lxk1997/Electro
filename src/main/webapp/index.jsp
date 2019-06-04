<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="<c:url value='/css/font-awesome.min.css'/>"/>

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>

    <!-- layui-->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/layui.css'/>"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery Plugins -->
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/js/layui.all.js'/>"></script>

    <script type="text/javascript">


        function updateHotDealTime() {
            var date = new Date();
            $("#days").html((7 - date.getDay()) % 7);//0-6 now 周三 ，还有 4天， 显示 3
            $("#hours").html(23 - date.getHours());// 0-23 now 5点， 还有 18个小时
            $("#minute").html(59 - date.getMinutes());
            $("#secends").html(60 - date.getSeconds());
        }


        setInterval(updateHotDealTime, 1000);

        function refresh(number, model) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/init/newProductRefresh.do"/> ',
                dataType: 'text',
                data: {
                    number: number,
                    type: model
                },
                success: function (data) {
                    if(model != "np")
                        $("#topSelling").load('<c:url value="/ajax/index-topSelling.jsp"/>');
                    else
                        $("#newProduct").load('<c:url value="/ajax/index-newProduct.jsp"/>');
                }
            })
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
            console.log("加载购物车");
            window.location.href = '<c:url value="/cart/addCartInit.do"><c:param name="url" value="/index"/> </c:url>';
        }
        }

        function addToCast(pid) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/cart/addCartItem.do"/> ',
                dataType: 'text',
                data: {
                    pid: pid
                },
                success: function (data) {
                    $("#account").load('<c:url value="/ajax/cart.jsp"/> ');

                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.msg('添加成功', {
                            icon: 1,
                            time: 1000
                        });
                    });
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
                                                <a href="<c:url value='/user/toLogin.do'/> ">Login <i class="fa fa-arrow-circle-right"></i></a>
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

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- shop -->
            <div class="col-md-3 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="<c:url value='/img/shop01.png'/>" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Laptop<br>Collection</h3>
                        <a href="<c:url value='/product/toStore.do'><c:param name="categoryId" value="1"/></c:url> "
                           class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->
            <!-- shop -->
            <div class="col-md-3 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="<c:url value='/img/shop2.png'/>" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Smartphone<br>Collection</h3>
                        <a href="<c:url value='/product/toStore.do'><c:param name="categoryId" value="2"/></c:url>"
                           class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-3 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="<c:url value='/img/shop02.png'/>" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Cameras<br>Collection</h3>
                        <a href="<c:url value='/product/toStore.do'><c:param name="categoryId" value="3"/></c:url>"
                           class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-3 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="<c:url value='/img/shop03.png'/>" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Accessories<br>Collection</h3>
                        <a href="<c:url value='/product/toStore.do'><c:param name="categoryId" value="4"/></c:url>"
                           class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">New Products</h3>
                    <div class="section-nav">
                        <ul id="ul-new-product" class="section-tab-nav tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab1"
                                                  onclick="refresh(1,'np');">Laptops</a></li>
                            <li><a data-toggle="tab" href="#tab1" onclick="refresh(2,'np');">Smartphones</a></li>
                            <li><a data-toggle="tab" href="#tab1" onclick="refresh(3,'np');">Cameras</a></li>
                            <li><a data-toggle="tab" href="#tab1" onclick="refresh(4,'np');">Accessories</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->
            <div id="newProduct">
                <!-- Products tab & slick -->
                <div class="col-md-12">
                    <div class="row">
                        <div class="products-tabs">
                            <!-- tab -->
                            <div id="tab1" class="tab-pane active">
                                <div id="products-slick1" class="products-slick" data-nav="#slick-nav-1">
                                    <c:forEach items="${sessionScope.np}" var="product">
                                        <!-- product -->
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="<c:url value='/imgs${product.productDetails.avatar1}'/>"
                                                     alt="">
                                                <div class="product-label">
                                                    <c:if test="${product.discount != 1}">
                                                    <span class="sale">-<fmt:formatNumber type="number"
                                                                                          value="${(1 - product.discount) * 100}"
                                                                                          pattern="#"/> %</span>
                                                    </c:if>
                                                    <span class="new">NEW</span>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <c:choose>
                                                    <c:when test="${product.categoryId eq '1'}">
                                                        <p class="product-category">Laptops</p>
                                                    </c:when>
                                                    <c:when test="${product.categoryId eq '2'}">
                                                        <p class="product-category">Smartphones</p>
                                                    </c:when>
                                                    <c:when test="${product.categoryId eq '3'}">
                                                        <p class="product-category">Cameras</p>
                                                    </c:when>
                                                    <c:when test="${product.categoryId eq '4'}">
                                                        <p class="product-category">Accessories</p>
                                                    </c:when>
                                                </c:choose>
                                                <h3 class="product-name"><a
                                                        href="<c:url value='/product/toProductDetails.do'><c:param name="pid" value="${product.pid}"/></c:url>">${product.pname}</a>
                                                </h3>
                                                <h4 class="product-price">$<fmt:formatNumber type="number"
                                                                                             value="${product.price * product.discount}"
                                                                                             pattern="#.00"/>
                                                    <del class="product-old-price">$${product.price}</del>
                                                </h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                            class="tooltipp">add to wishlist</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                            class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span
                                                            class="tooltipp">quick view</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn" onclick="addToCast('${product.pid}')"><i
                                                        class="fa fa-shopping-cart"></i> add to cart
                                                </button>
                                            </div>
                                        </div>
                                        <!-- /product -->
                                    </c:forEach>

                                </div>
                                <div id="slick-nav-1" class="products-slick-nav"></div>
                            </div>
                            <!-- /tab -->
                        </div>
                    </div>

                </div>
                <!-- Products tab & slick -->
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="hot-deal">
                    <ul class="hot-deal-countdown">
                        <li>
                            <div>
                                <h3 id="days"></h3>
                                <span>Days</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3 id="hours"></h3>
                                <span>Hours</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3 id="minute"></h3>
                                <span>Mins</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3 id="secends"></h3>
                                <span>Secs</span>
                            </div>
                        </li>
                    </ul>
                    <h2 class="text-uppercase">hot deal this week</h2>
                    <p>New Collection Up to 50% OFF</p>
                    <a class="primary-btn cta-btn" href="#">Shop now</a>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->


<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Top selling</h3>
                    <div class="section-nav">
                        <ul class="section-tab-nav tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab2"
                                                  onclick="refresh(1,'ts');">Laptops</a>
                            </li>
                            <li><a data-toggle="tab" href="#tab2"
                                   onclick="refresh(2,'ts');">Smartphones</a>
                            </li>
                            <li><a data-toggle="tab" href="#tab2"
                                   onclick="refresh(3,'ts');">Cameras</a></li>
                            <li><a data-toggle="tab" href="#tab2"
                                   onclick="refresh(4,'ts');">Accessories</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->
            <div id="topSelling">
                <!-- Products tab & slick -->
                <div class="col-md-12">
                    <div class="row">
                        <div class="products-tabs">
                            <!-- tab -->
                            <div id="tab2" class="tab-pane fade in active">
                                <div id="products-slick2" class="products-slick" data-nav="#slick-nav-2">
                                    <c:forEach items="${sessionScope.ts}" var="orderitem">
                                        <!-- product -->
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="<c:url value='/imgs${orderitem.product.productDetails.avatar1}'/>"
                                                     alt="">
                                                <div class="product-label">
                                                    <c:if test="${orderitem.product.discount != 1}">
                                                        <span class="sale">-${(1 - orderitem.product.discount) * 10}%</span>
                                                    </c:if>
                                                    <span class="new">NEW</span>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <c:choose>
                                                    <c:when test="${orderitem.product.categoryId eq '1'}">
                                                        <p class="product-category">Laptops</p>
                                                    </c:when>
                                                    <c:when test="${orderitem.product.categoryId eq '2'}">
                                                        <p class="product-category">Smartphones</p>
                                                    </c:when>
                                                    <c:when test="${orderitem.product.categoryId eq '3'}">
                                                        <p class="product-category">Cameras</p>
                                                    </c:when>
                                                    <c:when test="${orderitem.product.categoryId eq '4'}">
                                                        <p class="product-category">Accessories</p>
                                                    </c:when>
                                                </c:choose>
                                                <h3 class="product-name"><a
                                                        href="<c:url value='/product/toProductDetails.do'><c:param name="pid" value="${orderitem.product.pid}"/></c:url>">${orderitem.product.pname}</a>
                                                </h3>
                                                <h4 class="product-price">$<fmt:formatNumber type="number"
                                                                                             value="${orderitem.product.price * orderitem.product.discount}"
                                                                                             pattern="#.00"/>
                                                    <del class="product-old-price">$${orderitem.product.price}</del>
                                                </h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                            class="tooltipp">add to wishlist</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                            class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span
                                                            class="tooltipp">quick view</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"
                                                        onclick="addToCast(${orderitem.product.pid})"><i
                                                        class="fa fa-shopping-cart"></i> add to cart
                                                </button>
                                            </div>
                                        </div>
                                        <!-- /product -->
                                    </c:forEach>
                                </div>
                                <div id="slick-nav-2" class="products-slick-nav"></div>
                            </div>
                            <!-- /tab -->
                        </div>
                    </div>
                </div>
                <!-- /Products tab & slick -->
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top selling</h4>
                    <div class="section-nav">
                        <div id="slick-nav-3" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-3">
                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product07.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product08.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product09.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product01.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product02.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product03.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top selling</h4>
                    <div class="section-nav">
                        <div id="slick-nav-4" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-4">
                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product04.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product05.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product06.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product07.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product08.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product09.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top selling</h4>
                    <div class="section-nav">
                        <div id="slick-nav-5" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-5">
                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product01.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product02.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product03.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product04.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product05.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/img/product06.png'/>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00
                                    <del class="product-old-price">$990.00</del>
                                </h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>
                </div>
            </div>

        </div>
        <!-- /row -->
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
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/slick.min.js'/>"></script>
<script src="<c:url value='/js/nouislider.min.js'/>"></script>
<script src="<c:url value='/js/jquery.zoom.min.js'/>"></script>
<script src="<c:url value='/js/main.js'/>"></script>

<script type="text/javascript">

    window.onload = function () {
        <c:set var="np" scope="session" value="${sessionScope.laptops}"/>;
        <c:set var="ts" scope="session" value="${sessionScope.topLaptops}"/>;
        var laptops = "${sessionScope.laptops}";
        if (laptops == null || laptops == "" || laptops == undefined) {
            window.location.href = '<c:url value="/init/toIndex.do"/> ';
        }
    };

</script>


</body>