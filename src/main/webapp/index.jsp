<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="CSS/style.css">
    <title>Note Taker</title>
    <%@include file="all_files_css_js.jsp"%>
</head>
<body>
<div class="container" >
    <!-- adding navbar file to this JSP -->
    <%@include file="Navbar.jsp"%>

        <br>
    <div class="card my-5">
        <img class="img-fluid mx-auto" style="max-width: 400px" src="images/note.png">
        <H1 class="text-primary text-uppercase text-center mt-3">Start taking your Notes</H1>
        <div class="container text-center">
        <button class="btn btn-outline-primary text-center mt-3" href="Add_Notes.jsp">Start</button>
        </div>
    </div>
</div>




</body>
</html>