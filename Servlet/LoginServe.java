package MASTER.SERVLET;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import MASTER.DAO.RegisterDao;
import MASTER.DTO.RegisterDto; // Use DTO instead of separate Student model

@WebServlet("/LoginServe")
public class LoginServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        RegisterDao rdao = new RegisterDao();
        HttpSession session = request.getSession();

        // Check login and get RegisterDto object if valid
        RegisterDto student = rdao.getStudentByLogin(uname, pass);

        if (student != null) {
            // Store student info in session
            session.setAttribute("studentName", student.getStudentName());
            session.setAttribute("userId", student.getUserId());
            session.setAttribute("errorMsg", null); // clear previous errors

            response.sendRedirect("User.jsp"); // redirect to student dashboard
        } else {
            session.setAttribute("errorMsg", "Invalid user credentials");
            response.sendRedirect("Login.jsp"); // redirect back to login page
        }
    }
}
