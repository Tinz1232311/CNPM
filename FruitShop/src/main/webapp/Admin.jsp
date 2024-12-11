<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="Controller.User" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Fruits Shop</title>
    <style>
        /* Định dạng cho toàn bộ trang */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom right, #FFDAB9, #FFB6C1);
        }
        
        /* Định dạng cho phần header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #FFF;
            border-bottom: 1px solid #ccc;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo-image img {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .logo-text {
            font-size: 24px;
            font-weight: 300;
            font-family: "Poppins", sans-serif;
            background: linear-gradient(90deg, #ff7eb3 0%, #ffcd56 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .nav-icons i {
            color: white;
            font-size: 20px;
            margin-left: 20px;
            cursor: pointer;
        }
        
        /* Phần container chính */
        .container {
            padding: 20px;
        }
        
        /* Phần quản lý người dùng */
        .crud-section {
            background-color: #FFF;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .crud-section h2 {
            margin-top: 0;
            color: #333;
        }

        .crud-section form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .crud-section form input {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            width: 80%;
        }

        .crud-section form button {
            padding: 8px 20px; /* Làm nút nhỏ hơn */
            background-color: #ff7eb3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold; /* Tăng độ dày font chữ */
        }

        .crud-section form button:hover {
            background-color: #ffcd56;
        }
        
        /* Phần danh sách người dùng */
        .user-list {
            background-color: #FFF;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .user-list h2 {
            margin-top: 0;
            color: #333;
        }

        .user-list table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .user-list table th, .user-list table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .user-list table th {
            background-color: #ff7eb3;
            color: white;
        }

        .user-list table td {
            background-color: #fff;
        }

        .user-list table tr:hover {
            background-color: #f2f2f2;
        }

        .user-list table a {
            text-decoration: none;
            color: #ff7eb3;
            margin-right: 10px;
            font-weight: bold; /* Tăng độ dày font chữ */
        }

        .user-list table a:hover {
            color: #ffcd56;
        }

        /* Phần thông báo lỗi */
        .error-message {
            background-color: #ffdddd;
            color: #d8000c;
            padding: 10px;
            border: 1px solid #d8000c;
            margin-bottom: 20px;
            border-radius: 4px;
            text-align: center;
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
            <div class="logo-text">FRUITS SHOP - Admin</div>
        </div>
        <div class="nav-icons">
            <i class="fas fa-home">Home</i>
            <i class="fas fa-sign-out-alt">Logout</i>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <!-- CRUD Section: Add/Edit/Delete Users -->
        <div class="crud-section">
            <h2>Manage Users</h2>

            <!-- Error or success message -->
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <div class="error-message"><%= errorMessage %></div>
            <% } %>

            <form action="AdminServer" method="POST">
                <input type="text" name="email" placeholder="Email" required>
                <input type="text" name="name" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit" name="action" value="add">Add User</button>
            </form>
        </div>

        <!-- User List Section: Display all users including ID, Email, Full Name, Password, and Role -->
        <div class="user-list">
            <h2>All Users</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<User> users = (List<User>) request.getAttribute("users");
                        for (User user : users) {
                    %>
                        <tr>
                            <td><%= user.getUserId() %></td>
                            <td><%= user.getUsername() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getRoles() %></td>
                            <td>
                                <!-- Edit/Delete buttons -->
                                <a href="AdminServer?action=edit&id=<%= user.getUserId() %>">Edit</a>
                                <a href="AdminServer?action=delete&id=<%= user.getUserId() %>">Delete</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
