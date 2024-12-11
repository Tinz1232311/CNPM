package LoginServer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

// Import các lớp cần thiết từ Method
import Method.EmailSender;
import Method.OTPUtils;
import Method.UserRoleHelper;

public class VerifyOTP extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public VerifyOTP() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("Verify".equals(action)) {
            String userOTP = request.getParameter("otp");
            HttpSession session = request.getSession();

            // Kiểm tra tính hợp lệ của OTP thông qua lớp OTPVerifier
            if (OTPUtils.isValidOTP(session, userOTP)) {
                // Nếu OTP đúng, lấy email từ session
                String email = (String) session.getAttribute("email");

                if (email != null) {
                    // Kiểm tra vai trò của người dùng
                    String role = UserRoleHelper.getUserRole(email);

                    // Dựa trên vai trò, chuyển hướng đến trang tương ứng
                    if ("admin".equals(role)) {
                        response.sendRedirect("AdminServer");
                    } else if ("employees".equals(role)) {
                        response.sendRedirect("Employee.jsp");
                    } else if ("customers".equals(role)) {
                        response.sendRedirect("Customer.jsp");
                    } else {
                        // Nếu không có vai trò hợp lệ, chuyển đến trang lỗi
                        request.setAttribute("error", "Role not found.");
                        getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("error", "Email not found in session.");
                    getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Wrong OTP. Please try again.");
                getServletContext().getRequestDispatcher("/LoginOTP.jsp").forward(request, response);
            }
        } else if ("Resend OTP".equals(action)) {
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");

            if (email != null) {
                // Tạo OTP mới và gửi lại email
                String newOTP = OTPUtils.generateOTP();
                session.setAttribute("otp", newOTP);
                boolean otpSent = EmailSender.sendEmail(email, "Your New OTP Code", "Your new OTP code is: " + newOTP);

                if (otpSent) {
                    request.setAttribute("message", "A new OTP has been sent to your email.");
                    getServletContext().getRequestDispatcher("/LoginOTP.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Failed to resend OTP. Please try again.");
                    getServletContext().getRequestDispatcher("/LoginOTP.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "No email found in session. Please log in first.");
                getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
            }
        }
    }
}
