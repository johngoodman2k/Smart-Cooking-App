
<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">\
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styles1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
    <jsp:invoke fragment="css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <title>Mlem Mlem</title>
</head>

<body>
    <jsp:include page="../../views/partials/nav.jsp"/>

    <div>
        <jsp:doBody />
    </div>
    <script src="https://kit.fontawesome.com/b325eaacc3.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/public/js/mk.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js "></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js "></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:invoke fragment="js"/>
</body>

</html>

