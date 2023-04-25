<%@ page import="fa.tranning.sondt21_jwd_assignment_03.model.entity.Member" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 24/04/2023
  Time: 11:27
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
    <link rel="stylesheet" href="css/style.css">
    <title>Edit Profile</title>
</head>
<body class="bg-light">
<jsp:include page="../fragment/Hearder.jsp"/>
<%
    Member member = (Member) request.getSession().getAttribute("memberLogin");
%>
<div class="container-fluid bg-white">
    <div class="row">
        <jsp:include page="../fragment/Menu.jsp"/>

        <div id="edit-profile" class="col-lg-10 p-3">
            <h2 class="p-3 border-bottom" style="margin-bottom: 0.5em">Edit profile</h2>
            <div class="border">
                <p class="p-3 border-bottom bg-light" style="margin-bottom: 0">Profile Form Elements</p>
                <form class="p-3" method="post" action="${pageContext.request.contextPath}/contents/edit_profile">
                    <input type="hidden" name="id" value="<%=member.getId()%>">
                    <div class="pb-3">
                        <label for="first-name" class="form-label fw-bold">First name</label>
                        <input type="text" class="form-control" id="first-name" name="first-name"
                               placeholder="Enter the first name"
                               size="50" value="<%=member.getFirstName() != null ? member.getFirstName() : ""%>">
                    </div>
                    <div class="pb-2">
                        <label for="last-name" class="form-label fw-bold">Last name</label>
                        <input type="text" class="form-control" id="last-name" name="last-name"
                               placeholder="Enter the last name"
                               size="50" value="<%=member.getLastName() != null ? member.getLastName() : ""%>">
                    </div>
                    <div class="pb-2">
                        <label for="staticEmail" class="col-sm-2 fw-bold" style="margin-top: 0.5em">Email</label>
                        <input type="text" readonly class="form-control-plaintext" id="staticEmail"
                               value="<%=member.getEmail()%>" size="50">
                    </div>
                    <div class="pb-2">
                        <label for="phone" class="form-label fw-bold">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone"
                               placeholder="Enter your phone number" value="<%= member.getPhone() != null ? member.getPhone() : ""%>">
                    </div>
                    <div class="pb-3">
                        <label for="description" class="form-label fw-bold">Description</label>
                        <textarea class="form-control" id="description" rows="4" value="<%=member.getDescription() != null ? member.getDescription() : ""%>"></textarea>
                    </div>
                    <div class="pb-2">
                        <button type="submit" class="border border-dark-subtle rounded px-2 bg-white">Submit Button
                        </button>
                        <button type="reset" class="border border-dark-subtle rounded px-2 bg-white">Reset Button
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>
