package Servlet;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import Entities.Notes;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/Servlet/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    public UpdateServlet() {super();}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int noteId = Integer.parseInt(request.getParameter("nid").trim());
            SessionFactory sessionFactory = new Configuration().configure("Hibernate.cfg.xml").buildSessionFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            Notes notes = session.get(Notes.class, noteId);
            notes.setTitle(title);
            notes.setContent(content);
            notes.setAddedDate(new Date());

            transaction.commit();
            session.close();

            
            response.sendRedirect(request.getContextPath()+"/all_notes.jsp");

        }catch(Exception e){e.printStackTrace();}
    }
}
