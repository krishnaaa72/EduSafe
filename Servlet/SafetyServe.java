package MASTER.SERVLET;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SafetyServe")
public class SafetyServe extends HttpServlet {

    private Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/disastermanagementapp";
        String user = "root";
        String pass = "Rayet@797";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);
    }

    private double getDistance(double lat1, double lon1, double lat2, double lon2) {
        final int R = 6371;
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                   Math.sin(dLon/2) * Math.sin(dLon/2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        return R * c;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String latParam = req.getParameter("lat");
        String lonParam = req.getParameter("lon");

        if (latParam == null || lonParam == null || latParam.isEmpty() || lonParam.isEmpty()) {
            showLocationNotFound(resp);
            return;
        }

        try {
            double userLat = Double.parseDouble(latParam);
            double userLon = Double.parseDouble(lonParam);

            try (Connection conn = getConnection()) {
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM zones WHERE type='green'");
                ResultSet rs = ps.executeQuery();

                double nearestDist = Double.MAX_VALUE;
                String nearestName = null;
                double nearestLat = 0, nearestLon = 0;

                while (rs.next()) {
                    double gLat = rs.getDouble("lat");
                    double gLon = rs.getDouble("lon");
                    String gName = rs.getString("name");

                    double dist = getDistance(userLat, userLon, gLat, gLon);

                    if (dist < nearestDist) {
                        nearestDist = dist;
                        nearestName = gName;
                        nearestLat = gLat;
                        nearestLon = gLon;
                    }
                }

                if (nearestName == null) {
                    showLocationNotFound(resp);
                } else if (nearestDist < 0.5) {
                    resp.getWriter().println("<h2>✅ You are already SAFE in Green Zone!</h2>");
                } else {
                    String googleMapsUrl = "https://www.google.com/maps/dir/" +
                            userLat + "," + userLon + "/" +
                            nearestLat + "," + nearestLon;

                    resp.getWriter().println("<h2>🚨 You are in RED ZONE!</h2>");
                    resp.getWriter().println("<p>Nearest Safe Zone: " + nearestName + " (" + String.format("%.2f", nearestDist) + " km)</p>");
                    resp.getWriter().println("<a href='" + googleMapsUrl + "' target='_blank'>View Route to Safe Zone</a>");
                }

            } catch (SQLException sqlEx) {
                // Handle missing table exception specifically
                if (sqlEx.getMessage().contains("doesn't exist")) {
                    showTableNotFound(resp);
                } else {
                    sqlEx.printStackTrace();
                    resp.getWriter().println("<h2>Database Error!</h2>");
                    resp.getWriter().println("<pre>" + sqlEx.getMessage() + "</pre>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                resp.getWriter().println("<h2>Unexpected Error!</h2>");
                resp.getWriter().println("<pre>" + e.getMessage() + "</pre>");
            }

        } catch (NumberFormatException e) {
            showLocationNotFound(resp);
        }
    }

    private void showLocationNotFound(HttpServletResponse resp) throws IOException {
        double defaultLat = 0.0;
        double defaultLon = 0.0;
        String googleMapsUrl = "https://www.google.com/maps/@"+ defaultLat + "," + defaultLon + ",4z";

        resp.getWriter().println("<h2>❌ Location Not Found!</h2>");
        resp.getWriter().println("<p>Please provide a valid location.</p>");
        resp.getWriter().println("<a href='" + googleMapsUrl + "' target='_blank'>View Map</a>");
    }

    private void showTableNotFound(HttpServletResponse resp) throws IOException {
        double defaultLat = 0.0;
        double defaultLon = 0.0;
        String googleMapsUrl = "https://www.google.com/maps/@"+ defaultLat + "," + defaultLon + ",4z";

        resp.getWriter().println("<h2>⚠ Database Table Not Found!</h2>");
        resp.getWriter().println("<p>The 'zones' table does not exist in the database.</p>");
        resp.getWriter().println("<a href='" + googleMapsUrl + "' target='_blank'>View Map</a>");
    }
}