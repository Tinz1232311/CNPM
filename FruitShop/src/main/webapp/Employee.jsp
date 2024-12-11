<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom right, #FFDAB9, #FFB6C1);
            margin: 0;
            padding: 0;
        }

        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #FFF;
            border-bottom: 1px solid #ccc;
        }

        /* Logo container */
        .logo-container {
            display: flex;
            align-items: center;
            gap: 10px; /* Khoảng cách giữa ảnh và chữ */
        }

        /* Logo image styling */
        .logo-image {
            width: 50px; /* Kích thước hình tròn */
            height: 50px;
            border-radius: 50%; /* Tạo hình tròn */
            overflow: hidden; /* Đảm bảo nội dung bên trong không tràn ra ngoài */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo-image img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Đảm bảo ảnh không bị méo */
        }

        .logo-text {
            font-size: 24px;
            font-weight: 300; /* Giảm độ dày để thanh nhẹ hơn */
            font-family: "Poppins", sans-serif; /* Thay đổi font chữ */
            background: linear-gradient(90deg, #ff7eb3 0%, #ffcd56 100%); /* Gradient hồng - vàng */
            -webkit-background-clip: text; /* Chỉ áp dụng gradient lên phần chữ */
            -webkit-text-fill-color: transparent; /* Ẩn màu mặc định của chữ */
        }

        /* Menu */
        .menu {
            display: flex;
            justify-content: space-around;
            background-color: #FFF;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .menu a {
            font-size: 18px;
            color: #555;
            text-decoration: none;
            padding: 10px;
        }

        .menu a:hover {
            background-color: #f0f0f0;
            border-radius: 5px;
        }

        /* Content */
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        .section {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        .section h2 {
            margin-bottom: 15px;
            font-size: 20px;
            color: #333;
        }

        .section button {
            background: linear-gradient(90deg, #ff7eb3 0%, #ffcd56 100%);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: #FFF;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .section button:hover {
            background: linear-gradient(90deg, #ffcd56 0%, #ff7eb3 100%);
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo-container">
            <div class="logo-image">
                <img src="Assets/logoweb.png" alt="Logo">
            </div>
            <div class="logo-text">FRUITS SHOP</div>
        </div>
    </div>

    <!-- Menu -->
    <div class="menu">
        <a href="orders.jsp">Orders</a>
        <a href="attendance.jsp">Attendance</a>
        <a href="Customer.jsp">Change Account Status</a>
    </div>

    <!-- Content -->
    <div class="container">
        <!-- Orders Section -->
        <div class="section">
            <h2>Manage Orders</h2>
            <p>View and manage customer orders.</p>
            <button onclick="window.location.href='orders.jsp'">View Orders</button>
        </div>

        <!-- Attendance Section -->
        <div class="section">
            <h2>Attendance</h2>
            <p>Check and update your attendance status.</p>
            <button onclick="window.location.href='attendance.jsp'">Mark Attendance</button>
        </div>

        <!-- Change Account Status Section -->
        <div class="section">
            <h2>Change Account Status</h2>
            <p>Change the status of your account (e.g., from Customer to Employee).</p>
            <button onclick="window.location.href='Customer.jsp'">Change Status</button>
        </div>
    </div>
</body>
</html>
