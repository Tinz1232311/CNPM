package Method;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import LoginServer.DataConnect;

public class UserRoleHelper {

    // Phương thức để lấy vai trò người dùng dựa trên email
    public static String getUserRole(String email) {
        String role = null;
        try (Connection conn = DataConnect.getConnection()) {
            String query = "SELECT r.role_name FROM users u " +
                           "JOIN user_roles ur ON u.user_id = ur.user_id " +
                           "JOIN roles r ON ur.role_id = r.role_id " +
                           "WHERE u.email = ? LIMIT 1";  // Chỉ lấy một vai trò duy nhất
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, email);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    role = rs.getString("role_name");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }
}
