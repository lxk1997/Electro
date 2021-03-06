<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro - Product Details</title>

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
                    <li><a href="<c:url value='/index.jsp'/> ">Home</a></li>
                    <li><a href="<c:url value='/product/toStore.do?categoryId=0'/> ">All Categories</a></li>
                    <c:choose>
                        <c:when test="${productDetails.categoryId eq '1'}">
                            <li><a href="<c:url value='/product/toStore.do?categoryId=1'/>">Laptops</a></li>
                        </c:when>
                        <c:when test="${productDetails.categoryId eq '2'}">
                            <li><a href="<c:url value='/product/toStore.do?categoryId=2'/>">Smartphones</a></li>
                        </c:when>
                        <c:when test="${productDetails.categoryId eq '3'}">
                            <li><a href="<c:url value='/product/toStore.do?categoryId=3'/>">Cameras</a></li>
                        </c:when>
                        <c:when test="${productDetails.categoryId eq '4'}">
                            <li><a href="<c:url value='/product/toStore.do?categoryId=4'/>">Accessories</a></li>
                        </c:when>
                    </c:choose>
                    <li class="active">${productDetails.pname}</li>
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
            <!-- Product main img -->
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <div class="product-preview">
                        <img src="<c:url value='/imgs${productDetails.productDetails.avatar1}'/>" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="<c:url value='/imgs${productDetails.productDetails.avatar2}'/>" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="<c:url value='/imgs${productDetails.productDetails.avatar3}'/>" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="<c:url value='/imgs${productDetails.productDetails.avatar4}'/>" alt="">
                    </div>
                </div>
            </div>
            <!-- /Product main img -->

            <!-- Product thumb imgs -->
            <div class="col-md-2 col-md-pull-5">
                <div id="product-imgs">
                    <div class="product-preview">
                        <img src="<c:url value='/imgs${productDetails.productDetails.avatar1}'/>" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="<c:url value='/imgs${productDetails.productDetails.avatar2}'/>" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="<c:url value='/imgs${productDetails.productDetails.avatar3}'/>" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="<c:url value='/imgs${productDetails.productDetails.avatar4}'/>" alt="">
                    </div>
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->
            <div class="col-md-5">
                <div class="product-details">
                    <h2 class="product-name">${productDetails.pname}</h2>
                    <div>
                        <div class="product-rating">
                            <c:forEach begin="1" end="${productDetails.productDetails.rating / 20}">
                                <i class="fa fa-star"></i>
                            </c:forEach>
                        </div>
                        <a class="review-link" href="#reviews">${fn:length(productReviews)} Review(s) | Add your
                            review</a>
                    </div>
                    <div>
                        <h3 class="product-price">$<fmt:formatNumber type="number"
                                                                     value="${productDetails.price * productDetails.discount}"
                                                                     pattern="#.00"/>
                            <del class="product-old-price">$${productDetails.price}</del>
                        </h3>
                        <c:choose>
                            <c:when test="${productDetails.stock > 0}">
                                <span class="product-available">In Stock</span>
                            </c:when>
                            <c:otherwise>
                                <span class="product-available">Tight stock</span>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <p>${productDetails.productDetails.description}</p>

                    <div class="add-to-cart">
                        <div class="qty-label">
                            Qty
                            <div class="input-number">
                                <input type="number" value="1" id="qty">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </div>
                        <button class="add-to-cart-btn" onclick="addToCast('${productDetails.pid}')"><i
                                class="fa fa-shopping-cart"></i> add to cart
                        </button>
                    </div>

                    <ul class="product-links">
                        <li>Category:</li>
                        <c:choose>
                            <c:when test="${productDetails.categoryId eq '1'}">
                                <li><a href="#">Laptops</a></li>
                            </c:when>
                            <c:when test="${productDetails.categoryId eq '2'}">
                                <li><a href="#">Smartphones</a></li>
                            </c:when>
                            <c:when test="${productDetails.categoryId eq '3'}">
                                <li><a href="#">Cameras</a></li>
                            </c:when>
                            <c:when test="${productDetails.categoryId eq '4'}">
                                <li><a href="#">Accessories</a></li>
                            </c:when>
                        </c:choose>
                    </ul>

                    <ul class="product-links">
                        <li>Share:</li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                    </ul>

                </div>
            </div>
            <!-- /Product details -->

            <!-- Product tab -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                        <li><a data-toggle="tab" href="#tab2">Details</a></li>
                        <li><a data-toggle="tab" href="#tab3">Reviews (${fn:length(productReviews)})</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">
                        <!-- tab1 -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>${productDetails.productDetails.description}</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab1 -->

                        <!-- tab2 -->
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>
                                    <p>${productDetails.productDetails.details}</p></p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab2 -->

                        <!-- tab3 -->
                        <div id="tab3" class="tab-pane fade in">
                            <div class="row">
                                <!-- Rating -->
                                <div class="col-md-3">
                                    <div id="rating">
                                        <div class="rating-avg">
                                            <span><fmt:formatNumber type="number"
                                                                    value="${productDetails.productDetails.rating / 20}"
                                                                    pattern="#"/> </span>
                                            <div class="rating-stars">
                                                <c:forEach begin="1" end="${productDetails.productDetails.rating / 20}">
                                                    <i class="fa fa-star"></i>
                                                </c:forEach>
                                                <c:forEach begin="${productDetails.productDetails.rating / 20}" end="4">
                                                    <i class="fa fa-star-o"></i>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <ul class="rating">
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: ${star5Cnt / fn:length(productReviews)}%;"></div>
                                                </div>
                                                <span class="sum">${star5Cnt}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: ${star4Cnt / fn:length(productReviews)}%;"></div>
                                                </div>
                                                <span class="sum">${star4Cnt}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: ${star3Cnt / fn:length(productReviews)}%;"></div>
                                                </div>
                                                <span class="sum">${star3Cnt}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: ${star2Cnt / fn:length(productReviews)}%;"></div>
                                                </div>
                                                <span class="sum">${star2Cnt}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: ${star1Cnt / fn:length(productReviews)}%;"></div>
                                                </div>
                                                <span class="sum">${star1Cnt}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Rating -->

                                <!-- Reviews -->
                                <div class="col-md-6">
                                    <div id="reviews">
                                        <ul class="reviews">
                                            <c:forEach items="${productReviews}" var="review">
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">${review.name}</h5>
                                                        <p class="date">${review.date.toString()}</p>
                                                        <div class="review-rating">
                                                            <c:forEach begin="1" end="${review.rating / 20}">
                                                                <i class="fa fa-star"></i>
                                                            </c:forEach>
                                                            <c:forEach begin="${review.rating / 20}" end="4">
                                                                <i class="fa fa-star-o empty"></i>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>${review.context}</p>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <ul class="reviews-pagination">
                                            <li class="active">1</li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Reviews -->

                                <!-- Review Form -->
                                <div class="col-md-3">
                                    <div id="review-form">
                                        <form class="review-form" action="<c:url value='/productReviews/addReviews.do'/>">
                                            <input class="input" type="text" placeholder="Your Name" id="name">
                                            <input class="input" type="email" placeholder="Your Email" id="email">
                                            <input class="hidden" id="pid" value="${productDetails.pid}">
                                            <textarea class="input" placeholder="Your Review" id="review" name="context"></textarea>
                                            <div class="input-rating">
                                                <span>Your Rating: </span>
                                                <div class="stars">
                                                    <input id="star5" name="rating" value="5" type="radio"><label
                                                        for="star5"></label>
                                                    <input id="star4" name="rating" value="4" type="radio"><label
                                                        for="star4"></label>
                                                    <input id="star3" name="rating" value="3" type="radio"><label
                                                        for="star3"></label>
                                                    <input id="star2" name="rating" value="2" type="radio"><label
                                                        for="star2"></label>
                                                    <input id="star1" name="rating" value="1" type="radio"><label
                                                        for="star1"></label>
                                                </div>
                                            </div>
                                            <input class="primary-btn" type="button" onclick="addReviews()">Submit</input>
                                        </form>
                                    </div>
                                </div>
                                <!-- /Review Form -->
                            </div>
                        </div>
                        <!-- /tab3 -->
                    </div>
                    <!-- /product tab content -->
                </div>
            </div>
            <!-- /product tab -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Related Products</h3>
                </div>
            </div>

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="<c:url value='/img/product01.png'/>" alt="">
                        <div class="product-label">
                            <span class="sale">-30%</span>
                        </div>
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00
                            <del class="product-old-price">$990.00</del>
                        </h4>
                        <div class="product-rating">
                        </div>
                        <div class="product-btns">
                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span>
                            </button>
                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span>
                            </button>
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span>
                            </button>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="<c:url value='/img/product02.png'/>" alt="">
                        <div class="product-label">
                            <span class="new">NEW</span>
                        </div>
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00
                            <del class="product-old-price">$990.00</del>
                        </h4>
                        <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-btns">
                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span>
                            </button>
                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span>
                            </button>
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span>
                            </button>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <div class="clearfix visible-sm visible-xs"></div>

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="<c:url value='/img/product03.png'/>" alt="">
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00
                            <del class="product-old-price">$990.00</del>
                        </h4>
                        <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <div class="product-btns">
                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span>
                            </button>
                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span>
                            </button>
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span>
                            </button>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="<c:url value='/img/product04.png'/>" alt="">
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00
                            <del class="product-old-price">$990.00</del>
                        </h4>
                        <div class="product-rating">
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->


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
            window.location.href = '<c:url value="/cart/addCartInit.do"><c:param name="url" value="/WEB-INF/views/product"/> </c:url>';
        }
    }

    function addReviews() {
        if(${sessionScope.user eq null}) {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.msg("Please Login First!!!");
            });
            return;
        }
        var name = $("#name").val();
        var email = $("#email").val();
        var context = $("#review").html();
        var pid = $("#pid").val();
        var rating = $("input[name='rating']:checked").val() * 20;

        $.ajax({
            type: 'post',
            url: '<c:url value="/productReviews/addReviews.do"/> ',
            dataType: 'json',
            data: {
                name: name,
                email: email,
                context: context,
                pid: pid,
                rating: rating
            },
            success: function (data) {
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.msg('Add Successful!', {icon: 1});
                });
                $.reload();
            }
        })
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

    {
        if (${sessionScope.user != null} &&
        ${sessionScope.haveCart == null})
        {
            window.location.href = '<c:url value="/cart/addCartInit.do"><c:param name="url" value="/index"/> </c:url>';
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

    function addToCast(pid) {
        if (${sessionScope.user eq null}) {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.msg('Pleasr Login First!');
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
                    $("#account").load('<c:url value="/ajax/cart.jsp"/> ');

                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.msg('添加成功', {
                            icon: 1,
                            time: 1000
                        });
                    });
                }
            })
        }
    }
</script>

</body>
</html>

