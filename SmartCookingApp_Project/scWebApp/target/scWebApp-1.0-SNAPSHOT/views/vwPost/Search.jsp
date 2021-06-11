
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="categoriesMenu" scope="request" type="java.util.List<beans.Category>"/>
<%--<jsp:useBean id="posts" scope="request" type="java.util.List<beans.Post>"></jsp:useBean>--%>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/categories.css">
    </jsp:attribute>
    <jsp:body>

      <div class="container-fluid mt-3">
        <div class="row">
          <div class="col-sm-3">
            <div class="card mb-3">
              <div class="card-header">
                <h4>Categories</h4>
              </div>
              <div class="list-group list-group-flush"  >
                <c:forEach var="c" items="${categoriesMenu}" begin="5">
                  <a href="${pageContext.request.contextPath}/Post/ByCat?id=${c.id}" class="list-group-item list-group-item-action">
                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                      ${c.name}
                  </a>
                </c:forEach>
              </div>
            </div>



          </div>
          <div class="col-sm-9">
            <div class="card-body">
              <c:choose>
                <c:when test="${posts.size() == 0}">
                  <div class="card-body">
                    <p class="card-text">Không có dữ liệu.</p>
                  </div>
                </c:when>

                <c:otherwise>
                  <div class="categories-items-wrapper">
                    <c:forEach var="c" items="${posts}">
                      <c:if test="${c.enable.equals('true')}">
                        <div class="course-list-container">
                          <a href="#">
                            <div style="display: flex;justify-content: flex-start">
                              <div>
                                <img src="${pageContext.request.contextPath}/public/image/${c.id}.png" width="260" height="145" alt="">
                              </div>
                              <div style="margin: 0px 30px">
                                <div class="course-card-title udlite-heading-sm" >${c.postname}</div>
                                <div class="udlite-text-xs course-card-row course-card-meta-info">
                                  <span class="course-card-row">Last updated: ${c.updateDate}</span>
                                </div>

                                <div>
                                  <a class="btn btn-sm btn-outline-primary" style="margin: 20px 0px" href="${pageContext.request.contextPath}/Post/Detail?id=${c.id}" role="button">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                    Xem ngay
                                  </a>
                                </div>
                              </div>
                            </div>
                          </a>
                        </div>
                      </c:if>
                    </c:forEach>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>

      </div>

  </jsp:body>
</t:main>