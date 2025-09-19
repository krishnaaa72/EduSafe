package MASTER.SERVLET;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.JSONObject;

@WebServlet("/earthquake-data")
public class EarthquakeDataServe extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Simulate live data, you can integrate with actual sources here
        double magnitude = 1 + Math.random() * 3; // Random between 1 and 10
        String description;

        if (magnitude <= 3) {
            description = "Micro earthquake, not felt";
        } else if (magnitude <= 4) {
            description = "Minor, rarely causes damage";
        } else if (magnitude <= 5) {
            description = "Light, slight damage possible";
        } else if (magnitude <= 6) {
            description = "Moderate, structural damage likely";
        } else if (magnitude <= 7) {
            description = "Strong, destructive in populated areas";
        } else if (magnitude <= 8) {
            description = "Major, serious damage over large areas";
        } else {
            description = "Great, catastrophic destruction";
        }

        JSONObject json = new JSONObject();
        json.put("magnitude", String.format("%.1f", magnitude));
        json.put("description", description);

        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }
}


