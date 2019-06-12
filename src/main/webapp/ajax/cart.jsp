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

    <title>Electro - HTML Ecommerce Template</title>

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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- ACCOUNT -->
<div class="col-md-3 clearfix">
    <div class="header-ctn">
        <!-- Cart -->
        <div class="dropdown open">
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
</body>
</html>