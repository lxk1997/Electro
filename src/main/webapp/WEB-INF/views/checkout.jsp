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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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

                <<div id="account">
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
                <h3 class="breadcrumb-header">Checkout</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Home</a></li>
                    <li class="active">Checkout</li>
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

            <div class="col-md-7">
                <!-- Billing Details -->
                <div class="billing-details">
                    <div class="section-title">
                        <h3 class="title">Billing address</h3>
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="first-name" placeholder="First Name">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="last-name" placeholder="Last Name">
                    </div>
                    <div class="form-group">
                        <input class="input" type="email" name="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="address" placeholder="Address">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="city" placeholder="City">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="country" placeholder="Country">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="zip-code" placeholder="ZIP Code">
                    </div>
                    <div class="form-group">
                        <input class="input" type="tel" name="tel" placeholder="Telephone">
                    </div>
                    <div class="form-group">
                        <div class="input-checkbox">
                            <input type="checkbox" id="create-account">
                            <label for="create-account">
                                <span></span>
                                Create Account?
                            </label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
                                <input class="input" type="password" name="password" placeholder="Enter Your Password">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Billing Details -->

                <!-- Shiping Details -->
                <div class="shiping-details">
                    <div class="section-title">
                        <h3 class="title">Shiping address</h3>
                    </div>
                    <div class="input-checkbox">
                        <input type="checkbox" id="shiping-address">
                        <label for="shiping-address">
                            <span></span>
                            Ship to a diffrent address?
                        </label>
                        <div class="caption">
                            <div class="form-group">
                                <input class="input" type="text" name="first-name2" placeholder="First Name">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="last-name2" placeholder="Last Name">
                            </div>
                            <div class="form-group">
                                <input class="input" type="email" name="email2" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="address2" placeholder="Address">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="city2" placeholder="City">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="country2" placeholder="Country">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="zip-code2" placeholder="ZIP Code">
                            </div>
                            <div class="form-group">
                                <input class="input" type="tel" name="tel2" placeholder="Telephone">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Shiping Details -->

                <!-- Order notes -->
                <div class="order-notes">
                    <textarea class="input" placeholder="Order Notes" name="notes"></textarea>
                </div>
                <!-- /Order notes -->
            </div>

            <!-- Order Details -->
            <div class="col-md-5 order-details">
                <div class="section-title text-center">
                    <h3 class="title">Your Order</h3>
                </div>
                <div class="order-summary">
                    <div class="order-col">
                        <div><strong>PRODUCT</strong></div>
                        <div><strong>TOTAL</strong></div>
                    </div>
                    <div class="order-products">
                        <c:forEach items="${sessionScope.cart}" var="cartitem">
                            <div class="order-col">
                                <div>${cartitem.count}x ${cartitem.product.pname}</div>
                                <div>$<fmt:formatNumber type="number" value="${cartitem.subTotal}" pattern="#.00"/> </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="order-col">
                        <div>Shiping</div>
                        <div><strong>FREE</strong></div>
                    </div>
                    <div class="order-col">
                        <div><strong>TOTAL</strong></div>
                        <div><strong class="order-total">$<fmt:formatNumber type="number" value="${cartTotal}" pattern="#.00"/></strong></div>
                    </div>
                </div>
                <div class="payment-method">
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-1">
                        <label for="payment-1">
                            <span></span>
                            Direct Bank Transfer
                        </label>
                        <div class="caption">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-2">
                        <label for="payment-2">
                            <span></span>
                            Cheque Payment
                        </label>
                        <div class="caption">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-3">
                        <label for="payment-3">
                            <span></span>
                            Paypal System
                        </label>
                        <div class="caption">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                </div>
                <div class="input-checkbox">
                    <input type="checkbox" id="terms">
                    <label for="terms">
                        <span></span>
                        I've read and accept the <a href="#">terms & conditions</a>
                    </label>
                </div>
                <a href="javascript:placeOrder();" class="primary-btn order-submit">Place order</a>
                <span style="color: red;margin-left: 3px;" name="errorstatus"></span>
            </div>
            <!-- /Order Details -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                    <form>
                        <input class="input" type="email" placeholder="Enter Your Email">
                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                    </form>
                    <ul class="newsletter-follow">
                        <li>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /NEWSLETTER -->

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
            window.location.href = '<c:url value="/cart/addCartInit.do"><c:param name="url" value="/WEB-INF/views/checkout"/> </c:url>';
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

    function placeOrder() {
        if(!$("#terms").get(0).checked) {
            $("span[name='errorstatus']").text("Please Confirm You Have Read The Terms First!");
        } else {
            var firstname = $("input[name='first-name']").val();
            var lastname = $("input[name='last-name']").val();
            var email = $("input[name='email']").val();
            var address = $("input[name='address']").val();
            var city = $("input[name='city']").val();
            var country = $("input[name='country']").val();
            var zipcode = $("input[name='zip-code']").val();
            var telphone = $("input[name='tel']").val();
            var notes = $("textarea[name='notes']").val();
            alert(firstname + " " + lastname + " " + email + " " + address + " " + city + " " + country + " " + zipcode + " " + telphone);
            var addresstype = null;
            if(!$("#shiping-address").get(0).checked) {
                alert("aaa");
                if(firstname == "") {
                    $("span[name='errorstatus']").text("Null First Name!");
                } else if(lastname == "") {
                    $("span[name='errorstatus']").text("Null Last Name!");
                } else if(email == "") {
                    $("span[name='errorstatus']").text("Null Email!");
                } else if(address == "") {
                    $("span[name='errorstatus']").text("Null Address!");
                } else if(city == "") {
                    $("span[name='errorstatus']").text("Null City!");
                } else if(country == "") {
                    $("span[name='errorstatus']").text("Null Country!");
                } else if(zipcode == "") {
                    $("span[name='errorstatus']").text("Null Zipcode!");
                } else if(telphone == "") {
                    $("span[name='errorstatus']").text("Null Telphone!");
                } else {
                    addresstype = "old";
                }

            } else {
                firstname = $("input[name='first-name2']").val();
                lastname = $("input[name='last-name2']").val();
                email = $("input[name='email2']").val();
                address = $("input[name='address2']").val();
                city = $("input[name='city2']").val();
                country = $("input[name='country2']").val();
                zipcode = $("input[name='zip-code2']").val();
                telphone = $("input[name='tel2']").val();
                notes = $("textarea[name='notes']").val();
                if(firstname == "") {
                    $("span[name='errorstatus']").text("Null First Name!");
                } else if(lastname == "") {
                    $("span[name='errorstatus']").text("Null Last Name!");
                } else if(email == "") {
                    $("span[name='errorstatus']").text("Null Email!");
                } else if(address == "") {
                    $("span[name='errorstatus']").text("Null Address!");
                } else if(city == "") {
                    $("span[name='errorstatus']").text("Null City!");
                } else if(country == "") {
                    $("span[name='errorstatus']").text("Null Country!");
                } else if(zipcode == "") {
                    $("span[name='errorstatus']").text("Null Zipcode!");
                } else if(telphone == "") {
                    $("span[name='errorstatus']").text("Null Telphone!");
                } else {
                    addresstype = "new";
                }
            }

            if(addresstype != null) {
                $.ajax({
                    type: 'post',
                    url: '<c:url value="/orderItem/placeOrder.do"/> ',
                    dataType: 'text',
                    data: {
                        firstname: firstname,
                        lastname: lastname,
                        email: email,
                        address: address,
                        city: city,
                        country: country,
                        zipcode: zipcode,
                        telphone: telphone,
                        notes : notes,
                        addressType: addresstype
                    },
                    success: function (data) {
                        if(data != "SUCCESS") {
                            $("span[name='errorstatus']").text(data);
                        } else {
                            window.location.href = '<c:url value="/index.jsp"/> ';
                        }
                    }
                });
            }
        }

    }
</script>

</body>
</html>

