<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="categoriesMenu" scope="request" type="java.util.List<beans.Category>"/>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styleprofile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">

    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/public/js/checkInput.js"></script>
        <script src="${pageContext.request.contextPath}/public/js/Admin.js"></script>
        <script src="${pageContext.request.contextPath}/public/js/user.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

    <script>
        $('#modalFullName').on("submit",function (e){
            e.preventDefault();
            if(checkFullName('#newName')){
                $('#modalFullName').off('submit').submit();
            }
        })
        $('#modalChangePass').on("submit",function (e){
            e.preventDefault();
            if(!checkPassword('#newPassword',passwordSecurityPoint('#newPassword'))){
                return;
            }
            $.getJSON('${pageContext.request.contextPath}/Account/IsEqualAuthUserPassword?password='+$('#oldPassword').val(),function (re)
            { if(re === true ) $('#modalChangePass').off('submit').submit();
            else{
                alert('not equal old password');
            }
            })
        })
        $('#modalEmail').on("submit",function (e){
            e.preventDefault();
            if(!checkEmail('#newEmail'))
            {
                alert('invalid email');
                return;
            }
            $.getJSON('${pageContext.request.contextPath}/Account/IsExistEmail?email='+$('#newEmail').val(),function (re)
            { if(re === false) $('#modalEmail').off('submit').submit();
            else{
                alert('Email already exist');
            }
            })
        })
        $('#newDOB').datetimepicker({
            format: 'd/m/Y',
            timepicker: false,
            mask: true,
        });

        var modalEditCat = document.getElementById("modalEditCat");
        var modalDeleteCat = document.getElementById("modalDeleteCat");
        var modalDisablePost = document.getElementById("modalDisablePost");
        var modalEnablePost = document.getElementById("modalEnablePost");
        var modalDeletePost = document.getElementById("modalDeletePost");
        var modalDeleteUser = document.getElementById("modalDeleteUser");
        var modalDisableUser = document.getElementById("modalDisableUser");
        var modalEnableUser = document.getElementById("modalEnableUser");

        window.onclick = function(event) {
            if (event.target == modalFullName) {
                modalFullName.style.display = "none";
            }
            else if(event.target == modalChangePass){
                modalChangePass.style.display = "none";
            }
            else if(event.target == modalChangeEmail){
                modalChangeEmail.style.display = "none";
            }
            else if(event.target == modalChangeDOB){
                modalChangeDOB.style.display = "none";
            }
            else if(event.target == modalDeletePost){
                modalDeletePost.style.display = "none";
            }
            else if(event.target == modalChangePostName){
                modalChangePostName.style.display = "none";
            }
            else if(event.target == modalChangeTinyDes){
                modalChangeTinyDes.style.display = "none";
            }
            else if(event.target == modalChangeFullDes){
                modalChangeFullDes.style.display = "none";
            }
            else if(event.target == modalChangeCategory){
                modalChangeCategory.style.display = "none";
            }
            else if(event.target == modalChangeImage){
                modalChangeImage.style.display = "none";
            }
            else if (event.target == modalEditCat) {
                modalEditCat.style.display = "none";
            }
            else if (event.target == modalDeleteCat) {
                modalDeleteCat.style.display = "none";
            }
            else if (event.target == modalDisablePost) {
                modalDisablePost.style.display = "none";
            }
            else if (event.target == modalEnablePost) {
                modalEnablePost.style.display = "none";
            }
            else if (event.target == modalDeletePost) {
                modalDeletePost.style.display = "none";
            }
            else if (event.target == modalDeleteUser) {
                modalDeleteUser.style.display = "none";
            }
            else if (event.target == modalDisableUser) {
                modalDisableUser.style.display = "none";
            }
            else if (event.target == modalEnableUser) {
                modalEnableUser.style.display = "none";
            }
        }

    </script>

    </jsp:attribute>
    <jsp:body>
        <div class="container">
            <img src="${pageContext.request.contextPath}/public/imgs/imgProfile1.png" class="d-block" height="100%" width="100%" alt="">
            <div class="fullname_vitri">
                <div userID="${authUser.id}" class="fullname_p">
                    <span style="color:white;font-size:105%;font-weight: bold">Full Name</span>
                    <input class="mx-2 px-2 border-0 " value="${authUser.name}" readonly type="text"
                           style="width:200px;color:#ff7675;border-radius: 50px;font-weight: bold">
                    <button class="btn" type="button" id="btnChangeName">
                        <i class="fas fa-pen" style="color:white"></i>
                    </button>

                    <!-- form doi full name -->
                    <div id="modalFullName" class="modal">
                        <div class="modal-content">
                            <form method="post" id="frmFullName" action="${pageContext.request.contextPath}/User/UpdateName">
                                <div class="modal-body">
                                    <input placeholder="FullName" name="newName" id="newName" type="text" class="modal-input" autocomplete="off">
                                </div>
                                <div class="modal-footer" style="display: block">
                                    <button class="modal-aplly-button btn a-white" style="border-radius: 50px;width: 50%" type="submit" >Apply</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="title_vitri">
                <div class="title_p">
                    Profile
                </div>
            </div>
            <div class="username_vitri">
                <div class="username_p">
                    <span class="username_p1">Username</span>
                    <input id="user" class="mx-2 px-2 border-0 username_p2" value="${authUser.username}" readonly type="text">
                </div>
            </div>
            <div userID="${authUser.id}" class="password_vitri">
                <div class="password_p">
                    <span class="password_p1">Password</span>
                    <input class="mx-2 px-2 border-0 password_p2" value="${authUser.password}" readonly type="password">
                    <button class="btn password_p3" id="btnChangePass">
                        <i class="fas fa-pen password_p3"></i>
                    </button>
                    <!-- form doi  pass -->
                    <div id="modalChangePass" class="modal">
                        <div class="modal-content">
                            <form method="post"  autocomplete="off" action="${pageContext.request.contextPath}/User/UpdatePassword">
                                <div class="modal-body">
                                    <input type="text" name="editPasswordUserID" id="editPasswordUserID" style="display:none">
                                    <input  name="oldPassword" id="oldPassword" placeholder="Old Password" type="password" class="modal-input">
                                </div>
                                <div class="modal-body">
                                    <input name="newPassword" id="newPassword" autocomplete="new-password" placeholder="New Password" type="password" class="modal-input">
                                </div>

                                <div class="modal-footer" style="display: block">
                                    <button class="modal-aplly-button btn a-white" type="submit" style="border-radius: 50px;width: 50%">Apply</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div userID="${authUser.id}" class="email_vitri">
                <div class="email_p">
                    <span class="emai_p1">Email</span>
                    <input class="mx-2 px-2 border-0 email_p2" value="${authUser.email}" readonly type="text">
                    <button class="btn email_p3" id="btnChangeEmail">
                        <i class="fas fa-pen email_p3"></i>
                    </button>
                    <!-- form doi email -->
                    <div id="modalEmail" class="modal">
                        <div class="modal-content">
                            <form method="post" id="frmEmail" action="${pageContext.request.contextPath}/User/UpdateEmail">
                                <div class="modal-body">
                                    <input type="hidden" name="editEmailUserID" id="editEmailUserID" style="display:none">
                                    <input id="newEmail" name="newEmail" placeholder="New Email" autocomplete="off" type="text" class="modal-input">
                                </div>
                                <div class="modal-footer" style="display: block">
                                    <button class="modal-aplly-button btn a-white" style="border-radius: 50px;width: 50%" type="submit" >Apply</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div userID="${authUser.id}" class="bd_vitri">
                <div class="bd_p">
                    <div>
                        <span class="bd_p1">BirthDay</span>
                        <input class="mx-2 px-2 border-0 bd_p2" value="${authUser.dob}" readonly type="text">
                        <button class="btn bd_p3" id="btnChangeDOB">
                            <i class="fas fa-pen bd_p3"></i>
                        </button>
                        <!-- form doi DOB -->
                        <div id="modalDOB" class="modal">
                            <div class="modal-content">
                                <form method="post" id="frmDOB" action="${pageContext.request.contextPath}/User/UpdateDOB">
                                    <div class="modal-body">
                                        <input id="newDOB" name="newDOB" placeholder="dd/mm/yy" autocomplete="off" type="text" class="modal-input">
                                    </div>
                                    <div class="modal-footer" style="display: block">
                                        <button class="modal-aplly-button btn a-white" style="border-radius: 50px;width: 50%" type="submit" >Apply</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </div>

        <div class="container-fluid" style="background-color:  #f6f6f6">
            <div class="card-body">
                <div class="title2_p">
                    Add Category
                </div>
            </div>
        <!-- Edit Cat -->
        <div class="modal edit-cat-modal" id="modalEditCat">
            <div class="modal-content">
                <div class="modal-header modal_display_block modal_add_post_head_font">
                    <p>Edit Category</p>
                </div>
                <form method="post"  class="d-flex justify-content-between w-100 h-100"
                      style="flex-direction: column;">
                    <input type="text" class="catOrParentID" name="catOrParentID" style="display:none;">
                    <input type="text" id="catName" name="catName" placeholder="Category Name" autocomplete="off"
                           class="color-lightgray border-0 p-3" style="border-radius: 50px"><br>
                    <button class="btn p-3 bg-light text-info btn-update-cat" type="submit"  formaction="${pageContext.request.contextPath}/Admin/UpdateNameCategory"
                            style="border-radius: 50px; font-weight: bold;">
                        Update
                    </button>
                    <button class="btn p-3 bg-light text-info btn-add-cat" type="submit" formaction="${pageContext.request.contextPath}/Admin/AddCategory"
                            style="border-radius: 50px; font-weight: bold;">
                        Add
                    </button>
                </form>
            </div>
        </div>
        <!-- delete cat -->
        <div class="modal delete-cat-modal" id="modalDeleteCat">
            <div class="modal-content">
                <div class="modal-header modal_display_block modal_add_post_head_font">
                    <p>Delete Category</p>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/Admin/DeleteCategory" class="d-flex justify-content-between w-100 h-100"
                      style="flex-direction: column;">
                    <input type="text" name="deleteCatID" id="deleteCatID" style="display: none;">
                    <p class="color-lightgray border-0 p-3 p-cat-name"
                       style="border-radius: 50px;background-color: white;"></p>
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">
                        Delete
                    </button>
                </form>
            </div>
        </div>
        <!-- delete post -->
        <div class="modal delete-post-modal" id="modalDeletePost">
            <div class="modal-content">
                <div class="modal-header modal_display_block modal_add_post_head_font">
                    <p>Delete Post</p>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/Admin/DeletePost" class="d-flex justify-content-between w-100 h-100"
                      style="flex-direction: column;">
                    <input type="text" id="postDeleteID" name="postDeleteID" autocomplete="off"
                           class="color-lightgray border-0 p-3" style="border-radius: 50px;display:none"><br>
                    <p class="color-lightgray border-0 p-3 p-cat-name"
                       style="border-radius: 50px;background-color: white;"></p>
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">
                        Delete
                    </button>
                </form>
            </div>
        </div>
        <%--enable post--%>
        <div class="modal enable-post-modal" id="modalEnablePost">
            <div class="modal-content">
                <div class="modal-header modal_display_block modal_add_post_head_font">
                    <p>Enable Post</p>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateEnablePost">
                    <span style="font-weight:bold; color:silver; font-size:120%;text-align: center;">are you sure?</span>
                    <input type="hidden" name="postID" id="postEnableID">
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;margin: auto;">
                        Yes
                    </button>
                </form>
            </div>
        </div>
        <%--disable post--%>
        <div class="modal disable-post-modal" id="modalDisablePost">
            <div class="modal-content">
                <div class="modal-header modal_display_block modal_add_post_head_font">
                    <p>Disable Post</p>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateDisablePost">
                    <span style="font-weight:bold; color:silver; font-size:120%;text-align: center;">are you sure?</span>
                    <input type="hidden" name="postID" id="postDisableID">
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;margin: auto">
                        Yes
                    </button>
                </form>
            </div>
        </div>
        <!-- delete user -->
        <div class="modal delete-user-modal" id="modalDeleteUser">
            <div class="modal-content">
                <div class="modal-header modal_display_block modal_add_post_head_font">
                    <p>Delete User</p>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/Admin/DeleteUser" class="d-flex justify-content-between w-100 h-100"
                      style="flex-direction: column;">
                    <input type="text" id="userDeleteID" name="userDeleteID" class="color-lightgray border-0 p-3" autocomplete="off"
                           style="border-radius: 50px;display:none"><br>
                    <p class="color-lightgray border-0 p-3 p-cat-name"
                       style="border-radius: 50px;background-color: white;"></p>
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">
                        Delete
                    </button>
                </form>
            </div>
        </div>
        <%-- disable use--%>
        <div class="modal disable-user-modal" id="modalDisableUser">
            <div class="modal-content">
                <div class="modal-header modal_display_block modal_add_post_head_font">
                    <p>Disable User</p>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateDisableUser">
                    <span style="font-weight:bold; color:silver; font-size:120%;text-align: center;">are you sure?</span>
                    <input type="hidden" name="userID" id="userDisableID">
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;margin: auto">
                        Yes
                    </button>
                </form>
            </div>
        </div>
        <%--enable use--%>
        <div class="modal enable-user-modal" id="modalEnableUser">
            <div class="modal-content">
                <div class="modal-header modal_display_block modal_add_post_head_font">
                    <p>Enable User</p>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateEnableUser">
                    <span style="font-weight:bold; color:silver; font-size:120%;text-align: center;">are you sure?</span>
                    <input type="hidden" name="userID" id="userEnableID">
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;margin: auto">
                        Yes
                    </button>
                </form>
            </div>
        </div>


            <div class="card-body card_p card_frame1" >
                <table class="table">
                    <c:forEach var="c" items="${categoriesMenu}">
                        <c:choose>
                            <c:when test="${c.parentCat==0}">
                                <tr>
                                    <td class="d-flex justify-content-between" style="color:#576574; font-weight: bold;">
                                            ${c.name}
                                        <div catID="${c.id}" catName="${c.name}">
                                            <button type="button" class="btn text-info add-cat">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                            <button type="button" class="btn text-danger delete-cat">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn text-warning update-cat">
                                                <i class="fas fa-pen"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <ul class="ml-5 list-unstyled">
                                            <c:forEach items="${categoriesMenu}" var="cc">
                                                <c:choose>
                                                    <c:when test="${cc.parentCat == c.id}">
                                                        <li class="d-flex justify-content-between" style="border-bottom: 1px solid #dfe4ea">
                                                            <span>${cc.name}</span>
                                                            <div catID="${cc.id}" catName="${cc.name}">
                                                                <button type="button" class="btn text-danger delete-cat">
                                                                    <i class="fas fa-minus"></i>
                                                                </button>
                                                                <button type="button" class="btn text-warning update-cat">
                                                                    <i class="fas fa-pen"></i>
                                                                </button>
                                                            </div>
                                                        </li>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                </tr>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </table>
            </div>
        <div class="container-fluid" style="background-color:  #f6f6f6">
            <div class="card-body">
                <div class="title2_p">
                    Post
                </div>
                <div class="card-header d-flex justify-content-between" style="margin: auto">
                    <span style="font-weight: bold;color:#341f97;font-size: 20px;" id="post">Post</span>
                    <div>
                        <form method="get">
                            <label style="color:#341f97" for="userSearch">user</label>
                            <input type="text" id="userSearch" name="userSearch">
                            <label style="color:#341f97" for="categorySearch">category</label>
                            <select name="categorySearch" id="categorySearch">
                                <option value="0">All</option>
                                <c:forEach var="c" items="${categoriesMenu}">
                                    <option value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                            <button type="submit" class="btn btn-outline-secondary">Search</button>
                        </form>
                    </div>
                </div>
                <div class="card-body "style="overflow: auto">
                    <table class="table">
                        <c:forEach items="${posts}" var="c">
                            <tr>
                                <td class="d-flex justify-content-between" style="color:#576574; font-weight: bold;">
                                    <a style="color:#576574; font-weight: bold;" href="${pageContext.request.contextPath}/Post/Detail?id=${c.id}">${c.postname}</a>
                                    <div postID="${c.id}" postName="Design">
                                        <button type="button" class="btn text-danger delete-post">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <c:choose>
                                            <c:when test="${c.enable.equals('true')}">
                                                <button class="btn text-info edit-post-disable">
                                                    <i class="fas fa-lock-open"></i>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn text-danger edit-post-enable">
                                                    <i class="fas fa-lock"></i>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <%--  Quan ly User--%>
        <div class="container-fluid" style="background-color:  #f6f6f6">
            <div class="card-body ">
                <div class="title2_p">
                    User
                </div>
                <table class="table">
                    <thead>
                    <tr style="color:#576574">
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="c">
                        <tr>
                            <td>${c.username}</td>
                            <td>${c.name}</td>
                            <td>${c.email}</td>
                            <td style="text-align: right;">
                                <div userID="${c.id}">
                                    <button type="button" class="btn text-danger delete-user">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <c:choose>
                                        <c:when test="${c.enable.equals('true')}">
                                            <button class="btn text-info edit-user-disable">
                                                <i class="fas fa-lock-open"></i>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn text-danger edit-user-enable">
                                                <i class="fas fa-lock"></i>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </jsp:body>
</t:main>

