package MASTER.SERVLET;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import MASTER.DAO.RegisterDao;

@WebServlet("/SuparAdminLoginServe")
public class SuparAdminLoginServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        HttpSession session = request.getSession();

        if (uname == null || pass == null || uname.trim().isEmpty() || pass.trim().isEmpty()) {
            session.setAttribute("errorMsg", "Username or password cannot be empty");
            response.sendRedirect("Login.jsp");
            return;
        }

        if (!uname.endsWith(".Sadmin")) {
            session.setAttribute("errorMsg", "Access denied for non-super admins");
            response.sendRedirect("Login.jsp");
            return;
        }

        RegisterDao rdao = new RegisterDao();
        boolean valid = rdao.checkSuperAdminLogin(uname, pass);

        if (valid) {
            session.setAttribute("uname", uname);
            String superAdminName = rdao.getSuperAdminNameByUserId(uname);
            session.setAttribute("superAdminName", superAdminName);
            session.setAttribute("errorMsg", null);
            response.sendRedirect("SuperAdmin.jsp");
        } else {
            session.setAttribute("errorMsg", "Invalid super admin credentials");
            response.sendRedirect("Login.jsp");
        }
    }
}
