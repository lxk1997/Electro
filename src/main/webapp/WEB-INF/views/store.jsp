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

    <title>Electro - Store</title>

    <!-- Google font -->
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
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>

</head>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +86-178-6421-3754</a></li>
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
                                                <a href="<c:url value='/user/toLogin.do'/>" style="width: 100%;">Login
                                                    <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="cart-dropdown">
                                            <div class="cart-list">
                                                <c:forEach items="${cart}" var="cartitem">
                                                    <div class="product-widget">
                                                        <div class="product-img">
                                                            <img src="<c:url value='/imgs${cartitem.product.productDetails.avatar1}'/>"
                                                                 alt="">
                                                        </div>
                                                        <div class="product-body">
                                                            <h3 class="product-name"><a
                                                                    href="<c:url value='/product/toProductDetails.do'><c:param name="pid" value="${cartitem.product.pid}"/></c:url>">${cartitem.product.pname}</a>
                                                            </h3>
                                                            <h4 class="product-price"><span
                                                                    class="qty">${cartitem.count}x</span>$<fmt:formatNumber
                                                                    type="number"
                                                                    value="${cartitem.product.price * cartitem.product.discount}"
                                                                    pattern="#.00"/></h4>
                                                        </div>
                                                        <button class="delete"
                                                                onclick="deleteCartItem('${cartitem.ciid}')"><i
                                                                class="fa fa-close"></i></button>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="cart-summary">
                                                <small>${cartCnt} Item(s) selected</small>
                                                <h5>SUBTOTAL: $<fmt:formatNumber type="number" value="${cartTotal}"
                                                                                 pattern="#.00"/></h5>
                                            </div>
                                            <div class="cart-btns">
                                                <a href="<c:url value='/cart/toCart.do'/>">View Cart</a>
                                                <a href="<c:url value='/checkout/toCheckout.do'/>">Checkout <i
                                                        class="fa fa-arrow-circle-right"></i></a>
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
                <li><a href="<c:url value='/index.jsp'/> ">Home</a></li>
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
                <ul class="breadcrumb-tree">
                    <li><a href="<c:url value='/index.jsp'/>">Home</a></li>
                    <li><a href="<c:url value='/product/toStore.do?categoryId=0'/> ">All Categories</a></li>
                    <li class="active">${category}</li>
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
            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Categories</h3>
                    <div class="checkbox-filter">

                        <div class="input-checkbox">
                            <input type="checkbox" id="category-laptops" checked="checked">
                            <label for="category-laptops">
                                <span></span>
                                Laptops
                                <small>(${laptopCnt})</small>
                            </label>
                        </div>

                        <div class="input-checkbox">
                            <input type="checkbox" id="category-smartphones" checked="checked">
                            <label for="category-smartphones">
                                <span></span>
                                Smartphones
                                <small>(${smartphoneCnt})</small>
                            </label>
                        </div>

                        <div class="input-checkbox">
                            <input type="checkbox" id="category-cameras" checked="checked">
                            <label for="category-cameras">
                                <span></span>
                                Cameras
                                <small>(${cameraCnt})</small>
                            </label>
                        </div>

                        <div class="input-checkbox">
                            <input type="checkbox" id="category-accessories" checked="checked">
                            <label for="category-accessories">
                                <span></span>
                                Accessories
                                <small>(${accessoriesCnt})</small>
                            </label>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Price</h3>
                    <div class="price-filter">
                        <div id="price-slider"></div>
                        <div class="input-number price-min">
                            <input id="price-min" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                        <span>-</span>
                        <div class="input-number price-max">
                            <input id="price-max" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Brand</h3>
                    <div class="checkbox-filter">
                        <div class="input-checkbox">
                            <input type="checkbox" id="brand-samsung" checked="checked">
                            <label for="brand-samsung">
                                <span></span>
                                SAMSUNG
                                <small>(${samsungCnt})</small>
                            </label>
                        </div>
                        <div class="input-checkbox">
                            <input type="checkbox" id="brand-sony" checked="checked">
                            <label for="brand-sony">
                                <span></span>
                                SONY
                                <small>(${sonyCnt})</small>
                            </label>
                        </div>
                        <div class="input-checkbox">
                            <input type="checkbox" id="brand-huawei" checked="checked">
                            <label for="brand-huawei">
                                <span></span>
                                HUAWEI
                                <small>(${huaweiCnt})</small>
                            </label>
                        </div>
                        <div class="input-checkbox">
                            <input type="checkbox" id="brand-mi" checked="checked">
                            <label for="brand-mi">
                                <span></span>
                                MI
                                <small>(${miCnt})</small>
                            </label>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Top selling</h3>
                    <c:forEach items="${sessionScope.ts}" var="item" begin="0" end="2">
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<c:url value='/imgs${item.product.productDetails.avatar1}'/>" alt="">
                            </div>
                            <div class="product-body">
                                <c:choose>
                                    <c:when test="${item.product.categoryId eq '1'}">
                                        <p class="product-category">Laptop</p>
                                    </c:when>
                                    <c:when test="${item.product.categoryId eq '2'}">
                                        <p class="product-category">Smartphone</p>
                                    </c:when>
                                    <c:when test="${item.product.categoryId eq '3'}">
                                        <p class="product-category">Camera</p>
                                    </c:when>
                                    <c:when test="${item.product.categoryId eq '4'}">
                                        <p class="product-category">Accessories</p>
                                    </c:when>
                                </c:choose>
                                <h3 class="product-name"><a
                                        href="<c:url value='/product/toProductDetails.do'><c:param name="pid" value="${item.product.pid}"/></c:url>">${item.product.pname}</a>
                                </h3>
                                <h4 class="product-price">$<fmt:formatNumber type="number"
                                                                             value="${item.product.price * item.product.discount}"
                                                                             pattern="#.00"/>
                                    <del class="product-old-price">$${item.product.price}</del>
                                </h4>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">
                <!-- store top filter -->
                <div class="store-filter clearfix">
                    <div class="store-sort">
                        <label>
                            Sort By:
                            <select class="input-select">
                                <option value="0">Popular</option>
                                <option value="1">Price</option>
                            </select>
                        </label>

                    </div>
                    <ul class="store-grid">
                        <li class="active"><i class="fa fa-th"></i></li>
                    </ul>
                </div>
                <!-- /store top filter -->

                <div id="store-product">
                    <!-- store products -->
                    <div class="row">
                        <c:forEach items="${sessionScope.store}" var="product" varStatus="vs">
                            <!-- product -->
                            <div class="col-md-4 col-xs-6">
                                <div class="product">
                                    <div class="product-img">
                                        <img src="<c:url value='/imgs${product.productDetails.avatar1}'/>" alt="">
                                        <div class="product-label">
                                            <c:if test="${product.discount != 1}">
                                                    <span class="sale">-<fmt:formatNumber type="number"
                                                                                          value="${(1 - product.discount) * 100}"
                                                                                          pattern="#"/> %</span>
                                            </c:if>
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
                                            <c:forEach begin="1" end="${product.productDetails.rating / 20}">
                                                <i class="fa fa-star"></i>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn" onclick="addToCast('${product.pid}')"><i
                                                class="fa fa-shopping-cart"></i> add to cart
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${vs.index % 3 eq 2}">
                                <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>
                            </c:if>
                        </c:forEach>
                        <!-- /product -->
                    </div>
                </div>
                <!-- /store products -->

                <!-- store bottom filter -->
                <div class="store-filter clearfix">
                    <span class="store-qty">Showing 20-100 products</span>
                    <ul class="store-pagination">
                        <li class="active">1</li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>
                <!-- /store bottom filter -->
            </div>
            <!-- /STORE -->
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
            window.location.href = '<c:url value="/cart/addCartInit.do"><c:param name="url" value="/WEB-INF/views/store"/> </c:url>';
        }
    }

    function filterProduct() {
        console.log("load");
        $.ajax({
            type: 'post',
            url: '<c:url value="/product/productFilter.do"/> ',
            dataType: 'json',
            data: {
                category1: $("#category-laptops")[0].checked,
                category2: $("#category-smartphones")[0].checked,
                category3: $("#category-cameras")[0].checked,
                category4: $("#category-accessories")[0].checked,
                brandsony: $("#brand-sony")[0].checked,
                brandsamsung: $("#brand-samsung")[0].checked,
                brandhuawei: $("#brand-huawei")[0].checked,
                brandxiaomi: $("#brand-mi")[0].checked,
                pricemin:$("#price-min").val(),
                pricemax:$("#price-max").val(),
            },
            success: function (data) {
                $("#store-product").load('<c:url value="/ajax/store-product.jsp"/> ');
            }
        })
    }

    $(document).off("change", "#price-min").on("change", "#price-min", function () {
        filterProduct();
    });
    $(document).off("change", "#price-max").on("change", "#price-max", function () {
        filterProduct();
    });
    $(document).off("change", "#brand-samsung").on("change", "#brand-samsung", function () {
        filterProduct();
    });
    $(document).off("change", "#brand-sony").on("change", "#brand-sony", function () {
        filterProduct();
    });
    $(document).off("change", "#brand-huawei").on("change", "#brand-huawei", function () {
        filterProduct();
    });
    $(document).off("change", "#brand-mi").on("change", "#brand-mi", function () {
        filterProduct();
    });
    $(document).off("change", "#category-laptops").on("change", "#category-laptops", function () {
        filterProduct();
    });
    $(document).off("change", "#category-smartphones").on("change", "#category-smartphones", function () {
        filterProduct();
    });
    $(document).off("change", "#category-cameras").on("change", "#category-cameras", function () {
        filterProduct();
    });
    $(document).off("change", "#category-accessories").on("change", "#category-accessories", function () {
        filterProduct();
    });

    function addToCast(pid) {
        if (${sessionScope.user eq null}) {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.msg('Please Login First');
            });
        } else {
            $.ajax({
                type: 'post',
                url: '<c:url value="/cart/addCartItem.do"/> ',
                dataType: 'json',
                data: {
                    pid: pid
                },
                success: function (data) {
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg('Add Successful', {icon: 1});
                    });
                    $("#account").load('<c:url value="/ajax/cart.jsp"/> ');
                }
            })
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
                ciid: ciid,
                is_all: 0
            },
            success: function (data) {
                $("#account").load('<c:url value="/ajax/cart.jsp"/> ');

            }
        })
    }

</script>

</body>
</html>

