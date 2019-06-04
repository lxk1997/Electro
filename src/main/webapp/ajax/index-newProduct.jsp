<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<body>
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
                                <img src="<c:url value='/imgs${product.productDetails.avatar1}'/>" alt="">
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
</body>
<script src="<c:url value='/js/main.js'/>"></script>
<script>
    $('#products-slick1').each(function() {
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