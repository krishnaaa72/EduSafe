package MASTER.SERVLET;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ImSafeServe")
public class ImSafeServe extends HttpServlet {

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/disastermanagementapp";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "Rayet@797";

    // Fast2SMS API Key
    private static final String API_KEY = "nkQZ7q9gCw8h3ioa4IBbcYFzLjvEu5G1XP2W0OmArlfVdtxMKNWzqiCJVeDksgHujb6vTOoM95IXcZxn";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // Get logged-in user_id from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            out.print("User not logged in ❌");
            return;
        }

        String userId = (String) session.getAttribute("user_id");

        try {
            // Fetch student name and parent phone from database
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String sql = "SELECT student_name, parent_phone FROM register WHERE user_id=?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, userId);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        String studentName = rs.getString("student_name");
                        String parentPhone = rs.getString("parent_phone");

                        // Prepare SMS content
                        String message = URLEncoder.encode(studentName + " is safe!", "UTF-8");

                        // Fast2SMS URL
                        String urlStr = "https://www.fast2sms.com/dev/bulkV2?authorization=" + API_KEY +
                                        "&sender_id=FSTSMS&message=" + message +
                                        "&language=english&route=q&numbers=" + parentPhone;

                        URL url = new URL(urlStr);
                        HttpURLConnection connSms = (HttpURLConnection) url.openConnection();
                        connSms.setRequestMethod("GET");
                        connSms.setDoOutput(true);

                        int respCode = connSms.getResponseCode();
                        if (respCode == 200) {
                            out.print("Parent notified! ✅");
                        } else {
                            out.print("Failed to send SMS ❌ Response code: " + respCode);
                        }

                    } else {
                        out.print("Student info not found ❌");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("Failed to send SMS ❌ " + e.getMessage());
        }
    }
}
