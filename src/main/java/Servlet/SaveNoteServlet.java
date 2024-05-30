package Servlet;

import Entities.Notes;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/Servlet/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
    public SaveNoteServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Notes notes = new Notes(title, content, new Date());

            SessionFactory sessionFactory = new Configuration().configure("Hibernate.cfg.xml").buildSessionFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            session.save(notes);
            transaction.commit();
            session.close();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<H1 style= 'text-align : center;'> Data Added Successfully </H1>");
            out.println("<h1 style= 'text-align : center;'> <a href='"+request.getContextPath() +"/all_notes.jsp'>View All Notes</a></h1>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}