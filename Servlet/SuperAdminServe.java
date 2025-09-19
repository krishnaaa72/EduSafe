package MASTER.SERVLET;

import MASTER.Utilities.ConnectionUtilities;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SuperAdminServe")
public class SuperAdminServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int totalUsers = 0;
        int totalDrills = 0;
        int totalAdmins = 0;
        int totalRescue = 0; // Example if you have this in another table

        ConnectionUtilities connectionUtilities = new ConnectionUtilities();
        Connection connection = null;

        try {
            connection = connectionUtilities.getConn();

            if (connection == null) {
                System.out.println("Connection is null!");
            } else {
                System.out.println("Connection established!");
            }

            // Count total users from 'register' table
            String sqlUsers = "SELECT COUNT(*) AS totalUsers FROM register";
            System.out.println("Executing query: " + sqlUsers);
            PreparedStatement psUsers = connection.prepareStatement(sqlUsers);
            ResultSet rsUsers = psUsers.executeQuery();
            if (rsUsers.next()) {
                totalUsers = rsUsers.getInt("totalUsers");
                System.out.println("Total users found: " + totalUsers);
            } else {
                System.out.println("No users found.");
            }
            rsUsers.close();
            psUsers.close();

            // Count drills from 'drills' table
            String sqlDrills = "SELECT COUNT(*) AS totalDrills FROM drills";
            System.out.println("Executing query: " + sqlDrills);
            PreparedStatement psDrills = connection.prepareStatement(sqlDrills);
            ResultSet rsDrills = psDrills.executeQuery();
            if (rsDrills.next()) {
                totalDrills = rsDrills.getInt("totalDrills");
                System.out.println("Total drills found: " + totalDrills);
            } else {
                System.out.println("No drills found.");
            }
            rsDrills.close();
            psDrills.close();

            // Count admins from 'user_admin_register'
            String sqlAdmins = "SELECT COUNT(*) AS totalAdmins FROM user_admin_register";
            System.out.println("Executing query: " + sqlAdmins);
            PreparedStatement psAdmins = connection.prepareStatement(sqlAdmins);
            ResultSet rsAdmins = psAdmins.executeQuery();
            if (rsAdmins.next()) {
                totalAdmins = rsAdmins.getInt("totalAdmins");
                System.out.println("Total admins found: " + totalAdmins);
            } else {
                System.out.println("No admins found.");
            }
            rsAdmins.close();
            psAdmins.close();

            // Count rescue missions if applicable (assuming you may have a table for this)
            // If you don't have 'rescue_missions', you can skip this block or change it accordingly
            String sqlRescue = "SELECT COUNT(*) AS totalRescue FROM zones"; // Example fallback
            System.out.println("Executing query: " + sqlRescue);
            PreparedStatement psRescue = connection.prepareStatement(sqlRescue);
            ResultSet rsRescue = psRescue.executeQuery();
            if (rsRescue.next()) {
                totalRescue = rsRescue.getInt("totalRescue");
                System.out.println("Total rescue missions (zones) found: " + totalRescue);
            } else {
                System.out.println("No rescue missions found.");
            }
            rsRescue.close();
            psRescue.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                    System.out.println("Connection closed.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Pass the values to JSP
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalDrills", totalDrills);
        request.setAttribute("totalAdmins", totalAdmins);
        request.setAttribute("totalRescue", totalRescue);

        RequestDispatcher rd = request.getRequestDispatcher("SuperAdmin.jsp");
        rd.forward(request, response);
    }
}
