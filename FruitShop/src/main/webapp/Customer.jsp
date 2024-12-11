<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fruits Shop</title>
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

        .header .nav-icons {
            display: flex;
            gap: 15px;
        }

        .header .nav-icons i {
            font-size: 18px;
            cursor: pointer;
            color: #555;
        }

        /* Container */
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Bố cục cột linh hoạt */
            gap: 20px; /* Khoảng cách giữa các thẻ */
        }

        .fruit-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 10px;
            transition: transform 0.2s ease, box-shadow 0.3s ease;
        }

        .fruit-card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .fruit-card img {
            width: 100%;
            height: 180px; /* Chiều cao ảnh cố định */
            object-fit: cover; /* Đảm bảo tỷ lệ ảnh đẹp */
            border-radius: 10px;
        }

        .fruit-card h3 {
            margin: 10px 0 5px;
            font-size: 18px;
            color: #333;
        }

        .fruit-card p {
            margin: 0;
            font-size: 16px;
            color: #888;
        }

        /* Footer */
        .footer {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .footer button {
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

        .footer button:hover {
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
        <div class="nav-icons">
            <i class="fas fa-home">Home</i>
            <i class="fas fa-search">Search</i>
            <i class="fas fa-shopping-cart">Cart</i>
        </div>
    </div>

    <!-- Content -->
    <div class="container">
        <div class="grid">
            <!-- Item 1 -->
            <div class="fruit-card">
                <img src="Assets/Mangosteen.jpg" alt="Mangosteen">
                <h3>Mangosteen</h3>
                <p>50,000 VND/kg</p>
            </div>
            <!-- Item 2 -->
            <div class="fruit-card">
                <img src="Assets/Peach.jpg" alt="Peach">
                <h3>Peach</h3>
                <p>52,000 VND/kg</p>
            </div>
            <!-- Item 3 -->
            <div class="fruit-card">
                <img src="Assets/Rambutan.jpg" alt="Rambutan">
                <h3>Rambutan</h3>
                <p>35,000 VND/kg</p>
            </div>
            <!-- Item 4 -->
            <div class="fruit-card">
                <img src="Assets/Avocado.jpg" alt="Avocado">
                <h3>Avocado</h3>
                <p>45,000 VND/kg</p>
            </div>
            <!-- Item 5 -->
            <div class="fruit-card">
                <img src="Assets/Mango.jpg" alt="Mango">
                <h3>Mango</h3>
                <p>26,000 VND/kg</p>
            </div>
            <!-- Item 6 -->
            <div class="fruit-card">
                <img src="Assets/Watermelon.jpg" alt="Ben Tre Watermelon">
                <h3>Ben Tre Watermelon</h3>
                <p>20,000 VND/kg</p>
            </div>
            <!-- Item 7 -->
            <div class="fruit-card">
                <img src="Assets/Durian.jpg" alt="Durian">
                <h3>Durian</h3>
                <p>32,000 VND/kg</p>
            </div>
            <!-- Item 8 -->
            <div class="fruit-card">
                <img src="Assets/Dragonfruit.jpg" alt="Dragonfruit">
                <h3>Dragonfruit</h3>
                <p>27,500 VND/kg</p>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <button>40 More In Update</button>
        </div>
    </div>
</body>
</html>
