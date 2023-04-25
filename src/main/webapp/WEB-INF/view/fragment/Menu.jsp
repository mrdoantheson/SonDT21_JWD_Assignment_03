<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 23/04/2023
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div class="col-lg-2 bg-light vh-100">
    <div class="input-group pt-3 pb-3 border-bottom">
        <input type="text" class="form-control" placeholder="Searching..." aria-label="Searching"
               aria-describedby="button-addon2">
        <button class="btn btn-outline-secondary" type="button" id="button-addon2"><i
                class="fas fa-search"></i>
        </button>
    </div>
    <div id="view-contents" class="mb-3 my-3 border-bottom pb-2">
        <a href="${pageContext.request.contextPath}/contents" class="text-decoration-none ">
            <i class="fas fa-calendar-alt"></i> View contents
        </a>
    </div>
    <div class="mb-3 my-3 border-bottom pb-2">
        <a href="${pageContext.request.contextPath}/contents/add" class="text-decoration-none pb-2">
            <i class="fas fa-edit"></i> Form content
        </a>
    </div>
</div>
</body>
</html>
