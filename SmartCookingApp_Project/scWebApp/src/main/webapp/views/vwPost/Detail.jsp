<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="categoriesMenu" scope="request" type="java.util.List<beans.Category>"/>

<t:main>
    <jsp:attribute name="css">
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
        <link href="https://cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styledetail.css">
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
        <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    </jsp:attribute>
    <jsp:body>
        <c:choose>
            <c:when test="${posts.enable == true || authUser.office.equals('admin')}">
                <div class="container-fluid top-container   ">
                    <div class="container">
                        <div class="row">
                            <div class="col top-container-left ">

                                <div class="top-container-content">

                                    <div class="">
                                        <h1 class="pt-2 udlite-heading-md top-container-content-heading">${posts.postname}</h1>
                                    </div>

                                    <div class="card-main-content-instructor "> <small style="color: white;"> Created by
                                        <a href=" " class="topic-menu-link">${users.name}</a>
                                    </small>
                                    </div>
                                    <div class="top-menu-lastupdate-desktop">
                                        <div>
                                            <span><i class="fas fa-exclamation-circle"></i></span>
                                            <span class="pr-4">Last updated 1/2021</span>
                                            <span><i class="fas fa-globe"></i></span>
                                            <span>VietNam</span>
                                        </div>

                                    </div>

                                    <div class="pb-5 pt-2">


                                        <c:choose>
                                            <c:when test="${isWatchList == false}">
                                                <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/User/AddWatchList?id=${posts.id}" role="button" >
                                                    WishList
                                                    <i class="fas fa-heart"></i>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/User/DeleteWatchList?id=${posts.id}" role="button" >
                                                    WishList
                                                    <i class="fas fa-heart text-danger"></i>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>


                                        <span>
                                <button type="button" class="btn btn-outline-light">Share
                                    <i class="far fa-share-square pl-2"></i>
                                </button>
                            </span>
                                    </div>
                                </div>

                            </div>
                            <div class="col">
                                <img src="${pageContext.request.contextPath}/public/image/${posts.id}.png">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container pt-2 ">
                    <div class="course-landing-page__topic-menu component-margin">
                        <h2 class="udlite-heading-xl" style="padding: 8px 0px">Công thức(Ingredients)</h2>
                        <p>${posts.getTinyDes()}</p>
                    </div>
                </div>


                <div class="container pt-2 ">
                    <div class="course-landing-page__topic-menu component-margin">
                        <h2 class="udlite-heading-xl">Blog</h2>
                        <p>${posts.getFullDes()}</p>
                    </div>

                </div>

                <div class="container-fluid pt-4">
                    <div class="kj-component ">
                        <div class="udlite-heading-lg kj-notice ">
                            <span>Top companies choose <a href=" " class=" ">Brand</a>
                            to build ......</span>
                        </div>
                        <div class="kj-partne r-logo ">
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
            </c:when>
            <c:otherwise>
                <h4 style="color: cornflowerblue"> Trang này chưa được kiểm duyệt</h4>
            </c:otherwise>
        </c:choose>

    </jsp:body>
</t:main>
