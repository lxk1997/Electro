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

    <link rel="stylesheet" type="text/css" href="<c:url value='/css/shortcode.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style1.css'/>">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>

    <script src="<c:url value='/js/jquery.min.js'/>"></script>

</head>
<body>
<h1>MY ORDERS</h1>
<div id="orders">
<!-- Orders -->
<div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
    <!-- Orders-->
    <div class="cart-table">
        <table class="table table-bordered table-responsive">
            <thead>
            <tr>
                <th class="product-thumbnail">Item</th>
                <th class="product-name">Product Name</th>
                <th class="product-name">Quantity</th>
                <th class="product-unit-price">Unit Price</th>
                <th class="product-subtotal">Total</th>
                <th class="product-name">Status</th>
                <th class="product-remove">Remove</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${sessionScope.orders}" var="item">
                <tr class="cart_item">
                    <td data-title="Item" class="product-thumbnail"><a href="#"><img
                            src="<c:url value='/imgs${item.product.productDetails.avatar1}'/> "
                            alt="Product"/></a></td>
                    <td data-title="Product Name"><a
                            href="<c:url value='/product/toProductDetails.do'><c:param name="pid" value="${item.product.pid}"/></c:url>">${item.product.pname}</a>
                    </td>
                    <td data-title="Quantity" >
                        ${item.count}
                    </td>
                    <td data-title="Unit Price" class="product-unit-price">$<fmt:formatNumber
                            type="number"
                            value='${item.product.price * item.product.discount}'
                            pattern="#.00"/></td>
                    <td data-title="Total" class="product-subtotal">$${item.subTotal}</td>
                    <td data-title="Status">
                        <c:choose>
                            <c:when test="${item.status eq '3'}">
                                <a href="javascript:confirmReceipt('${item.oiid}')">Confirm Receipt</a>
                            </c:when>
                            <c:when test="${item.status eq '1'}">
                                Unpaid
                            </c:when>
                            <c:when test="${item.status eq '2'}">
                                Unshipped
                            </c:when>
                            <c:when test="${item.status eq '4'}">
                                Completed
                            </c:when>
                        </c:choose>
                    </td>
                    <td data-title="Remove" class="product-remove">
                        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="deleteOrder('${item.oiid}');">
                            <i class="layui-icon de">DELETE</i>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div><!-- Orders /- -->
</div>

<!-- jQuery Plugins -->

<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/slick.min.js'/>"></script>
<script src="<c:url value='/js/nouislider.min.js'/>"></script>
<script src="<c:url value='/js/jquery.zoom.min.js'/>"></script>
<script src="<c:url value='/js/main.js'/>"></script>

<script type="text/javascript">

    function deleteOrder(oiid) {
        if(confirm("Are you sure you want to delete the order")) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/orderItem/deleteOrder.do"/> ',
                dataType: 'json',
                data: {
                    oiid: oiid
                },
                success: function (data) {
                    alert("Delete success.")
                    $("#orders").load('<c:url value="/ajax/item-order.jsp"/>');
                }
            })
        }
    }

    function confirmReceipt(oiid) {
        $.ajax({
            type: 'post',
            url: '<c:url value="/orderItem/confirmReceipt.do"/> ',
            dataType: 'json',
            data: {
                oiid: oiid
            },
            success: function (data) {
                alert("Confirm success.")
                $("#orders").load('<c:url value="/ajax/item-order.jsp"/> ');
            }
        })
    }

</script>
</body>
</html>

