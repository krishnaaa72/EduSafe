package MASTER.SERVLET;

import MASTER.DTO.RegisterDto;
import MASTER.DTO.Register_User_AdminDto;
import MASTER.DAO.RegisterDao;
import MASTER.DAO.Register_User_AdminDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/AssignmentServe")
public class AssignmentServe extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RegisterDao studentDao = new RegisterDao();
        Register_User_AdminDao teacherDao = new Register_User_AdminDao();

        List<RegisterDto> students = studentDao.getAllStudents();
        List<Register_User_AdminDto> teachers = teacherDao.getAllTeachers();

        Map<Register_User_AdminDto, List<RegisterDto>> assignment = new LinkedHashMap<>();
        int count = 0;
        for (Register_User_AdminDto teacher : teachers) {
            List<RegisterDto> assigned = new ArrayList<>();
            for (int i = 0; i < 10 && count < students.size(); i++) {
                assigned.add(students.get(count));
                count++;
            }
            assignment.put(teacher, assigned);
        }

        request.setAttribute("assignment", assignment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Assignment.jsp");
        dispatcher.forward(request, response);
    }
}
