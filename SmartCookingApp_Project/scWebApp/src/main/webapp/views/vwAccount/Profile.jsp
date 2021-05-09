<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mlem Mlem</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/b325eaacc3.js" crossorigin="anonymous"></script>

</head>
<body>
<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styleprofile.css">
    </jsp:attribute>
    <jsp:attribute name="js">
    <script>
        // Get the modal
        var modalFullName = document.getElementById("modalFullName");
        var modalChangePass = document.getElementById("modalChangePass");
        // var modalChangeEmail = document.getElementById("modalChangeEmail");
        // Get the button that opens the modal
        var btnChangeName = document.getElementById("btnChangeName");
        var btnChangePass = document.getElementById("btnChangePass");
        // var btnChangeEmail = document.getElementById("btnChangeEmail");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal
        btnChangeName.onclick = function() {
            modalFullName.style.display = "block";
        }
        btnChangePass.onclick = function(){
            modalChangePass.style.display= "block"
        }

        // btnChangeEmail.onclick = function() {
        //     modal.style.display = "block";
        // }
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modalFullName.style.display = "none";
            modalChangePass.style.display= "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modalFullName || event.target == modalChangePass) {
                modalFullName.style.display = "none";
                modalChangePass.style.display= "none";
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
                        <!-- Modal content -->
                        <div class="modal-content">
                            <div class="modal-header">
<%--                                <span class="close">&times;</span>--%>
                                <img src="${pageContext.request.contextPath}/public/imgs/logo.png">
                            </div>
                            <form>
                                <div class="modal-body h-100 d-flex align-items-center">
                                    <input placeholder="FullName" type="text" class="modal-input">

                                </div>
                                <div class="modal-footer">
                                    <a class="modal-aplly-button btn a-white" href="" role="button" type="summit">Apply</a>
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
                    <input class="mx-2 px-2 border-0 username_p2" value="${authUser.username}" readonly type="text">
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
                        <!-- Modal content -->
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <span class="close">&times;</span> -->
                                <img src="${pageContext.request.contextPath}/public/imgs/logo.png">
                            </div>
                            <form>
                                <div class="modal-body h-100 d-flex align-items-center">
                                    <input placeholder="Password old" type="text" class="modal-input">

                                </div>
                                <div class="modal-body h-100 d-flex align-items-center">
                                    <input placeholder="New Password" type="text" class="modal-input">
                                </div>

                                <div class="modal-footer">
                                    <a class="modal-aplly-button btn a-white" href="" role="button" type="summit">Apply</a>
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
<%--                    <button class="btn email_p3">--%>
<%--                        <i class="fas fa-pen email_p3"></i>--%>
<%--                    </button>--%>
                </div>
            </div>

            <div userID="${authUser.id}" class="bd_vitri">
                <div class="bd_p">
                    <div>
                        <span class="bd_p1">BirthDay</span>
                        <input class="mx-2 px-2 border-0 bd_p2" value="${authUser.dob}" readonly type="text">
<%--                        <button class="btn bd_p3" type="button">--%>
<%--                            <i class="fas fa-pen bd_p3"></i>--%>
<%--                        </button>--%>
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
                <button class="btn" type="button">
                    <i class="fa fa-plus-square text-info post_button_p" ></i>
                </button>
            </div>
        </div>
    </jsp:body>
</t:main>
</body>
</html>
