
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
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
                <div style="margin-top: 15%; text-align: center; padding-top: 10% ; " ><h1 style="color: orange;">SIGN UP</h1></div>
                <c:if test="${hasError}">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert" style="color: red">
                        <strong>Login failed!</strong> ${errorMessage}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:if>
                <form id="form-register" method="post">
                    <div style="margin-top: 15%;padding-bottom: 10%; padding-top: 10%">
                        <div style="text-align: center;">

                            <div style="margin-bottom: 10%;">
                                <input id="username" type="text" class="input" name="username" maxlength="50" autocomplete="new-password" placeholder="T??i kho???n">
                            </div>
                            <div style="margin-bottom: 10%;">
                                <input id="password" type="password" class="input" data-type="password" name="password" maxlength="50" autocomplete="new-password" placeholder="M???t kh???u">
                            </div>
                            <div style="margin-bottom: 10%;">
                                <input id="confirm" type="password" class="input" data-type="password" name="confirm" autocomplete="off" maxlength="50" placeholder="Nh???p l???i m???t kh???u">
                            </div>
                            <div style="margin-bottom: 10%;">
                                <input id="name" type="text" class="input" name="name" autocomplete="off" maxlength="50" placeholder="Nick name">
                            </div>
                            <div style="margin-bottom: 10%;">

                                <input id="email" type="text" class="input" name="email" autocomplete="off" maxlength="50" placeholder="email">
                            </div>
                            <div style="margin-bottom: 10%;">
                                <label for="txtDOB" class="label" ><Strong>Date of Birth</Strong></label>
                                <input id="txtDOB" type="text" class="input" autocomplete="off" name="dob">
                            </div>
                            <div>
                                <button type="submit" formaction="${pageContext.request.contextPath}/Account/Register" class="btn btn-outline-warning" style="width: 78%;">Sign Up</button>
                            </div>

                            <div style="padding-top: 10%;">
                                <span><a href="${pageContext.request.contextPath}/Home"  role="button" >Home</a></span>
                                <span>&sbquo;</span>
                                <span><a href="${pageContext.request.contextPath}/Account/Login"  role="button">Already Member? </a></span>
                            </div>

                        </div>
                    </div>
                </form>
            </div>


        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<script src="${pageContext.request.contextPath}/public/js/checkInput.js"></script>
<script src="${pageContext.request.contextPath}/public/js/mk.js"></script>
<script>

    $("#form-register").on('submit',function(e){
        e.preventDefault();
        if(!checkEmpty('#username') || !checkEmpty('#password') || !checkEmpty('#confirm') || !checkEmpty('#name'))
        {
            return;
        }
        else if( !checkUsername('${pageContext.request.contextPath}') || !checkPassword(passwordSecurityPoint('#password')) || !checkConfirm() || !checkFullName() || !checkEmail('${pageContext.request.contextPath}'))
        {
            return;
        }
        $("#form-register").off('submit').submit();
    })

    $('#txtDOB').datetimepicker({
        format: 'd/m/Y',
        timepicker: false,
        mask: true,
    });

    $('#user').select();


</script>
</body>

</html>
