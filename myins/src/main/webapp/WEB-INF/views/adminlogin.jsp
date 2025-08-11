<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Login</title>
    <style>
        /* --- Background --- */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            background: url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1950&q=80') no-repeat center center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }

        /* --- Floating particles --- */
        .floating {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            animation: float 20s linear infinite;
            opacity: 0.7;
        }

        .floating:nth-child(1) { width: 40px; height: 40px; left: 10%; animation-delay: 0s; }
        .floating:nth-child(2) { width: 20px; height: 20px; left: 25%; animation-delay: 5s; }
        .floating:nth-child(3) { width: 60px; height: 60px; left: 70%; animation-delay: 2s; }
        .floating:nth-child(4) { width: 30px; height: 30px; left: 50%; animation-delay: 7s; }

        @keyframes float {
            0% {
                top: 100%;
                transform: translateY(0) rotate(0deg);
                opacity: 0.5;
            }
            100% {
                top: -200px;
                transform: translateY(-1000px) rotate(360deg);
                opacity: 0;
            }
        }

        /* --- Form Container --- */
        .login-box {
            background-color: rgba(0, 0, 0, 0.75);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            color: white;
            z-index: 2;
            width: 320px;
            text-align: center;
        }

        .login-box h2 {
            margin-bottom: 20px;
            font-size: 24px;
            letter-spacing: 1px;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 6px;
            outline: none;
            font-size: 16px;
        }

        .login-box input[type="submit"] {
            background-color: #00bcd4;
            color: #fff;
            border: none;
            padding: 12px 20px;
            margin-top: 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s ease, transform 0.2s;
        }

        .login-box input[type="submit"]:hover {
            background-color: #0097a7;
            transform: scale(1.05);
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            color: #fff;
            background-color: transparent;
            border: 2px solid #fff;
            padding: 10px 18px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background-color: #fff;
            color: #000;
        }
    </style>
</head>
<body>

    <!-- Floating circles -->
    <div class="floating"></div>
    <div class="floating"></div>
    <div class="floating"></div>
    <div class="floating"></div>

    <div class="login-box">
        <h2>Admin Login</h2>
        <form action="AdminLoginSubmit" method="post">
            <input type="text" name="email" placeholder="Enter Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login">
        </form>
        <a href="index" class="back-btn">Back to Home</a>
    </div>

</body>
</html>
