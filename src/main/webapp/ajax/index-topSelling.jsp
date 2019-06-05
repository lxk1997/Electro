<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<body>

<div class="col-md-12">
    <div class="row">
        <div class="products-tabs">
            <!-- tab -->
            <div id="tab2" class="tab-pane active">
                <div id="products-slick2" class="products-slick" data-nav="#slick-nav-2">
                    <c:forEach items="${sessionScope.ts}" var="orderitem">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img">
                                <img src="<c:url value='/imgs${orderitem.product.productDetails.avatar1}'/>"
                                     alt="">
                                <div class="product-label">
                                    <c:if test="${orderitem.product.discount != 1}">
                                        <span class="sale">-<fmt:formatNumber type="number" value="${(1 - orderitem.product.discount) * 100}" pattern="#"/> %</span>
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
                                    <c:forEach begin="1" end="${orderitem.product.productDetails.rating / 20}">
                                        <i class="fa fa-star"></i>
                                    </c:forEach>
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
                                        onclick="addToCast('${orderitem.product.pid}')"><i
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

</body>
<script src="<c:url value='/js/main.js'/>"></script>
<script>
    $('#products-slick2').each(function() {
        var $this = $(this),
            $nav = $this.attr('data-nav');

        $this.slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            autoplay: true,
            infinite: true,
            speed: 300,
            dots: false,
            arrows: true,
            appendArrows: $nav ? $nav : false,
            responsive: [{
                breakpoint: 991,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                }
            },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                },
            ]
        });
    });
</script>
</html>