<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Secure Access</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Teko:wght@700&family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
<style>
    /* --- Valorant Theme --- */
    :root {
        --val-dark: #0f1923;
        --val-red: #ff4655;
        --val-text: #ece8e1;
        --val-off-white: #ece8e1;
        --val-grey: #768079;
        --font-heading: 'Teko', sans-serif;
        --font-body: 'Montserrat', sans-serif;
    }

    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        font-family: var(--font-body);
        background-color: var(--val-dark);
        color: var(--val-text);
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        position: relative;
    }

    /* --- Animated Background Elements --- */
    .bg-shapes {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 0;
    }
    .shape {
        position: absolute;
        list-style: none;
        display: block;
        width: 40px;
        height: 40px;
        background-color: rgba(255, 70, 85, 0.15);
        bottom: -150px;
        animation: rise 25s linear infinite;
        transform: rotate(45deg);
    }
    @keyframes rise {
        0% { transform: translateY(0) rotate(45deg); opacity: 1; }
        100% { transform: translateY(-120vh) rotate(360deg); opacity: 0; }
    }
    .shape:nth-child(1) { left: 10%; width: 80px; height: 80px; animation-delay: 0s; }
    .shape:nth-child(2) { left: 20%; width: 30px; height: 30px; animation-delay: 2s; animation-duration: 12s; }
    .shape:nth-child(3) { left: 75%; width: 100px; height: 100px; animation-delay: 4s; }
    .shape:nth-child(4) { left: 45%; width: 60px; height: 60px; animation-delay: 0s; animation-duration: 18s; }

    /* --- Login Card --- */
    .login-card {
        background-color: rgba(15, 25, 35, 0.85);
        backdrop-filter: blur(5px);
        width: 100%;
        max-width: 420px;
        padding: 3rem;
        box-sizing: border-box;
        position: relative;
        z-index: 1;
        /* Angular clip-path effect */
        clip-path: polygon(0 0, 100% 0, 100% 100%, 10% 100%, 0 90%);
        border-left: 2px solid var(--val-red);
        animation: fadeIn 1s ease-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .card-title {
        font-family: var(--font-heading);
        font-size: 3.5rem;
        text-transform: uppercase;
        letter-spacing: 2px;
        color: #fff;
        margin: 0 0 2rem 0;
        line-height: 1;
    }
    
    /* --- Form Elements --- */
    .form-group {
        margin-bottom: 1.5rem;
    }
    
    .form-label {
        display: block;
        margin-bottom: 0.5rem;
        font-size: 0.9rem;
        font-weight: 600;
        color: var(--val-grey);
    }

    .input-group {
        display: flex;
        background-color: rgba(0,0,0,0.2);
        border: 1px solid #2f3a44;
        transition: border-color 0.3s;
    }

    .input-group:focus-within {
        border-color: var(--val-red);
    }
    
    .input-icon {
        padding: 0.8rem;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .input-icon svg {
        width: 20px;
        height: 20px;
        fill: var(--val-grey);
    }
    
    .form-control {
        width: 100%;
        border: none;
        background: transparent;
        padding: 0.8rem;
        color: var(--val-text);
        font-family: var(--font-body);
        font-size: 1rem;
    }
    
    .form-control:focus {
        outline: none;
    }

    /* --- Valorant Style Button --- */
    .valorant-btn {
        display: block;
        width: 100%;
        background-color: var(--val-red);
        border: none;
        color: white;
        padding: 1rem;
        font-family: var(--font-heading);
        font-size: 1.8rem;
        text-transform: uppercase;
        letter-spacing: 1px;
        cursor: pointer;
        position: relative;
        /* Skew effect for the button */
        transform: skew(-15deg);
        transition: background-color 0.3s;
    }
    
    .valorant-btn-text {
        display: inline-block;
        /* Un-skew the text */
        transform: skew(15deg);
    }

    .valorant-btn:hover {
        background-color: #e63d4b;
    }
    
    /* --- Bottom Link --- */
    .bottom-text {
        text-align: center;
        margin-top: 2rem;
        font-size: 0.9rem;
    }
    
    .bottom-text a {
        color: var(--val-red);
        text-decoration: none;
        font-weight: 600;
    }
    
    .bottom-text a:hover {
        text-decoration: underline;
    }

    /* --- Responsive --- */
    @media (max-width: 480px) {
        .login-card {
            padding: 2rem;
            clip-path: none; /* Simplify shape on small screens */
            border: 1px solid #2f3a44;
        }
    }

</style>
</head>
<body>

<ul class="bg-shapes">
    <li></li><li></li><li></li><li></li>
</ul>

<div class="login-card">
    <h1 class="card-title">SECURE LOGIN</h1>
    <form id="agent-login-form" action="policyHolderLogin" method="post">
        <div class="form-group">
            <label class="form-label">Policy Holder Email</label>
            <div class="input-group">
                <span class="input-icon">
                    <svg viewBox="0 0 24 24"><path d="M12,4A4,4 0 0,1 16,8A4,4 0 0,1 12,12A4,4 0 0,1 8,8A4,4 0 0,1 12,4M12,14C16.42,14 20,15.79 20,18V20H4V18C4,15.79 7.58,14 12,14Z"></path></svg>
                </span>
                <input type="text" class="form-control" name="email" required>
            </div>
        </div>
        <div class="form-group">
            <label class="form-label">Password</label>
            <div class="input-group">
                <span class="input-icon">
                    <svg viewBox="0 0 24 24"><path d="M12,17A2,2 0 0,0 14,15C14,13.89 13.1,13 12,13A2,2 0 0,0 10,15A2,2 0 0,0 12,17M18,8A2,2 0 0,1 20,10V20A2,2 0 0,1 18,22H6A2,2 0 0,1 4,20V10C4,8.89 4.9,8 6,8H7V6A5,5 0 0,1 12,1A5,5 0 0,1 17,6V8H18M12,3A3,3 0 0,0 9,6V8H15V6A3,3 0 0,0 12,3Z"></path></svg>
                </span>
                <input type="password" class="form-control" name="password" required>
            </div>
        </div>
        <div class="d-grid mb-3">
            <button type="submit" class="valorant-btn">
                <span class="valorant-btn-text">Login</span>
            </button>
        </div>
        <div class="bottom-text">
            <p>New Policy Holder? <a href="AddPolicyHolder">Register an Account</a></p>
        </div>
    </form>
</div>

</body>
</html>