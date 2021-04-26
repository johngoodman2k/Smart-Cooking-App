
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body{
            background-image: url('${pageContext.request.contextPath}/public/imgs/MlemMlem.jpg') ;

            background-position: center;
            background-position-x: left;

            background-size: 1200px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-9">
        </div>

        <div class="col-3" >

            <div style=" background-color: white; border-top-right-radius: 25%; ">
                <div style="margin-top: 90%; text-align: center; padding-top: 10% ; " ><h1 style="color: orange;">SIGN IN</h1></div>
                <c:if test="${hasError}">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert" style="color: red">
                        <strong>Login failed!</strong> ${errorMessage}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:if>
                <form method="post" >
                <div style="margin-top: 15%;padding-bottom: 10%; padding-top: 10%">
                    <div style="text-align: center;">

                        <div style="margin-bottom: 10%;">
                            <input id="user" type="text" class="input" name="username" placeholder="Tài khoản">
                        </div>
                        <div style="margin-bottom: 10%;">
                            <input id="pass" type="password" class="input" data-type="password" name="password" placeholder="Mật khẩu">
                        </div>
                        <div>
                            <button type="submit" class="btn btn-outline-warning" style="width: 78%;">Sign In</button>
                        </div>

                        <div style="padding-top: 10%;">
                            <span><a href="${pageContext.request.contextPath}/Home"  role="button" >Home</a></span>
                            <span>&sbquo;</span>
                            <span><a href="${pageContext.request.contextPath}/Account/Register"  role="button">Register </a></span>
                        </div>

                    </div>
                </div>
                </form>
            </div>


        </div>
    </div>
</div>
</body>

</html>
