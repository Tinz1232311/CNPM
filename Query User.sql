USE fruitshop;

-- Tạo bảng users với thêm thuộc tính email, đảm bảo email là duy nhất
CREATE TABLE users
(
    user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE  -- Thêm UNIQUE constraint để email không bị trùng lặp
);

-- Tạo bảng roles
CREATE TABLE roles
(
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(100) NOT NULL
);

-- Tạo bảng user_roles
CREATE TABLE user_roles
(   
    user_id BIGINT,
    role_id INT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
);

-- Thêm các vai trò vào bảng roles
INSERT INTO roles (role_id, role_name) VALUES
(1, 'admin'),
(2, 'employees'),
(3, 'customers');

-- Thêm tài khoản admin đầu tiên (tạo tay)
INSERT INTO users (username, password, email) VALUES 
('admin', '872004@abcxyz...Tinz', 'nguyentin8704@gmail.com');

-- Gán vai trò admin cho tài khoản admin
INSERT INTO user_roles (user_id, role_id)
VALUES (
    (SELECT user_id FROM users WHERE username = 'admin'),
    1 -- ID của vai trò admin
);



