<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="Entities.Notes" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Notes</title>
    <%@include file="all_files_css_js.jsp"%>
</head>
<body>
<div class="container">
    <%@include file="Navbar.jsp"%>

    <h1 class="text-uppercase">All Available Notes</h1>

    <div class="row">
        <div class="col-12">
            <%
                // Initialize Hibernate session factory
                SessionFactory sessionFactory = new Configuration().configure("Hibernate.cfg.xml").buildSessionFactory();
                Session session1 = sessionFactory.openSession();

                // Fetch notes from the database
                Query<Notes> query = session1.createQuery("from Notes", Notes.class);
                List<Notes> notes = query.list();
            %>

            <%-- Display the notes --%>
            <% for (Notes note : notes) { %>

            <div class="card" >
                <img class="card-img-top m-4 mx-auto" src="images/note.png" alt="Card image" style="max-width:100px;">
                <div class="card-body px-5">
                    <h5 class="card-title"><%= note.getTitle() %></h5>
                    <p class="card-content"><%= note.getContent() %></p>
                    <p><b class="text-danger"><%= note.getAddedDate()%></b></p>
                    <div class="container text-center mt-2">
                        <a href="./DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                        <a href="./Edit_Notes.jsp?n_id=<%= note.getId() %>" class="btn btn-success">Update</a>
                    </div>
                </div>
            </div>

            <% } %>
        </div>
    </div>


</div>
</body>
</html>
