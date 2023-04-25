<%@ page import="fa.tranning.sondt21_jwd_assignment_03.model.entity.Member" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 22/04/2023
  Time: 16:45
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
    <title>Register Page</title>
</head>
<body class="bg-light">
<div class="container col-md-4" style="margin-top: 10rem">
    <div class="border rounded">
        <p class="p-3 border-bottom bg-light" style="margin-bottom: 0">Register</p>
        <form id="register" class="p-3 bg-white" method="post" action="">
            <fieldset class="pb-3">
                <div class="form-group pb-3">
                    <input type="text" id="username" class="form-control" name="username" placeholder="User name"
                           size="50" minlength="3"
                           maxlength="30" required>
                </div>
                <div class="form-group pb-3">
                    <input type="email" id="email" class="form-control" name="email" placeholder="E-mail"
                           size="50" required>
                </div>
                <%
                    String error = (String) request.getAttribute("errorExistsEmail");
                    if (error != null) { %>
                <p class="text-danger"><%=error%>
                </p>
                <% } %>
                <div class="form-group pb-3">
                    <input type="password" id="password" class="form-control" name="password"
                           placeholder="Password" size="50" required>
                </div>
                <div class="form-group pb-3">
                    <input type="password" id="re-password" class="form-control" name="confirmSecPass"
                           placeholder="Re Password"
                           size="50" required>
                </div>
                <button class="btn btn-primary w-100 btn-success" type="submit">Register</button>
            </fieldset>
            <a href="${pageContext.request.contextPath}/login" class="text-decoration-none">Click here to Login</a>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script type="text/javascript">
    const FORM = document.querySelector('#register')

    FORM.addEventListener('submit', (event) => {

        const passwordInput = document.querySelector('#password')
        const confirmPasswordInput = document.querySelector('#re-password')
        if (passwordInput.value !== confirmPasswordInput.value) {
            alert('Password do not match')
            clearPassword()
            event.preventDefault()
            return
        } else {
            FORM.action = "${pageContext.request.contextPath}/register"
        }
    })

    const clearPassword = () => {
        document.querySelector('#password').value = ''
        document.querySelector('#re-password').value = ''
    }
</script>
</body>
</html>
