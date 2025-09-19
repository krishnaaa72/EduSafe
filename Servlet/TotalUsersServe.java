package MASTER.SERVLET;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MASTER.DAO.RegisterDao;

/**
 * Servlet implementation class TotalUsersServe
 */
@WebServlet("/TotalUsersServe")
public class TotalUsersServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        RegisterDao rdao = new RegisterDao();
        int totalUsers = rdao.getTotalUsers();

        response.setContentType("application/json");
        response.getWriter().write("{\"totalUsers\":" + totalUsers + "}");
    }
}
