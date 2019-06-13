<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
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

    <!-- layui-->
    <link type="text/css" rel="stylesheet" href="<c:url value='/layui/css/layui.css'/>"/>

</head>
<body>
<!-- store products -->
<div class="row">
    <c:forEach items="${sessionScope.filterProducts}" var="product" varStatus="vs">
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
                    <h3 class="product-name"><a href="<c:url value='/product/toProductDetails.do'><c:param name="pid" value="${product.pid}"/></c:url>">${product.pname}</a></h3>
                    <h4 class="product-price">$<fmt:formatNumber type="number" value="${product.price * product.discount}" pattern="#.00"/> <del class="product-old-price">$${product.price}</del></h4>
                    <div class="product-rating">
                        <c:forEach begin="1" end="${product.productDetails.rating / 20}">
                            <i class="fa fa-star"></i>
                        </c:forEach>
                    </div>
                </div>
                <div class="add-to-cart">
                    <button class="add-to-cart-btn" onclick="addToCast('${product.pid}')"><i class="fa fa-shopping-cart"></i> add to cart</button>
                </div>
            </div>
        </div>
        <c:if test="${vs.index % 3 eq 2}">
            <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>
        </c:if>
    </c:forEach>
    <!-- /product -->
</div>
</body>
<!-- jQuery Plugins -->
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/slick.min.js'/>"></script>
<script src="<c:url value='/js/nouislider.min.js'/>"></script>
<script src="<c:url value='/js/jquery.zoom.min.js'/>"></script>
<script src="<c:url value='/js/main.js'/>"></script>
<script src="<c:url value='/layui/layui.js'/>"></script>

<script type="text/javascript">

    function addToCast(pid) {
        if(${sessionScope.user eq null}) {
            layui.use('layer', function(){
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
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.msg('Add Successful', {icon: 1});
                    });
                    $("#account").load('<c:url value="/ajax/cart.jsp"/> ');
                }
            })
        }
    }
</script>

</html>
