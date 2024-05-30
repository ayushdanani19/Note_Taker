<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="Entities.Notes" %><%--
  Created by IntelliJ IDEA.
  User: Ayush Danani Hi!
  Date: 30-05-2024
  Time: 11:13 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="all_files_css_js.jsp"%>
    <title>Update Notes</title>
</head>
<body>
<div class="container">
    <%@include file="Navbar.jsp"%>
    <br>
    <H1>Update Your Note Details</H1>
    <br>
    <%
        int nid = Integer.parseInt(request.getParameter("n_id"));
        SessionFactory sessionFactory = new Configuration().configure("Hibernate.cfg.xml").buildSessionFactory();
        Session s = sessionFactory.openSession();

        Notes note = (Notes) s.get(Notes.class,nid);
    %>

    <form action="./Servlet/UpdateServlet" method="post">

        <input type="hidden" name="nid" value="<%= note.getId()%>">

        <div class="form-group">
            <%--@declare id="title"--%><label for="title">Note Title</label>
            <input type="text" class="form-control" id="title" name="title" value="<%= note.getTitle()%>" aria-describedby="emailHelp" placeholder="Enter Notes Title Here" required>
        </div>
        <div class="form-group">
            <%--@declare id="content"--%><label for="content">Note Content</label>
            <textarea id="note_content" name="content" class="form-control" placeholder="Enter Your Content Here" style="height:300px" required><%= note.getContent()%></textarea>
        </div>

        <div class="contanier text-center">
            <button type="submit" class="btn btn-success">Save Note</button>
        </div>
    </form>

</div>
</body>
</html>
