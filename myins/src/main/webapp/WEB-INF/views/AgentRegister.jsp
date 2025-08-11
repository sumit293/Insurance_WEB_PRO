<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register New Agent</title>
<style>
    /* --- Base & Theme --- */
    :root {
        --background-color: #0d1117; /* A deep navy blue */
        --card-color: #161b22;
        --primary-color: #58a6ff; /* A bright, friendly blue */
        --text-color: #c9d1d9;
        --border-color: #30363d;
        --input-bg: #0d1117;
    }

    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        min-height: 100%;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        background-color: var(--background-color);
        color: var(--text-color);
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 2rem 0; /* Add padding for scroll on small screens */
        overflow-x: hidden;
    }

    /* --- Floating Elements --- */
    .background-shapes {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 0;
        overflow: hidden;
    }

    .shape {
        position: absolute;
        bottom: -150px;
        opacity: 0;
        background-color: rgba(88, 166, 255, 0.1); /* Semi-transparent blue */
        animation: rise 25s infinite ease-in;
    }
    
    .shape.circle { border-radius: 50%; }
    .shape.square { border-radius: 0; }
    
    /* Randomized positions and animations */
    .shape:nth-child(1) { width: 80px; height: 80px; left: 25%; animation-delay: 0s; }
    .shape:nth-child(2) { width: 20px; height: 20px; left: 10%; animation-delay: 2s; animation-duration: 12s; }
    .shape:nth-child(3) { width: 50px; height: 50px; left: 70%; animation-delay: 4s; }
    .shape:nth-child(4) { width: 60px; height: 60px; left: 40%; animation-delay: 0s; animation-duration: 18s; }
    .shape:nth-child(5) { width: 20px; height: 20px; left: 65%; animation-delay: 0s; animation-duration: 20s; }
    .shape:nth-child(6) { width: 110px; height: 110px; left: 75%; animation-delay: 3s; }

    @keyframes rise {
        0% {
            transform: translateY(0);
            opacity: 0;
        }
        10% {
            opacity: 1;
        }
        100% {
            transform: translateY(-120vh) rotate(600deg);
            opacity: 0;
        }
    }
    
    /* --- Registration Form Card --- */
    .register-card {
        background-color: var(--card-color);
        padding: 2rem 2.5rem;
        border-radius: 12px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 450px;
        z-index: 1;
        border: 1px solid var(--border-color);
        animation: slide-up 0.7s ease-out forwards;
        opacity: 0;
    }

    @keyframes slide-up {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .card-title {
        text-align: center;
        margin-bottom: 2rem;
        font-size: 2.2rem;
        font-weight: 500;
        color: #fff;
    }

    /* --- Floating Label Input Fields --- */
    .form-group {
        position: relative;
        margin-bottom: 1.75rem;
    }

    .form-input {
        width: 100%;
        padding: 12px 10px;
        background-color: var(--input-bg);
        border: 1px solid var(--border-color);
        border-radius: 6px;
        color: var(--text-color);
        font-size: 1rem;
        transition: border-color 0.3s;
        box-sizing: border-box; /* Important for padding and width */
    }
    
    .form-input::placeholder {
        color: transparent;
    }

    .form-label {
        position: absolute;
        top: 12px;
        left: 10px;
        font-size: 1rem;
        color: #8b949e; /* Lighter gray for placeholder */
        pointer-events: none;
        transition: all 0.2s ease;
    }
    
    /* The magic for floating labels */
    .form-input:focus + .form-label,
    .form-input:not(:placeholder-shown) + .form-label {
        top: -10px;
        left: 8px;
        font-size: 0.75rem;
        color: var(--primary-color);
        background-color: var(--card-color);
        padding: 0 4px;
    }
    
    .form-input:focus {
        outline: none;
        border-color: var(--primary-color);
    }
    
    /* Style for date input picker */
    .form-input[type="date"]::-webkit-calendar-picker-indicator {
        filter: invert(0.8);
        cursor: pointer;
    }

    /* --- Submit Button --- */
    .submit-btn {
        width: 100%;
        padding: 14px;
        font-size: 1.1rem;
        font-weight: bold;
        border-radius: 6px;
        border: none;
        cursor: pointer;
        transition: all 0.3s ease;
        background-color: var(--primary-color);
        color: #0d1117; /* Dark text on bright button */
    }

    .submit-btn:hover {
        background-color: #79c0ff; /* Lighter blue on hover */
        box-shadow: 0 4px 20px rgba(88, 166, 255, 0.3);
        transform: translateY(-3px);
    }

    /* --- Responsive Design --- */
    @media (max-width: 500px) {
        body {
            align-items: flex-start;
            padding: 0;
        }
        .register-card {
            padding: 2rem 1.5rem;
            border: none;
            box-shadow: none;
            max-width: 100%;
            min-height: 100vh;
            border-radius: 0;
        }
    }
</style>
</head>
<body>

<div class="background-shapes">
    <div class="shape circle"></div>
    <div class="shape square"></div>
    <div class="shape circle"></div>
    <div class="shape square"></div>
    <div class="shape circle"></div>
    <div class="shape square"></div>
</div>

<div class="register-card">
    <h2 class="card-title">Create Agent Account</h2>
    
    <form action="SubmitAddAgent" method="post">
        
        <div class="form-group">
            <input type="text" id="email" name="email" class="form-input" placeholder="Enter Email" required>
            <label for="email" class="form-label">Email Address</label>
        </div>

        <div class="form-group">
            <input type="text" id="name" name="name" class="form-input" placeholder="Enter Name" required>
            <label for="name" class="form-label">Full Name</label>
        </div>

        <div class="form-group">
            <input type="date" id="dob" name="dob" class="form-input" placeholder="Enter DOB" required>
            <label for="dob" class="form-label">Date of Birth</label>
        </div>

        <div class="form-group">
            <input type="text" id="contact" name="contact" class="form-input" placeholder="Enter Contact" required>
            <label for="contact" class="form-label">Contact Number</label>
        </div>

        <div class="form-group">
            <input type="text" id="address" name="address" class="form-input" placeholder="Enter Address" required>
            <label for="address" class="form-label">Address</label>
        </div>

        <div class="form-group">
            <input type="password" id="password" name="password" class="form-input" placeholder="Enter Password" required>
            <label for="password" class="form-label">Password</label>
        </div>
        
        <input type="submit" value="Register" class="submit-btn">
    </form>
</div>

</body>
</html>