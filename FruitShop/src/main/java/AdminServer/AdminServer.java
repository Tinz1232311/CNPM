package AdminServer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Controller.User;
import AdminServer.UserDao;

public class AdminServer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Phương thức xử lý yêu cầu GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách người dùng từ UserDao
        List<User> users = UserDao.getAllUsers();  // Gọi phương thức lấy tất cả người dùng

        // Lưu danh sách người dùng vào request attribute
        request.setAttribute("users", users);

        // Chuyển tiếp dữ liệu đến JSP (admin.jsp)
        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    // Phương thức xử lý yêu cầu POST (để thêm người dùng mới)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Lấy thông tin từ form
            String username = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Kiểm tra các giá trị có hợp lệ không (ví dụ: không rỗng)
            if (username == null || username.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
                request.setAttribute("errorMessage", "All fields are required.");
                request.getRequestDispatcher("/Admin.jsp").forward(request, response);
                return;
            }

            // Tạo đối tượng User mới, không cần ID vì sẽ tự động tăng trong DB
            User newUser = new User(username, email, password);

            // Xác định các vai trò cho người dùng, trong trường hợp này là "employee" và "customer"
            String roles = "employees, customers";  // Vai trò được nối với nhau bằng dấu phẩy

            // Cập nhật lại vai trò của người dùng
            newUser.setRoles(roles);

            // Gọi UserDao để thêm người dùng vào DB
            boolean success = UserDao.addUser(newUser); // Thêm người dùng mới

            if (success) {
                // Lấy danh sách người dùng mới từ cơ sở dữ liệu
                List<User> users = UserDao.getAllUsers();

                // Lưu danh sách người dùng vào request attribute
                request.setAttribute("users", users);

                // Chuyển tiếp dữ liệu đến JSP (admin.jsp)
                response.sendRedirect("AdminServer"); // Dùng sendRedirect để làm mới trang
            } else {
                request.setAttribute("errorMessage", "Failed to add user.");
                request.getRequestDispatcher("/Admin.jsp").forward(request, response);
            }
        }
    }
}
