<%@ page import="fa.tranning.sondt21_jwd_assignment_03.model.entity.Member" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 22/04/2023
  Time: 18:19
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
    <title>Add content</title>
</head>
<body>

<jsp:include page="../fragment/Hearder.jsp"/>

<div class="container-fluid bg-white">
    <div class="row">
        <jsp:include page="../fragment/Menu.jsp"/>
        <div class="col-lg-10 p-3" id="add-content">
            <%
                Member member = (Member) request.getAttribute("members");
            %>
            <h2 class="p-3 border-bottom" style="margin-bottom: 0.5em">Add content</h2>
            <div class="border">
                <p class="p-3 border-bottom bg-light" style="margin-bottom: 0">Profile Form Elements</p>
                <form method="post" class="p-3" action="${pageContext.request.contextPath}/contents/add">
                    <input type="hidden" name="member_id" value="<%= member != null ? member.getId() : ""%>">
                    <div class="pb-3">
                        <label for="title" class="form-label fw-bold">Title</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Enter the title"
                               size="50">
                    </div>
                    <div class="pb-3">
                        <label for="brief" class="form-label fw-bold">Brief</label>
                        <textarea class="form-control" id="brief" name="brief" rows="3"></textarea>
                    </div>
                    <div class="pb-3">
                        <label for="content" class="form-label fw-bold">Content</label>
                        <textarea class="form-control" id="content" name="content" rows="8"></textarea>
                    </div>
                    <div class="pb-2">
                        <button type="submit" class="border border-dark-subtle rounded p-2 bg-white">Submit Button
                        </button>
                        <button type="reset" class="border border-dark-subtle rounded p-2 bg-white">Reset Button
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
<script>
    const link = document.querySelectorAll('#view-contents a')

    link.forEach(link => {
        link.addEventListener('click', async (event) => {
            event.preventDefault();

            // Show loading message
            const loadingMessage = document.createElement('div');
            loadingMessage.innerText = 'Loading...';
            loadingMessage.classList.add('mt-5', 'fs-1');

            // Remove all children of .form-content
            const addContent = document.querySelector('#add-content');
            addContent.innerHTML = loadingMessage.outerHTML;

            // Use async/await to wait for 5 seconds
            await new Promise(resolve => setTimeout(resolve, 5000));

            // Navigate to the corresponding HTML page
            window.location.href = link.getAttribute('href');
        })
    });
</script>

</body>
</html>
