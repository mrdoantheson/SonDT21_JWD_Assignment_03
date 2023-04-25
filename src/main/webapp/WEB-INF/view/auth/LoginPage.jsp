<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 22/04/2023
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <title>Login Page</title>
</head>
<body class="bg-light">
<div class="container col-md-4" style="margin-top: 10rem">
    <div class="border rounded">
        <p class="p-3 border-bottom bg-light" style="margin-bottom: 0">Please Sign In</p>
        <form method="POST" class="p-3 bg-white" action="${pageContext.request.contextPath}/login" id="login-form">
            <fieldset class="pb-3">
                <div class="form-group pb-3">
                    <input type="email" class="form-control" name="email" id="email" placeholder="E-mail" size="50"
                           required>
                </div>
                <div class="form-group pb-3">
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password"
                           size="50" required>
                </div>
                <%
                    String error = (String) request.getAttribute("errorInvalidEmail");
                    if (error != null) { %>
                <p class="text-danger"><%=error%>
                </p>
                <% } %>
                <div class="form-check pb-3">
                    <input type="checkbox" class="form-check-input" id="remember-me" placeholder="Password" size="50">
                    <label class="form-check-label" for="remember-me">Remember Me</label>
                </div>
                <button class="btn btn-primary w-100 btn-success" type="submit">Login</button>
            </fieldset>
            <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">Click here to
                Register</a>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>
