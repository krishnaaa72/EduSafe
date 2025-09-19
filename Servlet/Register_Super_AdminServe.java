package MASTER.SERVLET;

import MASTER.DTO.Register_Super_AdminDto;
import MASTER.DAO.Register_Super_AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Register_Super_AdminServe")
public class Register_Super_AdminServe extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        Register_Super_AdminDto admin = new Register_Super_AdminDto();
        admin.setUserId(request.getParameter("user_id")); // already has .Sadmin from JS
        admin.setName(request.getParameter("name"));
        admin.setMobileNo(request.getParameter("mobile_no"));
        admin.setAlternativePhone(request.getParameter("alternative_phone"));
        admin.setDesignation(request.getParameter("designation"));
        admin.setOrganizationName(request.getParameter("organization_name"));
        admin.setOccupation(request.getParameter("occupation"));
        admin.setPassword(request.getParameter("password"));

        Register_Super_AdminDao dao = new Register_Super_AdminDao();
        boolean success = dao.registerSuperAdmin(admin);

        if (success) {
            response.sendRedirect("Login.jsp?msg=registered"); // redirect to login page
        } else {
            response.sendRedirect("SuperAdminRegister.jsp?msg=error"); // redirect back with error
        }
    }
}
