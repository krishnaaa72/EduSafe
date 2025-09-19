package MASTER.Jython;

//File: SafetyServe.java


import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SafetyServe")
public class SafetyServe extends HttpServlet {
 private static final long serialVersionUID = 1L;

 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

     String lat = request.getParameter("lat");
     String lon = request.getParameter("lon");

     response.setContentType("text/html;charset=UTF-8");
     PrintWriter out = response.getWriter();

     out.println("<html><head><title>Safety Result</title></head><body>");
     out.println("<h2>Safety Check Result</h2>");
     out.println("<p>Your Latitude: " + lat + "</p>");
     out.println("<p>Your Longitude: " + lon + "</p>");
     out.println("<p>Checking safety zone... (This is where logic can be added.)</p>");
     out.println("</body></html>");
 }
}
