<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <style>
	    body {
	        font-family: Arial, sans-serif;
	        margin: 0;
	        padding: 0;
	        background-color: #f4f4f4;
	    }
	    .container {
	        width: 300px;
	        padding: 20px;
	        background-color: white;
	        margin: 100px auto;
	        border-radius: 10px;
	        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    }
	    h2 {
	        text-align: center;
	    }
	    label {
	        font-size: 14px;
	        margin-bottom: 2px; /* Giảm khoảng cách giữa label và ô input */
	        display: block;
	    }
	    input[type="email"], input[type="submit"] {
	        width: 100%;
	        padding: 10px;
	        margin: 10px 0;
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        font-size: 14px;
	        box-sizing: border-box;
	    }
	    input[type="email"] {
	        height: 42px;
	    }
	    input[type="submit"] {
	        background: linear-gradient(90deg, #FF69B4, #FFD700);
	        color: white;
	        font-weight: bold;
	        border: none;
	        cursor: pointer;
	        transition: 0.3s ease;
	    }
	    input[type="submit"]:hover {
	        background: linear-gradient(90deg, #FFD700, #FF69B4);
	    }
	    .error, .success {
	        text-align: center;
	        color: red;
	    }
	</style>
</head>
<body>

<div class="container">
    <h2>Forgot Password</h2>
    <form action="FGServer" method="get">
        <label for="email">Enter your email address:</label>
        <input type="email" id="email" name="email" required placeholder="Enter Your Email">
        
        <input type="submit" value="Check Account" name="action">
    </form>

    <div class="error">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </div>

    <div class="success">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </div>
</div>

</body>
</html>
