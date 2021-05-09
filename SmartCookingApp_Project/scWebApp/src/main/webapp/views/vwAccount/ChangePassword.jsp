<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="beans.User"/>

<t:main>
    <jsp:body>
        <div>
            <div class="container">
                <div class="row">

                    <div >
                        <div style=" background-color: #79dcf1;">
                            <div style="margin: 80px; text-align: center; padding-top: 10%; "><h1 style="color: orange;">Change Password</h1></div>
                            <c:if test="${hasError}">
                                <div class="alert alert-warning alert-dismissible fade show" role="alert" style="color: red">
                                    <strong>Login failed!</strong> ${errorMessage}
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                            <form method="post">
                                <div style="padding-bottom: 10%;">
                                    <div style="text-align: center;">
                                        <div style="display: none">
                                            <input id="user" type="text" class="input" name="username" value="${authUser.username}">
                                        </div>

                                        <div style="margin-bottom: 10%;">
                                            <input id="pass" type="text" class="input" name="password" placeholder="Mật khẩu cũ">
                                        </div>
                                        <div style="margin-bottom: 10%;">
                                            <input id="newpass" type="password" class="input" data-type="password" name="newpassword" placeholder="Mật khẩu mới">
                                        </div>
                                        <div style="display: none">
                                            <input id="txtName" type="text" class="input" name="name" value="${authUser.name}">
                                        </div>
                                        <div style="display: none">
                                            <input id="email" type="text" class="input" name="email" value="${authUser.email}">
                                        </div>
                                        <div style="display: none">
                                            <label for="txtDOB" class="label" ><Strong>Date of Birth</Strong></label>
                                            <input id="txtDOB" type="text" class="input" name="dob" value="${authUser.dob}">
                                        </div>
                                        <div style="display: none">
                                            <input id="per" type="text" class="input" name="permission" value="${authUser.permission}">
                                        </div>
                                        <div style="display: none">
                                            <input id="id" type="text" class="input" name="id" value="${authUser.id}">
                                        </div>
                                        <div>
                                            <a href="${pageContext.request.contextPath}/views/vwHome/Index.jsp">
                                            <button type="submit" class="btn btn-outline-warning"
                                                    formaction="${pageContext.request.contextPath}/Account/ChangePassword" style="width: 78%;">Change Password</button>
                                            </a>
                                        </div>


                                    </div>
                                </div>
                            </form>
                        </div>


                    </div>
                </div>
            </div>
        </div>


    </jsp:body>
</t:main>