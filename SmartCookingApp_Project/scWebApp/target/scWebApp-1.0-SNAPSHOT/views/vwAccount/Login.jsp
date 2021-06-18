
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/login.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

</head>
<body>
<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
        <div class="card login-card">
            <div class="row no-gutters">
                <div class="col-md-5">
                    <img style="padding: 5px; width: 470px" src="${pageContext.request.contextPath}/public/imgs/MlemMlem.jpg" alt="login" class="login-card-img" >
                </div>
                <div class="col-md-7">
                    <div class="card-body">
                        <p class="login-card-description">Sign into your account</p>
                        <c:if test="${hasError}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert" style="color: red">
                                <strong>Login failed!</strong> ${errorMessage}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </c:if>
                        <form method="post">
                            <div class="form-group">
                                <label for="user" class="sr-only">Tài khoản</label>
                                <input type="text" name="username" id="user" class="form-control" placeholder="Your Account">
                            </div>
                            <div class="form-group mb-4">
                                <label for="pass" class="sr-only">Password</label>
                                <input type="password" name="password" id="pass" class="form-control" data-type="password" placeholder="***********">
                            </div>
                            <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit" value="Login">
                        </form>
                        <a href="#!" class="forgot-password-link">Forgot password?</a>
                        <p class="login-card-footer-text">Don't have an account? <a href="${pageContext.request.contextPath}/Account/Register" class="text-reset">Register here</a></p>
                        <a href="${pageContext.request.contextPath}/Home" class="text-reset">Back to Home!</a></p>
                        <nav class="login-card-footer-nav">
                            <a href="#!">Terms of use.</a>
                            <a href="#!">Privacy policy</a>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>

</html>
