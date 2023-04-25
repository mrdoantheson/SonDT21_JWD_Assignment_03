<%@ page import="java.util.List" %>
<%@ page import="fa.tranning.sondt21_jwd_assignment_03.model.entity.Content" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 20/04/2023
  Time: 09:33
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
    <title>View Contents</title>
</head>
<body class="bg-light">

<jsp:include page="../fragment/Hearder.jsp"/>

<div class="container-fluid bg-white">
    <div class="row">
        <jsp:include page="../fragment/Menu.jsp"/>

        <div class="col-lg-10 p-3">
            <h2 class="p-3 border-bottom" style="margin-bottom: 0.5em">View content</h2>
            <div class="border">
                <p class="p-3 border-bottom bg-light" style="margin-bottom: 0">Profile Form Elements</p>
                <div class="p-3 table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Title</th>
                            <th scope="col">Brief</th>
                            <th scope="col">Created Date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Content> contentList = (List<Content>) request.getAttribute("contents");
                            for (int i = 0; i < contentList.size(); i++) {
                                Content content = contentList.get(i);
                        %>
                        <tr>
                            <td><%=i + 1%>
                            </td>
                            <td><%=content.getTitle()%>
                            </td>
                            <td><%=content.getBrief()%>
                            </td>
                            <td><%=content.getCreateDate()%>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>
