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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    public DeleteServlet() {super();}

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            int nid = Integer.parseInt(request.getParameter("note_id"));

            SessionFactory sessionFactory = new Configuration().configure("Hibernate.cfg.xml").buildSessionFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            Notes note = session.get(Notes.class, nid);
            if (note != null) {
                session.delete(note);
                transaction.commit();
            } else {
                // Note not found, handle appropriately
                response.getWriter().println("Note not found with ID: " + nid);
            }

            session.close();
            response.sendRedirect("all_notes.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
