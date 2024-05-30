<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Notes</title>
    <%@include file="all_files_css_js.jsp"%>
</head>
<div class="container">
    <%@include file="Navbar.jsp"%>
    <br>
        <H1>Please Fill Your Note Details</H1>
            <br>
    <%--This is add Form--%>
    <form action="Servlet/SaveNoteServlet" method="post">
        <div class="form-group">
            <%--@declare id="title"--%><label for="title">Note Title</label>
            <input type="text" class="form-control" id="title" name="title" aria-describedby="emailHelp" placeholder="Enter Notes Title Here" required>
            </div>
        <div class="form-group">
            <%--@declare id="content"--%><label for="content">Note Content</label>
            <textarea id="note_content" name="content" class="form-control" placeholder="Enter Your Content Here" style="height:300px" required></textarea>
        </div>

        <div class="contanier text-center">
            <button type="submit" class="btn btn-success">Add Note</button>
        </div>
    </form>
</div>
</body>
</html>
