package MASTER.DAO;

import MASTER.DTO.Register_Super_AdminDto;
import MASTER.Utilities.ConnectionUtilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;

public class Register_Super_AdminDao {

    public boolean registerSuperAdmin(Register_Super_AdminDto admin) {
        String sql = "INSERT INTO super_admin_register "
                + "(user_id, name, mobile_no, alternative_phone, occupation, organization_name, designation, password, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        ConnectionUtilities connectionUtilities = new ConnectionUtilities();
        Connection connection = connectionUtilities.getConn();

        if (connection == null) {
            System.out.println("Connection is null!");
            return false;
        }

        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, admin.getUserId());
            statement.setString(2, admin.getName());
            statement.setString(3, admin.getMobileNo());
            statement.setString(4, admin.getAlternativePhone());
            statement.setString(5, admin.getOccupation());
            statement.setString(6, admin.getOrganizationName());
            statement.setString(7, admin.getDesignation());

            // Hash the password using SHA-256
            String hashedPassword = hashPassword(admin.getPassword());
            statement.setString(8, hashedPassword);

            // Set the timestamp for created_at
            statement.setTimestamp(9, new Timestamp(System.currentTimeMillis()));

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes());

        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if(hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }

    // ✅ NEW METHOD TO FETCH SUPER ADMIN NAME BY USER ID
    public String getSuperAdminNameByUserId(String userId) {
        String name = "";
        String sql = "SELECT name FROM super_admin_register WHERE user_id=?";
        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return name;
    }
}