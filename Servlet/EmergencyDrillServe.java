package MASTER.SERVLET;

import MASTER.DAO.DrillDao;
import MASTER.DTO.DrillDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.stream.Collectors;

@WebServlet("/EmergencyDrillServe")
public class EmergencyDrillServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // handle special characters

        // Fixed drill type as "emergency"
        String drillType = request.getParameter("drillType"); // Should be "emergency"

        // Disaster name selected by user
        String disasterName = request.getParameter("disasterName");

        // Date and time passed from hidden fields
        String drillDate = request.getParameter("drillDate");
        String drillTime = request.getParameter("drillTime");

        // Notes passed from hidden field
        String notes = request.getParameter("notes");

        // Handle batch selection – assuming batch names are sent as checkbox values with name="batches"
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

        // Create DTO
        DrillDto drill = new DrillDto(drillType, drillDate, drillTime, disasterName, fullNotes);

        try {
            DrillDao dao = new DrillDao();
            dao.insertDrill(drill);

            // Save successful — redirect to Emergency_alart.jsp
            response.sendRedirect("Emergency_alart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMsg", "Error occurred while saving the drill.");
            response.sendRedirect("EmergencyDrill.jsp");
        }
    }
}
