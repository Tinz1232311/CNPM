package Controller;

public class User {
    private long userId;
    private String username;
    private String email;
    private String roles; // Thay đổi từ List<String> thành String để hỗ trợ nhiều vai trò dưới dạng chuỗi
    private String password;

    // Constructor
    public User(long userId, String username, String email, String roles, String password) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.roles = roles;  // Khởi tạo các vai trò
        this.password = password;
    }
    
    public User(long userId, String username, String email, String roles) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.roles = roles;  // Khởi tạo các vai trò
    }

    // Constructor cho việc thêm người dùng mới với username, email và password
    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
    }

    // Getters and Setters
    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoles() {
        return roles;  // Trả về chuỗi các vai trò, ví dụ: "admin, user"
    }

    public void setRoles(String roles) {
        this.roles = roles;  // Cập nhật chuỗi vai trò
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User [userId=" + userId + ", username=" + username + ", email=" + email + ", roles=" + roles
                + ", password=" + password + "]";
    }
}
