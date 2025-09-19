package MASTER.SERVLET;

import MASTER.DAO.Register_User_AdminDao;
import MASTER.DTO.Register_User_AdminDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Register_User_AdminServe")
public class Register_User_AdminServe extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set request encoding
        request.setCharacterEncoding("UTF-8");

        // Retrieve form parameters
        String userId = request.getParameter("user_id");
        String teacherName = request.getParameter("teacher_name");
        String teacherPhone = request.getParameter("teacher_phone");
        String alternativePhone = request.getParameter("alternative_phone");
        String adminType = request.getParameter("admin_type");
        String occupation = request.getParameter("occupation");
        String instituteName = request.getParameter("institute_name");
        String homeAddress = request.getParameter("home_address");
        String password = request.getParameter("password");

        // Create DTO
        Register_User_AdminDto user = new Register_User_AdminDto();
        user.setUserId(userId);
        user.setTeacherName(teacherName);
        user.setTeacherPhone(teacherPhone);
        user.setAlternativePhone(alternativePhone);
        user.setAdminType(adminType);
        user.setOccupation(occupation);
        user.setInstituteName(instituteName);
        user.setHomeAddress(homeAddress);
        user.setPassword(password);

        // DAO object
        Register_User_AdminDao dao = new Register_User_AdminDao();

        // Attempt registration
        boolean success = dao.registerUser(user);

        if (success) {
            // Registration successful
            request.setAttribute("message", "User Admin registered successfully!");
            request.getRequestDispatcher("Register_User_Admin.jsp").forward(request, response);
        } else {
            // Registration failed
            request.setAttribute("error", "Failed to register. Required fields may be missing or user already exists.");
            request.getRequestDispatcher("User_Admin_Register.jsp").forward(request, response);
        }
    }
}
