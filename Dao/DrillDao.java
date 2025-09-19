package MASTER.DAO;

import MASTER.DTO.DrillDto;
import MASTER.Utilities.ConnectionUtilities;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DrillDao {

    // Insert a new drill record
	public boolean insertDrill(DrillDto drill) {
	    String sql = "INSERT INTO drills (drill_type, drill_date, drill_time, disaster_name, notes) VALUES (?, ?, ?, ?, ?)";
	    try (Connection con = new ConnectionUtilities().getConn();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, drill.getDrillType());
	        ps.setDate(2, Date.valueOf(drill.getDrillDate())); // Convert String to Date

	        // Handle drill time string, ensure format HH:mm:ss
	        String timeStr = drill.getDrillTime();
	        if (timeStr.length() == 5) { // "HH:mm"
	            timeStr += ":00";
	        }
	        ps.setTime(3, Time.valueOf(timeStr)); // Convert to Time

	        ps.setString(4, drill.getDisasterName());
	        ps.setString(5, drill.getNotes());

	        return ps.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
    // Retrieve all drills ordered by date and time
    public List<DrillDto> getAllDrills() {
        List<DrillDto> list = new ArrayList<>();
        String sql = "SELECT * FROM drills ORDER BY drill_date DESC, drill_time DESC";

        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                DrillDto drill = new DrillDto();
                drill.setId(rs.getInt("id"));
                drill.setDrillType(rs.getString("drill_type"));
                drill.setDrillDate(rs.getDate("drill_date").toString()); // Convert Date to String
                drill.setDrillTime(rs.getTime("drill_time").toString()); // Convert Time to String
                drill.setDisasterName(rs.getString("disaster_name"));
                drill.setNotes(rs.getString("notes"));
                drill.setCreatedAt(rs.getTimestamp("created_at").toString()); // Convert Timestamp to String
                list.add(drill);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
