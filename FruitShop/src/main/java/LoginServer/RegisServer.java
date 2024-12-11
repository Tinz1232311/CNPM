package LoginServer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import LoginServer.DataConnect;

/**
 * Servlet implementation class RegisServer
 */
public class RegisServer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisServer() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String regusername = request.getParameter("username");
        String reguserpass = request.getParameter("password");
        String regemail = request.getParameter("email");

        try {
            if (registerUserWithRole(regusername, reguserpass, regemail)) {
                response.getWriter().append("Account registered successfully!");
            } else {
                response.getWriter().append("Failed to register account.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            response.getWriter().append("Database error: ").append(e.getMessage());
        }
        getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
    }

    private boolean registerUserWithRole(String username, String password, String email) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement userStmt = null;
        PreparedStatement roleStmt = null;

        try {
            conn = DataConnect.getConnection();
            conn.setAutoCommit(false); // Bắt đầu giao dịch

            // Chèn dữ liệu vào bảng users
            String insertUserSQL = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
            userStmt = conn.prepareStatement(insertUserSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            userStmt.setString(1, username);
            userStmt.setString(2, password);
            userStmt.setString(3, email);

            int affectedRows = userStmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            // Lấy user_id vừa được tạo
            try (var generatedKeys = userStmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    long userId = generatedKeys.getLong(1);

                    // Gán vai trò 'customers' cho user mới
                    String insertRoleSQL = "INSERT INTO user_roles (user_id, role_id) VALUES (?, ?)";
                    roleStmt = conn.prepareStatement(insertRoleSQL);
                    roleStmt.setLong(1, userId);
                    roleStmt.setInt(2, 3); // ID của vai trò 'customers'

                    roleStmt.executeUpdate();
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }

            conn.commit(); // Xác nhận giao dịch
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                conn.rollback(); // Hoàn tác nếu có lỗi
            }
            throw e;
        } finally {
            if (userStmt != null) userStmt.close();
            if (roleStmt != null) roleStmt.close();
            if (conn != null) DataConnect.closeConnection(conn);
        }
    }
}
