<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>LIC Admin Dashboard</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: background 0.5s, color 0.5s;
        }

        .dashboard {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            width: 90%;
            max-width: 600px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transition: background 0.4s, color 0.4s;
        }

        .dashboard img {
            height: 80px;
            margin-bottom: 15px;
        }

        .dashboard h2 {
            margin-bottom: 10px;
            font-size: 26px;
            color: #333;
        }

        .dashboard p {
            margin-bottom: 30px;
            color: #555;
        }

        .btn {
            margin: 10px;
            padding: 12px 24px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .theme-toggle {
            background-color: #222;
        }

        .theme-toggle:hover {
            background-color: #000;
        }

        /* Dark mode */
        body.dark {
            background: url('https://images.unsplash.com/photo-1518085250887-2f903c200fee?auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
            background-size: cover;
        }

        body.dark .dashboard {
            background: rgba(15, 15, 15, 0.9);
            color: #eee;
        }

        body.dark .dashboard h2 {
            color: #eee;
        }

        body.dark .dashboard p {
            color: #ccc;
        }

        body.dark .btn {
            background-color: #00bcd4;
            color: #000;
        }

        body.dark .btn:hover {
            background-color: #008ba3;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <h2>Welcome, LIC Admin</h2>
      
        
        <a href="viewAgents" class="btn">View Agents</a>
<        <button onclick="toggleTheme()" class="btn theme-toggle">Switch Theme</button>
    </div>

    <script>
        function toggleTheme() {
            document.body.classList.toggle('dark');
        }
    </script>
</body>
</html>
