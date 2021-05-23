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
        <div class="container-fluid top-container   ">
            <div class="container">
                <div class="row">
                    <div class="col top-container-left ">

                        <div class="top-container-content">

                            <div class="">
                                <h1 class="pt-2 udlite-heading-md top-container-content-heading">${posts.get(0).get("postname")}</h1>
                            </div>

                            <div class="card-main-content-instructor "> <small style="color: white;"> Created by
                                <a href=" " class="topic-menu-link">Mr.John dam sau</a>
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
                                        <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/User/AddWatchList?id=${posts.get(0).get("id")}" role="button" >
                                            WishList
                                            <i class="fas fa-heart"></i>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/User/DeleteWatchList?id=${posts.get(0).get("id")}" role="button" >
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
                        <img src="${pageContext.request.contextPath}/public/image/${posts.get(0).get("id")}.png">
                </div>
            </div>
        </div>
        </div>

        <div class="container pt-2 ">
            <div class="course-landing-page__topic-menu component-margin">
                <h2 class="udlite-heading-xl">Công thức(Ingredients)</h2>
                <p>${posts.get(0).get("tinydes")}</p>
            </div>
        </div>


        <div class="container pt-2 ">
            <div class="course-landing-page__topic-menu component-margin">
                <h2 class="udlite-heading-xl">Blog</h2>
                <p>${posts.get(0).get("fulldes")}</p>
            </div>

        </div>


        <div class="container ">
            <div class="course-landing-page__topic-menu component-margin">
                <div class="style-instructors">
                    <h2 class="udlite-heading-xl">Instructor</h2>
                    <div class="instructor-wrapper">
                        <span class="in-page-offset-anchor"></span>
                        <div>
                            <div class="udlite-heading-lg instructor-heading">
                                <a href="">Mr.John Dam Sau</a>
                            </div>
                            <div class="instructor-job-title udlite-text-md">Head of Data Science, Pierian Data Inc.</div>
                        </div>
                        <div class="instructor-image">
                            <a href="" class="instructor-image-link">
                                <img src="imgs/john.jpg" class="instructor-image-and-stats udlite-avatar-image udlite-avatar" width="64" height="64" alt="">
                            </a>
                            <ul class="list-unstyled">
                                <li>
                                    <div class="udlite-text-sm udlite-block-list udlite-block-list-item udlite-block-list-item-neutral udlite-block-list-item-tight">
                                        <div class="udlite-block-list-content">
                                        <span class="udlite-block-list-content-text"><i class="fas fa-star udlite-block-list-icon-gold"></i>
                                            4.6 Instructor Rating
                                        </span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="udlite-text-sm udlite-block-list udlite-block-list-item udlite-block-list-item-neutral udlite-block-list-item-tight">
                                        <div class="udlite-block-list-content">
                                        <span class="udlite-block-list-content-text"><i class="fas fa-medal udlite-block-list-icon-gold"></i>
                                            1,699,985 Reviews
                                        </span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="udlite-text-sm udlite-block-list udlite-block-list-item udlite-block-list-item-neutral udlite-block-list-item-tight">
                                        <div class="udlite-block-list-content">
                                        <span class="udlite-block-list-content-text"><i class="fas fa-user-friends udlite-block-list-icon-gold"></i>
                                            12,142,645 Students
                                        </span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="udlite-text-sm udlite-block-list udlite-block-list-item udlite-block-list-item-neutral udlite-block-list-item-tight">
                                        <div class="udlite-block-list-content">
                                        <span class="udlite-block-list-content-text"><i class="fas fa-play-circle udlite-block-list-icon-gold"></i>
                                            20 Blogs
                                        </span>
                                        </div>
                                    </div>
                                </li>

                            </ul>
                        </div>

                        <div class="show-more-container">
                            <span id="" data-type="checkbox" data-checked style="display: none;"></span>

                            <div>
                                <div class="udlite-text-sm instructor-description">
                                    <p> Ông là một đầu bếp tài năng và thành công trên nước Mỹ với các chuỗi nhà hàng nổi tiếng đồng thời ông cũng là giảng viên giảng dạy tại trường dạy nấu ăn nổi tiếng Culinary Institues of America. Ông cũng là đầu bếp Việt
                                        Nam đầu tiên ở Mỹ đoạt danh hiệu đầu bếp xuất sắc nhất New York do New York Times bình chọn và năm 2003. Ông được xem là " Người tạo hương vị" trong làng ẩm thực.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container">
        <div class="mb-2">
            <h2 class="udlite-heading-xl ">Reviews</h2>
        </div>
        <div>
        <div>
            <div class="reviews-section-review-container">
                <div class="individual-review">
                    <div class="individual-review-author-avatar">
                        <div class="udlite-avatar udlite-heading-md" style="width: 4.8rem; height: 4.8rem; background: rgb(40, 150, 169);">SH</div>
                    </div>
                    <div class="individual-review-content">
                        <div class="individual-review-content-name-container">
                            <div class="udlite-heading-sm individual-review-content-name"> Son Heung Min</div>
                        </div>
                        <div class="individual-review-detail">
                                <span class="star-rating-wrapper ">
                                    <i class="fas fa-star star-rating-style star-color"></i>
                                    <i class="fas fa-star star-rating-style star-color"></i>
                                    <i class="fas fa-star star-rating-style star-color"></i>
                                    <i class="fas fa-star star-rating-style star-color"></i>
                                    <i class="fas fa-star star-rating-style star-color"></i>
                                </span>

                            <span class="udlite-text-sm individual-review-detail-time">2 weeks ago</span>
                        </div>
                        <div class="review-show-more-container">
                            <span></span>
                            <div class="review-show-more-content" style="max-height: 100px;">
                                <div>
                                    <div class="udlite-text-sm" style="color: #3c3b37;">
                                        <p>Thay dep trai ma con giang bai hay nua</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="individual-review-feedback">
                            <div>
                                <p class="individual-review-feedback-title"> Was this review helpful?</p>
                                <div class="review-feedback-actions">
                                    <button class="udlite-btn udlite-btn-medium udlite-btn-icon-round udlite-btn-secondary udlite-btn-icon-medium udlite-btn-icon udlite-text-md  review-feedback-actions-thumb-up">
                                        <i class="far fa-thumbs-up" ></i>
                                    </button>

                                    <button class="udlite-btn udlite-btn-medium udlite-btn-icon-round udlite-btn-secondary udlite-btn-icon-medium udlite-btn-icon udlite-text-md  review-feedback-actions-thumb-up">
                                        <i class="far fa-thumbs-down" ></i>
                                    </button>

                                    <button class="udlite-btn-ghost udlite-btn-medium udlite-btn udlite-text-sm">
                                        <span>Report</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
