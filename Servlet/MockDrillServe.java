package MASTER.SERVLET;

import MASTER.DAO.DrillDao;
import MASTER.DTO.DrillDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.stream.Collectors;

@WebServlet("/MockDrillServe")
public class MockDrillServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // handle special characters

        // Drill type is fixed for this servlet (mock drill)
        String drillType = "mock";

        // Get parameters from request
        String disasterName = request.getParameter("disasterName");
        String drillDate = request.getParameter("drillDate"); // expected format "yyyy-MM-dd"
        String drillTime = request.getParameter("drillTime"); // expected format "HH:mm:ss"
        String duration = request.getParameter("duration");
        String notes = request.getParameter("notes");

        // Handle batch selection – assuming batch names are sent as checkboxes with name="batches"
        String[] selectedBatches = request.getParameterValues("batches");
        String batchInfo = "";
        if (selectedBatches != null && selectedBatches.length > 0) {
            batchInfo = "Batches: " + Arrays.stream(selectedBatches).collect(Collectors.joining(", "));
        }

        // Combine notes and batch info
        String fullNotes = notes == null ? "" : notes.trim();
        if (!batchInfo.isEmpty()) {
            fullNotes += "\n" + batchInfo;
        }

        // Create DrillDto object using String fields for date and time
        DrillDto drill = new DrillDto(drillType, drillDate, drillTime, disasterName, fullNotes);

        try {
            DrillDao dao = new DrillDao();
            boolean inserted = dao.insertDrill(drill);

            HttpSession session = request.getSession();
            if (inserted) {
                session.setAttribute("successMsg", "Mock drill created successfully!");
            } else {
                session.setAttribute("errorMsg", "Failed to create mock drill.");
            }
            response.sendRedirect("MockDrill.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMsg", "An error occurred while saving the drill.");
            response.sendRedirect("MockDrill.jsp");
        }
    }
}
