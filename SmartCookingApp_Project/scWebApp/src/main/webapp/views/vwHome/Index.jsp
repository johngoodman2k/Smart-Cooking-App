<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:body>
    <div class="container-fluid">
        <div class="thumbnail" style="background-color: red">
            <img style="width: 100%;height: 100%" src="${pageContext.request.contextPath}/public/imgs/hinhnen.jpg" alt="">
            <div class="picthumbnail" style="position: absolute">
                <div class="row">
                    <div class="col-sm-6" style="padding: 8px 8px">
                        <div style="width: auto; height: auto;text-align: center"><img style="height: 400px;width: auto" src="${pageContext.request.contextPath}/public/imgs/hinhnen2.png" alt=""></div>
                    </div>
                    <div class="col-sm-6" style="padding: 8px 8px;text-align: center">
                        <div class="shadowd-i">
                            <div id="demo" class="carousel slide" data-ride="carousel" style="border: 1px solid #fad390">
                                <ul class="carousel-indicators">
                                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                                    <li data-target="#demo" data-slide-to="1"></li>
                                    <li data-target="#demo" data-slide-to="2"></li>

                                </ul>
                                <div class="carousel-inner">
                                    <a class="carousel-item active" href="${pageContext.request.contextPath}/Post/Detail?id=22">
                                        <img src="${pageContext.request.contextPath}/public/image/22.png" alt="" width="1100" height="500">
                                        <div class="carousel-caption">
                                            <h3>${posts.get(0).getPostname()}</h3>
                                            <p style="color: black">See more!</p>
                                        </div>
                                    </a>
                                    <c:forEach items="${posts}" var="c" begin="1" end="2">
                                        <c:choose>
                                            <c:when test="${c.enable == true}">
                                                <a class="carousel-item" href="${pageContext.request.contextPath}/Post/Detail?id=${c.id}">
                                                    <img src="${pageContext.request.contextPath}/public/image/${c.id}.png" alt="" width="1100" height="500">
                                                    <div class="carousel-caption">
                                                        <h3>${c.postname}</h3>
                                                        <p style="color: black">See more!</p>
                                                    </div>
                                                </a>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>


                                </div>
                                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </a>
                                <a class="carousel-control-next" href="#demo" data-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

        </div>
    </div>

    <div class="container">
        <div class="container">
            <div class="  foodcategory">
                <div class="foodcategorytext">Recent Recipes</div>
            </div>
        </div>

        <div class="feed__items ">
            <c:forEach items="${posts}" var="c" begin="0" end="7">
                <c:choose>
                    <c:when test="${c.enable == true}">
                        <a class="trending-item" href="${pageContext.request.contextPath}/Post/Detail?id=${c.id}">
                            <div class="trending-item-wrapper">
                                <div class="trending-item-image">
                                    <img src="${pageContext.request.contextPath}/public/image/${c.id}.png" style="width: 255px; height: 255px;" alt="">
                                </div>
                                <div class="feed-item__title">${c.postname}</div>
                            </div>
                        </a>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
    </div>


    <div class="d-flex justify-content-center pt-4" style="margin: 30px 0px">
        <a href="${pageContext.request.contextPath}/Post/ByCat?id=7"><button type="button" class="btn btn-outline-primary show-more-btn">Show more</button></a>
    </div>


    <div class="container-fluid pt-4">
        <div class="kj-component ">
            <div class="udlite-heading-lg kj-notice ">
                    <span>Top companies choose <a href=" " class=" ">Brand</a>
                        to build ......</span>
            </div>
            <div class="kj-partner-logo ">
                <img width="80 " height="80 " class="ml-2 " src="${pageContext.request.contextPath}/public/imgs/now.jpg " alt=" ">
                <img width="80 " height="80 " class="ml-2 " src="${pageContext.request.contextPath}/public/imgs/baemin.jpg " alt=" ">
                <img width="80 " height="80 " class="ml-2 " src="${pageContext.request.contextPath}/public/imgs/facebook.jpg " alt=" ">
                <img width="80 " height="80 " class="ml-2 " src="${pageContext.request.contextPath}/public/imgs/grab.png " alt=" ">
                <img width="80 " height="80 " class="ml-2 " src="${pageContext.request.contextPath}/public/imgs/foody.png " alt=" ">
            </div>
        </div>
    </div>




    <div class="container px-2 text-center footer ">
        <div>
            <div class="row ">
                <div class="col ">
                    <i class="fas fa-school "></i>
                    <small class="d-block mb-3 text-muted ">© 2020 Brand, Inc.</small>
                </div>
                <div class="col ">
                    <h5 class="text-left ">
                        Features
                    </h5>
                    <ul class="list-unstyled text-left text-muted ">
                        <li><a href=" ">.... for Business</a></li>
                        <li><a href=" ">Brand....</a></li>
                        <li>
                            <a href=" ">Get the app</a></li>
                        <li>
                            <a href=" ">About us</a></li>
                        <li>
                            <a href=" ">Contact us</a></li>
                    </ul>
                </div>
                <div class="col ">
                    <h5 class="text-left ">
                        Resources
                    </h5>
                    <ul class="list-unstyled text-left text-muted ">
                        <li><a href=" ">Careers</a></li>
                        <li><a href=" ">Blog</a></li>
                        <li><a href=" ">Help and Support</a></li>
                        <li><a href=" ">Affiliate</a></li>

                    </ul>
                </div>
                <div class="col ">
                    <h5 class="text-left ">
                        About
                    </h5>
                    <ul class="list-unstyled text-left text-muted ">
                        <li><a href=" ">Terms</a></li>
                        <li><a href=" ">Privacy policy and cookie policy</a></li>
                        <li><a href=" ">Sitemap</a></li>
                        <li><a href=" ">Featured courses</a></li>

                    </ul>
                </div>

                <div class="col ">
                    <h5 class="text-center ">Choose your language</h5>
                    <div class="lang-menu ">

                        <div class="selected-lang ">
                            English
                        </div>
                        <ul>
                            <li>
                                <a href="# " class="de ">German</a>
                            </li>
                            <li>
                                <a href=" " class="en ">English</a>
                            </li>
                            <li>
                                <a href=" " class="fr ">French</a>
                            </li>
                            <li>
                                <a href=" " class="ar ">Arabic</a>
                            </li>
                        </ul>

                    </div>

                </div>
            </div>
        </div>
    </div>

    </jsp:body>
</t:main>