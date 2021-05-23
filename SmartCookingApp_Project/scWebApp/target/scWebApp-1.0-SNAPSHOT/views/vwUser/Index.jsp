<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="categoriesMenu" scope="request" type="java.util.List<beans.Category>"/>
<jsp:useBean id="wl" scope="request" type="java.util.List<beans.Post>"/>

<t:main>
    <jsp:attribute name="css">
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
        <link href="https://cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"  crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.1.3/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styleprofile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">

    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/public/js/checkInput.js"></script>
        <script src="${pageContext.request.contextPath}/public/js/Admin.js"></script>
        <script src="${pageContext.request.contextPath}/public/js/user.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
        <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.1.3/js/fileinput.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.1.3/js/locales/vi.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.1.3/themes/fa/theme.min.js"></script>
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
        var quill = new Quill('#editor', {

            theme: 'snow'
        });
        var quill2 = new Quill('#editor2', {
            theme: 'snow'
        });
        var quill3 = new Quill('#editor3', {
            theme: 'snow'
        });
        var quill4 = new Quill('#editor4', {
            theme: 'snow'
        });
        quill2.on('text-change',function (delta,source)
        {
            $('#newFullDes').val(quill2.root.innerHTML);
            console.log(quill2.root.innerHTML)
        })
        quill3.on('text-change',function (delta,source)
        {
            $('#tinyDes').val(quill3.root.innerHTML);
        })
        quill4.on('text-change',function (delta,source)
        {
            $('#newTinyDes').val(quill4.root.innerHTML);
        })
        $('#input-b1').fileinput({
            language: 'vi',
            theme: 'fa',
            showUpload : false,
            dropZoneEnabled: false,
            allowedFileExtensions: ['jpg', 'png', 'gif']
        });
        $('#input-b2').fileinput({
            language: 'vi',
            theme: 'fa',
            showCaption: false,
            showUpload : false,
            dropZoneEnabled: false,
            allowedFileExtensions: ['jpg', 'png', 'gif']
        });

        $('#newDOB').datetimepicker({
            format: 'd/m/Y',
            timepicker: false,
            mask: true,
        });
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

        <div class="container-fluid">
            <img src="${pageContext.request.contextPath}/public/imgs/imgProfile2.png" class="d-block" height="100%" width="100%" >
            <div class="title2_vitri">
                <div class="title2_p">
                    My Post
                </div>
            </div>
            <div class="post_button_vitri">
                <button class="btn" type="button" id="btnAddPost">
                    <i class="fa fa-plus-square text-info post_button_p" ></i>
                </button>
            </div>
            <!-- add post -->
            <div id="modalAddPost" class="modal">
                <div class="modal-content1">
                    <div class="modal-header modal_display_block modal_add_post_head_font">
                        Add Post
                    </div>
                    <form method="post" autocomplete="off" enctype="multipart/form-data"
                          action="${pageContext.request.contextPath}/User/AddPost">
                        <div class="modal_body_add_post">
                            <input class="modal-post-input" style="margin-right: 120px;" type="text"
                                   name="postName" id="postName" placeholder="Post Name">
                            <select class="modal-post-input" name="catID" id="catID" size="1">
                                <div >
                                    <c:forEach items="${categoriesMenu}" var="c">
                                        <c:if test="${c.parentCat>0}">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </select>
                        </div>
                        <div class="modal_body_add_post">
                            <input type="hidden" name="tinyDes" id="tinyDes">
                            <p class="modal-add-post-font1 ">Ingredients</p>
                                <div class="modal-add-post-des">
                                    <div id="editor3">
                                    </div>
                                </div>
                        </div>
                        <div class="modal_body_add_post">
                            <p class="modal-add-post-font1 ">Image</p>
                            <input type="file" class="file" name="input-b1" id="input-b1" />
                        </div>
                        <div class="modal_body_add_post">
                            <input type="hidden" name="fullDes" id="fullDes">
                            <p class="modal-add-post-font1 ">full description</p>
                            <div class="modal-add-post-des">
                                <div id="editor">
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button class="modal-aplly-button btn a-white" type="submit" >Apply</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- delete post -->
            <div class="modal delete-post-modal" id="modalDeletePost">
                <div class="modal-content">
                    <div class="modal-header modal_display_block modal_add_post_head_font">
                        <p>Delete Post</p>
                    </div>
                    <form method="post" autocomplete="off"
                          action="${pageContext.request.contextPath}/User/DeletePost">
                        <div style="color:black; font-size: 20px;font-weight: bold">
                            <input type="hidden" name="postID" id="deletePostID">
                            <p class="border-0 p-3 p-post-name" ></p>
                        </div>
                        <div class="modal-footer">
                            <button class="modal-aplly-button btn a-white" type="submit">Apply</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- edit postname -->
            <div class="modal edit-postname-modal" id="modalChangePostName">
                <div class="modal-content">
                    <div class="modal-header modal_display_block modal_add_post_head_font">
                        <p>Edit PostName</p>
                    </div>
                    <form action="${pageContext.request.contextPath}/User/UpdatePostname" method="post">
                        <input type="hidden" name="postID" id="editPostID">
                        <input type="text" name="newPostName" id="newPostName" placeholder="new Post Name" autocomplete="off" class="modal-post-input">
                        <div class="modal-footer">
                            <button class="modal-aplly-button btn a-white" type="submit">Apply</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- edit tinydes -->
            <div class="modal edit-tinydes-modal" id="modalChangeTinyDes">
                <div class="modal-content">
                    <div class="modal-header modal_display_block modal_add_post_head_font">
                        <p>Edit Ingredients</p>
                    </div>
                    <form action="${pageContext.request.contextPath}/User/UpdateTinyDes" method="post">
                        <input type="hidden" name="postID" id="editTinydesID">
                        <input type="hidden" name="newTinyDes" id="newTinyDes">
                        <div class="modal_body_add_post">
                            <div class="modal-add-post-des">
                                <div id="editor4">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="modal-aplly-button btn a-white" type="submit">Apply</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- edit fulldes -->
            <div class="modal edit-fulldes-modal" id="modalChangeFullDes">
                <div class="modal-content">
                    <div class="modal-header modal_display_block modal_add_post_head_font">
                        <p>Edit Full Description</p>
                    </div>
                    <form action="${pageContext.request.contextPath}/User/UpdateTinyDes" method="post">
                        <input type="hidden" name="postID" id="editFullDescID">
                        <input type="hidden" name="newFullDes" id="newFullDes">
                        <div class="modal_body_add_post">
                            <div class="modal-add-post-des">
                                <div id="editor2">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="modal-aplly-button btn a-white" type="submit">Apply</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- edit category -->
            <div class="modal edit-category-modal" id="modalChangeCategory">
                <div class="modal-content">
                    <div class="modal-header modal_display_block modal_add_post_head_font">
                        <p>Edit Category</p>
                    </div>
                    <form action="${pageContext.request.contextPath}/User/UpdatePostCategory" method="post">
                        <input type="hidden" name="postID" id="editCategoryID">
                            <select class="modal-post-input" name="newCatID" id="newCatID" size="1">
                                <div >
                                    <c:forEach items="${categoriesMenu}" var="c">
                                        <c:if test="${c.parentCat>0}">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </select>
                        <div class="modal-footer">
                            <button class="modal-aplly-button btn a-white" type="submit">Apply</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- edit image -->
            <div class="modal edit-image-modal" id="modalChangeImage">
                <div class="modal-content">
                    <div class="modal-header modal_display_block modal_add_post_head_font">
                        <p>Edit Image</p>
                    </div>
                    <form action="${pageContext.request.contextPath}/User/UpdateImage" enctype="multipart/form-data" method="post">
                        <input type="hidden" name="postID" id="editImageID">
                        <div class="modal_body_add_post">
                            <input  type="file" class="file" name="input-b1" id="input-b2" data-browse-on-zone-click="true"/>
                        </div>
                        <div class="modal-footer">
                            <button class="modal-aplly-button btn a-white" type="submit">Apply</button>
                        </div>
                    </form>
                </div>
            </div>


            <div class="card_vitri card_p card_frame">
                <c:forEach items="${posts}" var="c">
                    <c:if test="${c.userID == authUser.id}">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <div>
                                        ${c.postname}
                                    <div postID="${c.id}" postName="${c.postname}" class="d-flex">
                                        <button class="btn text-danger delete-post-btn" id="btnDeletePost">
                                            <i class="fas fa-minus-square" aria-hidden="true" style="font-size: 20px"></i>
                                        </button>
                                        <div class="dropdown">
                                            <button class="btn dropdown-toggle text-warning"  data-toggle="dropdown">
                                                <i class="fas fa-edit text-warning " aria-hidden="true" style="font-size: 20px"></i>
                                            </button>
                                            <div class="dropdown-menu"  postID="${c.id}">
                                                <button class="btn text-warning edit-postname-btn">Post Name</button><br>
                                                <button class="btn text-warning edit-tinydes-btn">Ingredients</button><br>
                                                <button class="btn text-warning edit-fulldes-btn">Full Description</button><br>
                                                <button class="btn text-warning edit-category-btn">Category</button><br>
                                                <button class="btn text-warning edit-image-btn">Image</button><br>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/Post/Detail?id=${c.id}">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="container-fluid">
            <img src="${pageContext.request.contextPath}/public/imgs/imgProfile2.png" class="d-block" height="100%" width="100%" >
            <div class="title3_vitri">
                <div class="title2_p">
                    My WatchList
                </div>
            </div>
            <div class="wl-frame-vitri">
                <div class="wl-frame">
                    <section class="wl-p">
                        <c:forEach items="${wl}" var="c">
                                <div class="wl-p-card">
                                    <a href="${pageContext.request.contextPath}/Post/Detail?id=${c.id}">
                                        <div class="wl-p-image">
                                            <img src="${pageContext.request.contextPath}/public/image/${c.id}.png">
                                        </div>
                                        <div class="wl-p-info">
                                            <h5>${c.postname}</h5>
                                            <p>${c.tinyDes}</p>
                                        </div>
                                    </a>
                                </div>
                            </a>
                        </c:forEach>
                    </section>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>

