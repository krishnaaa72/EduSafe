package MASTER.DAO;

import MASTER.DTO.RegisterDto;
import MASTER.Utilities.ConnectionUtilities;

import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

public class RegisterDao {

    // ✅ Register a new user
    public boolean registerUser(RegisterDto user) {
        String sql = "INSERT INTO register (user_id, student_name, father_name, student_phone, parent_phone, occupation, working_area, home_address, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getUserId());
            ps.setString(2, user.getStudentName());
            ps.setString(3, user.getFatherName());
            ps.setString(4, user.getStudentPhone());
            ps.setString(5, user.getParentPhone());
            ps.setString(6, user.getOccupation());
            ps.setString(7, user.getWorkingArea());
            ps.setString(8, user.getHomeAddress());
            ps.setString(9, hashPassword(user.getPassword()));

            return ps.executeUpdate() > 0;
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Hash password using SHA-256
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }

    // ✅ Login checks
    public boolean checkSuperAdminLogin(String userId, String password) {
        return checkLogin(userId, password, "SELECT password FROM super_admin_register WHERE user_id = ?");
    }

    public boolean checkUserAdminLogin(String userId, String password) {
        return checkLogin(userId, password, "SELECT password FROM user_admin_register WHERE user_id = ?");
    }

    public boolean checkUserLogin(String userId, String password) {
        return checkLogin(userId, password, "SELECT password FROM register WHERE user_id = ?");
    }

    private boolean checkLogin(String userId, String password, String sql) {
        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String stored = rs.getString("password");
                return stored.equals(hashPassword(password));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Get Super Admin name
    public String getSuperAdminNameByUserId(String userId) {
        String sql = "SELECT name FROM super_admin_register WHERE user_id = ?";
        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getString("name");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    // ✅ Get User Admin teacher name
    public String getTeacherNameByUserId(String userId) {
        String sql = "SELECT teacher_name FROM user_admin_register WHERE user_id = ?";
        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getString("teacher_name");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    // ✅ User Admin login with status
    public String checkUserAdminLoginDetails(String uname, String pass) {
        String sql = "SELECT password FROM user_admin_register WHERE user_id = ?";
        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) return "user_not_found";

            String stored = rs.getString("password");
            return stored.equals(hashPassword(pass)) ? "success" : "password_not_match";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    // ✅ Get all students
    public List<RegisterDto> getAllStudents() {
        List<RegisterDto> students = new ArrayList<>();
        String sql = "SELECT id, student_name FROM register WHERE role='user' ORDER BY id";
        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                RegisterDto student = new RegisterDto();
                student.setUserId(String.valueOf(rs.getInt("id")));
                student.setStudentName(rs.getString("student_name"));
                students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    // ✅ Get student by login
    public RegisterDto getStudentByLogin(String userId, String password) {
        String sql = "SELECT * FROM register WHERE user_id = ?";
        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getString("password").equals(hashPassword(password))) {
                RegisterDto student = new RegisterDto();
                student.setUserId(rs.getString("user_id"));
                student.setStudentName(rs.getString("student_name"));
                student.setFatherName(rs.getString("father_name"));
                student.setStudentPhone(rs.getString("student_phone"));
                student.setParentPhone(rs.getString("parent_phone"));
                student.setOccupation(rs.getString("occupation"));
                student.setWorkingArea(rs.getString("working_area"));
                student.setHomeAddress(rs.getString("home_address"));
                student.setRole(rs.getString("role"));
                return student;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // ✅ Get total users
    public int getTotalUsers() {
        String sql = "SELECT COUNT(*) FROM register WHERE role='user'";
        try (Connection con = new ConnectionUtilities().getConn();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
