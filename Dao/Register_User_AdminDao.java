package MASTER.DAO;

import MASTER.DTO.Register_User_AdminDto;
import MASTER.Utilities.ConnectionUtilities;
import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

public class Register_User_AdminDao {

    // ================= Register User Admin =================
    public boolean registerUser(Register_User_AdminDto user) {
        if (user.getUserId() == null || user.getUserId().isEmpty() ||
            user.getTeacherName() == null || user.getTeacherName().isEmpty() ||
            user.getAdminType() == null || user.getAdminType().isEmpty() ||
            user.getPassword() == null || user.getPassword().isEmpty()) {
            System.out.println("Required fields are missing!");
            return false;
        }

        String sql = "INSERT INTO user_admin_register "
                   + "(user_id, teacher_name, teacher_phone, alternative_phone, admin_type, occupation, institute_name, home_address, password, created_at) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = new ConnectionUtilities().getConn();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, user.getUserId());
            ps.setString(2, user.getTeacherName());
            ps.setString(3, user.getTeacherPhone());
            ps.setString(4, user.getAlternativePhone());
            ps.setString(5, user.getAdminType());
            ps.setString(6, user.getOccupation());
            ps.setString(7, user.getInstituteName());
            ps.setString(8, user.getHomeAddress());
            ps.setString(9, hashPassword(user.getPassword()));
            ps.setTimestamp(10, new Timestamp(System.currentTimeMillis()));

            return ps.executeUpdate() > 0;

        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ================= Get All Teachers =================
    public List<Register_User_AdminDto> getAllTeachers() {
        List<Register_User_AdminDto> list = new ArrayList<>();
        String sql = "SELECT id, teacher_name FROM user_admin_register ORDER BY id";

        try (Connection connection = new ConnectionUtilities().getConn();
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Register_User_AdminDto dto = new Register_User_AdminDto();
                dto.setId(rs.getInt("id"));
                dto.setTeacherName(rs.getString("teacher_name")); // removed trim
                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= Check Login =================
    public String checkUserAdminLoginDetails(String userId, String password) {
        String sql = "SELECT password FROM user_admin_register WHERE user_id = ?";

        try (Connection connection = new ConnectionUtilities().getConn();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return "user_not_found";

                String storedPassword = rs.getString("password"); // removed trim
                return storedPassword.equals(hashPassword(password)) ? "success" : "password_not_match";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    // ================= Get Teacher Name By User ID =================
    public String getTeacherNameByUserId(String userId) {
        String name = "";
        String sql = "SELECT teacher_name FROM user_admin_register WHERE user_id = ?";

        try (Connection connection = new ConnectionUtilities().getConn();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) name = rs.getString("teacher_name"); // removed trim
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return name;
    }

    // ================= Hash Password =================
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes());
        StringBuilder sb = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) sb.append('0');
            sb.append(hex);
        }
        return sb.toString();
    }
}
