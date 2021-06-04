<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="nav-bar  ">
    <div class="nav-bar__background">
        <ul aria-label="Primary navigation bar" class="nav-bar__primary-menu xs-flex xs-flex-align-center xs-mx-auto xs-pl2 xs-pr1 sm-pr2 list-unstyled">
            <li class="xs-relative list-unstyled xs-mr1 lg-mr3">
                <a class="nav-item nav-logo" href=""><img src="${pageContext.request.contextPath}/public/imgs/2.png" class="tasty-logo xs-mt1" alt=""></a>
            </li>

            <li class="nav-item list-unstyled"><a aria-label="Home" class="top-level-nav-link nav-item xs-text-4 md-text-2 extra-bold xs-px1 xs-py2 lg-p2 xs-hide md-block" href="${pageContext.request.contextPath}/Home">Home</a></li>
            <li class="nav-item list-unstyled"><a aria-label="About" class="top-level-nav-link nav-item xs-text-4 md-text-2 extra-bold xs-px1 xs-py2 lg-p2 xs-hide md-block" href="${pageContext.request.contextPath}/Home">About</a></li>
            <li class="nav-item list-unstyled"><a aria-label="Contact" class="top-level-nav-link nav-item xs-text-4 md-text-2 extra-bold xs-px1 xs-py2 lg-p2 xs-hide md-block" href="${pageContext.request.contextPath}/Home">Contact</a></li>
            <li class="nav-menu-container xs-inline-block xs-static md-relative xs-px1 xs-py2 lg-p2 xs-text-4 md-text-2 list-unstyled" id="nav-menu-container">


                <button aria-label="" aria-expanded="false" aria-haspopup="true" class="test1 recipe-nav-toggle button--clear nav-item xs-relative md-block extra-bold">
                    Recipes
                </button>
            </li>

            <li class="srch md-col-3 xs-relative list-unstyled">
                <form autocomplete="off" id="search-form" novalidate="" class="i-amphtml-form">
                    <div class="srch-wrap"><button aria-label="Open search bar input" class="button--clear srch-icon-wrapper" type="button"><i class="fas fa-search ml-3"></i></button>
                        <input type="text" aria-label="Search" class="srch-input offset-srch" id="search" name="search" placeholder="Search " tabindex="0" value=""><button aria-label="Clear Search" class="button--clear clear-search offset-srch xs-hide"
                                                                                                                                                                            type="button"><svg class="xs-inline-block"><use xmlns:xlink="" xlink:href="#x"></use></svg></button></div>
                </form>
            </li>
            <c:choose>
                <c:when test="${auth}">

                    <form id="frmLogout" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>

                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/Account/Profile" id="navbarDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            Hi, <b>${authUser.name}</b>!
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:if test="${authUser.office.equals('admin')}">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/Admin/Index">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    Profile
                                </a>
                            </c:if>
                            <c:if test="${authUser.office.equals('user')}">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/User/Index">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    Profile
                                </a>
                            </c:if>

                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="javascript: $('#frmLogout').submit();">
                                <i class="fa fa-sign-out" aria-hidden="true"></i>
                                Logout
                            </a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <li class="pr-2 pl-3">
                        <a href="${pageContext.request.contextPath}/Account/Register">
                            <button type="button" class="btn btn-outline-primary" >Sign up </button>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Account/Login">
                            <button type="button" class="btn btn-outline-secondary">Sign in </button>
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>

    </div>
</nav>