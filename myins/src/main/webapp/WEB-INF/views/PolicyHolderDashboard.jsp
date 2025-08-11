<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pharmacy Holder Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: radial-gradient(circle at top, #e0f7fa, #80deea, #26c6da);
            overflow: hidden;
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
        }

        h1 {
            text-align: center;
            margin-top: 100px;
            font-size: 50px;
            animation: float 3s ease-in-out infinite;
            background: linear-gradient(90deg, #ff4081, #7c4dff, #18ffff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            transition: transform 0.3s;
        }

        h1:hover {
            transform: scale(1.1) rotate(-2deg);
            cursor: pointer;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-20px);
            }
        }

        .button-container {
            text-align: center;
            margin-top: 40px;
        }

        .btn-fun {
            position: relative;
            padding: 15px 30px;
            font-size: 18px;
            color: #fff;
            background-color: #6200ea;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(98, 0, 234, 0.6);
            transition: transform 0.3s ease-in-out;
        }

        .btn-fun:hover {
            transform: scale(1.1) rotate(1deg);
            background-color: #7c4dff;
        }

        .btn-fun::after {
            content: "";
            position: absolute;
            width: 100%;
            height: 300%;
            top: -100%;
            left: -50%;
            background: linear-gradient(120deg, rgba(255, 255, 255, 0.2) 0%, transparent 100%);
            transform: rotate(25deg);
            animation: shine 2.5s infinite;
        }

        @keyframes shine {
            0% {
                left: -100%;
            }
            50% {
                left: 100%;
            }
            100% {
                left: 100%;
            }
        }

        .bg-bubbles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .bg-bubbles span {
            position: absolute;
            display: block;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 50%;
            animation: rise 20s infinite ease-in;
            bottom: -100px;
        }

        .bg-bubbles span:nth-child(1) { left: 10%; animation-delay: 0s; }
        .bg-bubbles span:nth-child(2) { left: 20%; animation-delay: 2s; }
        .bg-bubbles span:nth-child(3) { left: 25%; animation-delay: 4s; }
        .bg-bubbles span:nth-child(4) { left: 40%; animation-delay: 0s; }
        .bg-bubbles span:nth-child(5) { left: 70%; animation-delay: 3s; }
        .bg-bubbles span:nth-child(6) { left: 80%; animation-delay: 5s; }

        @keyframes rise {
            0% {
                transform: translateY(0) scale(1);
                opacity: 0.5;
            }
            100% {
                transform: translateY(-1000px) scale(1.5);
                opacity: 0;
            }
        }

        .msg-box {
            margin-top: 40px;
            font-size: 20px;
            animation: pulse 3s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                opacity: 0.8;
            }
            50% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>

    <h1 onclick="showSecret()">Welcome Pharmacy Holder</h1>

    <div class="button-container">
        <form action="viewMyPolicies" method="get">
            <button type="submit" class="btn-fun">View My Policies</button>
        </form>
    </div>

    <div class="msg-box" id="secret-msg"></div>

    <div class="bg-bubbles">
        <span></span><span></span><span></span><span></span>
        <span></span><span></span>
    </div>

    <script>
        function showSecret() {
            const msg = document.getElementById("secret-msg");
            msg.innerText = "💊 Tip: Stay insured, stay secure!";
            setTimeout(() => {
                msg.innerText = "";
            }, 4000);
        }
    </script>

</body>
</html>
