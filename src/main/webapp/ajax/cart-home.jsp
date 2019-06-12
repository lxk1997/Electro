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

    <link type="text/css" rel="stylesheet" href="<c:url value='/layui/css/layui.css'/> ">

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="<c:url value='/css/font-awesome.min.css'/>"/>

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
    <!-- jQuery Plugins -->
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/slick.min.js'/>"></script>
    <script src="<c:url value='/js/nouislider.min.js'/>"></script>
    <script src="<c:url value='/js/jquery.zoom.min.js'/>"></script>
    <script src="<c:url value='/js/main.js'/>"></script>
    <script src="<c:url value='/layui/layui.js'/>"></script>


    <script type="text/javascript">

        function deleteCartItem(ciid, type) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/cart/deleteCartItem.do"/> ',
                dataType: 'json',
                data: {
                    ciid: ciid
                },
                success: function (data) {
                    if (type != null) {
                        $("#cart").load('<c:url value="/ajax/cart-home.jsp"/> ');
                    } else $("#account").load('<c:url value="/ajax/cart.jsp"/> ');

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

        function addToCast(pid, type) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/cart/addCartItem.do"/> ',
                dataType: 'json',
                data: {
                    pid: pid
                },
                success: function (data) {
                    if (type != null) {
                        $("#cart").load('<c:url value="/ajax/cart-home.jsp"/> ');
                    } else {
                        $("#account").load('<c:url value="/ajax/cart.jsp"/> ');
                    }

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
    </script>
</head>
<body>
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
</body>
</html>