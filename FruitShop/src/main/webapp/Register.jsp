<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        .page {
            width: 100%;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        .background-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4); /* Lớp phủ tối */
            z-index: 0;
        }
        .login-frame {
            width: 20%;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            gap: 15px;
            align-items: center;
            z-index: 1;
        }
        img {
            width: 60px;
            height: auto;
            margin-bottom: 2px;
        }
        .login-frame h2 {
            color: white;
            margin-bottom: 2px;
        }
        .input-group {
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        .input-group label {
            margin-bottom: 2px;
            color: #333;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-size: 14px;
        }
        .input-group input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            width: 100%;
        }
        .button-group {
            display: flex;
            justify-content: center;  /* Căn giữa nút submit */
            width: 100%;
            margin-top: 10px;
        }
        .button-group input[type="submit"] {
            width: 48%;
            padding: 10px;
            background: linear-gradient(to right, #ff7eb3, #ff758c); /* Gradient hồng cam */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .button-group input[type="submit"]:hover {
            background: linear-gradient(to right, #ff5473, #ff758c); /* Gradient đậm hơn khi hover */
            transform: scale(1.05); /* Phóng to nhẹ */
        }
        .background-clip {
            position: absolute;
            right: 0;
            bottom: 0;
            z-index: -1;
        }
        @media (min-aspect-ratio: 16/9) {
            .background-clip {
                width: 100%;
                height: auto;
            }
        }
        @media (max-aspect-ratio: 16/9) {
            .background-clip {
                width: auto;
                height: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="page">
        <!-- Thêm thẻ form vào đây -->
        <form action="/FruitShop/RegisServer" method="post" class="login-frame">
            <h2>Register</h2>
            <img src="Assets/logoweb.png" alt="Logo">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email address" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="button-group">
                <input type="submit" value="Submit" name="Submit">
            </div>
        </form>
        <video autoplay loop muted plays-inline class="background-clip">
            <source src="Assets/background-clip.mp4" type="video/mp4">
        </video>
        <!-- Thêm overlay vào -->
        <div class="background-overlay"></div>
    </div>
</body>
</html>
