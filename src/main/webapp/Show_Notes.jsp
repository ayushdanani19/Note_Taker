<%@ page import="Entities.Notes" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>

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

<div class="note">
    <h2><%= note.getTitle() %></h2>
    <p><%= note.getContent() %></p>
    <small><%= note.getAddedDate().toString() %></small>
</div>
<% } %>

<%
    session1.close();
%>
