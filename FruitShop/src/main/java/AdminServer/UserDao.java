package AdminServer;

import Controller.User;
import LoginServer.DataConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    // Phương thức lấy danh sách người dùng không bao gồm admin
    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT u.user_id, u.username, u.email, GROUP_CONCAT(r.role_name) AS roles " +
                "FROM users u " +
                "JOIN user_roles ur ON u.user_id = ur.user_id " +
                "JOIN roles r ON ur.role_id = r.role_id " +
                "WHERE r.role_name != 'admin' " +  // Lọc bỏ các người dùng có vai trò admin
                "GROUP BY u.user_id"; 

        try (Connection connection = DataConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                long userId = rs.getLong("user_id");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String roles = rs.getString("roles");  // Các vai trò được nối với nhau bằng dấu phẩy
                // Không lấy mật khẩu trong danh sách người dùng

                // In thông tin chi tiết về người dùng để kiểm tra
                System.out.println("User ID: " + userId + ", Username: " + username + ", Roles: " + roles);

                // Tạo đối tượng User và thêm vào danh sách
                users.add(new User(userId, username, email, roles));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        // In ra số lượng người dùng không bao gồm admin
        System.out.println("Số lượng người dùng (không bao gồm admin): " + users.size());
        return users;
    }

    // Phương thức thêm người dùng mới vào cơ sở dữ liệu
 // Phương thức thêm người dùng mới vào cơ sở dữ liệu
    public static boolean addUser(User user) {
        String insertUserQuery = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
        boolean success = false;
        Connection connection = null;
        PreparedStatement stmtUser = null;
        ResultSet generatedKeys = null;

        try {
            connection = DataConnect.getConnection();
            connection.setAutoCommit(false);  // Bắt đầu giao dịch

            // Thêm người dùng vào bảng users
            stmtUser = connection.prepareStatement(insertUserQuery, Statement.RETURN_GENERATED_KEYS);
            stmtUser.setString(1, user.getUsername());
            stmtUser.setString(2, user.getPassword());
            stmtUser.setString(3, user.getEmail());

            int rowsAffected = stmtUser.executeUpdate();

            if (rowsAffected > 0) {
                generatedKeys = stmtUser.getGeneratedKeys();
                long userId = -1;
                if (generatedKeys.next()) {
                    userId = generatedKeys.getLong(1);  // Lấy user_id vừa tạo

                    // Gán vai trò cho người dùng mới thông qua bảng user_roles
                    String[] roleArray = user.getRoles().split(", ");  // Vai trò được nối với nhau bằng dấu phẩy

                    for (String roleName : roleArray) {
                        String getRoleIdQuery = "SELECT role_id FROM roles WHERE role_name = ?";
                        try (PreparedStatement stmtRoleId = connection.prepareStatement(getRoleIdQuery)) {
                            stmtRoleId.setString(1, roleName);
                            ResultSet rsRole = stmtRoleId.executeQuery();
                            
                            // Kiểm tra xem vai trò có tồn tại không
                            if (rsRole.next()) {
                                long roleId = rsRole.getLong("role_id");

                                // Thêm vai trò vào bảng user_roles
                                String insertUserRoleQuery = "INSERT INTO user_roles (user_id, role_id) VALUES (?, ?)";
                                try (PreparedStatement stmtRole = connection.prepareStatement(insertUserRoleQuery)) {
                                    stmtRole.setLong(1, userId);  // user_id
                                    stmtRole.setLong(2, roleId);  // role_id
                                    stmtRole.executeUpdate();  // Thực hiện thêm vai trò
                                }
                            } else {
                                // Nếu không tìm thấy vai trò, in ra lỗi
                                System.out.println("Vai trò không tồn tại: " + roleName);
                                connection.rollback();  // Rollback giao dịch
                                return false;
                            }
                        }
                    }
                    success = true;  // Nếu mọi thứ đều thành công, trả về true
                }
            }

            // Commit giao dịch nếu tất cả các thao tác đều thành công
            connection.commit();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            try {
                if (connection != null) {
                    connection.rollback();  // Rollback nếu có lỗi
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                if (stmtUser != null) stmtUser.close();
                if (generatedKeys != null) generatedKeys.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

}
