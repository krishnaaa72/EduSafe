package MASTER.SERVLET;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import MASTER.DAO.RegisterDao;
import MASTER.DTO.RegisterDto;

@WebServlet("/RegisterServe")
public class RegisterServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        try {
            String userId = request.getParameter("user_id");
            String studentName = request.getParameter("student_name");
            String fatherName = request.getParameter("father_name");
            String studentPhone = request.getParameter("student_phone");
            String parentPhone = request.getParameter("parent_phone");
            String occupation = request.getParameter("occupation");
            String workingArea = request.getParameter("working_area");
            String homeAddress = request.getParameter("home_address");
            String password = request.getParameter("password"); // Get password from form

            RegisterDto rdto = new RegisterDto();
            rdto.setUserId(userId);
            rdto.setStudentName(studentName);
            rdto.setFatherName(fatherName);
            rdto.setStudentPhone(studentPhone);
            rdto.setParentPhone(parentPhone);
            rdto.setOccupation(occupation);
            rdto.setWorkingArea(workingArea);
            rdto.setHomeAddress(homeAddress);
            rdto.setPassword(password);

            RegisterDao rdao = new RegisterDao();
            boolean success = rdao.registerUser(rdto);

            if(success) {
                response.sendRedirect("Login.jsp?success=1");
            } else {
                response.getWriter().println("<h3>Registration failed. Please try again.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error processing registration: " + e.getMessage() + "</h3>");
        }
    }
}
