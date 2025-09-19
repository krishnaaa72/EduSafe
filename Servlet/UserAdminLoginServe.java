package MASTER.SERVLET;

import MASTER.DAO.Register_User_AdminDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UserAdminLoginServe")
public class UserAdminLoginServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Retrieve login form parameters
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        // DAO for checking login credentials
        Register_User_AdminDao dao = new Register_User_AdminDao();
        String loginResult = dao.checkUserAdminLoginDetails(uname, pass);

        HttpSession session = request.getSession();

        switch (loginResult) {
            case "success":
                // Store username and teacher name in session
                session.setAttribute("userId", uname);
                String teacherName = dao.getTeacherNameByUserId(uname);
                session.setAttribute("teacherName", teacherName);

                // Redirect to dashboard
                response.sendRedirect("UserAdmin.jsp");
                break;

            case "password_not_match":
                request.setAttribute("error", "Incorrect password.");
                request.getRequestDispatcher("UserAdminLogin.jsp").forward(request, response);
                break;

            case "user_not_found":
                request.setAttribute("error", "User not found.");
                request.getRequestDispatcher("UserAdminLogin.jsp").forward(request, response);
                break;

            default:
                request.setAttribute("error", "Something went wrong. Try again.");
                request.getRequestDispatcher("UserAdminLogin.jsp").forward(request, response);
                break;
        }
    }
}
