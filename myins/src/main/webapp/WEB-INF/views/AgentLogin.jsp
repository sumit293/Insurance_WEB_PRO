<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agent Login</title>
<style>
    /* --- Base & Background --- */
    :root {
        --background-color: #121212;
        --card-color: #1e1e1e;
        --primary-color: #d9534f; /* A shade of red */
        --text-color: #e0e0e0;
        --border-color: #444;
        --input-bg: #2a2a2a;
    }

    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        background-color: var(--background-color);
        color: var(--text-color);
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden; /* Hide overflow from floating elements */
        position: relative;
    }

    /* --- Floating Elements Container --- */
    .floating-container {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 0;
    }

    .floating-img {
        position: absolute;
        bottom: -100px; /* Start below the screen */
        opacity: 0;
        animation: floatUp 20s infinite linear;
    }
    
    /* Different delays and sizes for a random effect */
    .floating-img:nth-child(1) { width: 40px; left: 10%; animation-delay: 0s; animation-duration: 15s; }
    .floating-img:nth-child(2) { width: 20px; left: 20%; animation-delay: 2s; animation-duration: 25s; }
    .floating-img:nth-child(3) { width: 50px; left: 35%; animation-delay: 4s; animation-duration: 18s; }
    .floating-img:nth-child(4) { width: 30px; left: 50%; animation-delay: 1s; animation-duration: 22s; }
    .floating-img:nth-child(5) { width: 60px; left: 65%; animation-delay: 5s; animation-duration: 16s; }
    .floating-img:nth-child(6) { width: 25px; left: 85%; animation-delay: 7s; animation-duration: 28s; }

    @keyframes floatUp {
        0% {
            transform: translateY(0) rotate(0deg);
            opacity: 0;
        }
        10%, 90% {
            opacity: 0.15;
        }
        100% {
            transform: translateY(-120vh) rotate(360deg);
            opacity: 0;
        }
    }

    /* --- Login Form Styling --- */
    .login-card {
        background-color: var(--card-color);
        padding: 2.5rem;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        width: 100%;
        max-width: 400px;
        z-index: 1;
        border: 1px solid var(--border-color);
        animation: fadeIn 1s ease-in-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.95); }
        to { opacity: 1; transform: scale(1); }
    }

    .card-title {
        text-align: center;
        margin-bottom: 2rem;
        font-size: 2rem;
        font-weight: 300;
        letter-spacing: 1px;
    }
    
    .form-label {
        font-size: 0.9rem;
        margin-bottom: 0.5rem;
        display: block;
    }

    .input-group {
        display: flex;
        align-items: center;
        background-color: var(--input-bg);
        border: 1px solid var(--border-color);
        border-radius: 8px;
        margin-bottom: 1.5rem;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    .input-group:focus-within {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(217, 83, 79, 0.25);
    }
    
    .input-group-text {
        padding: 0.75rem;
        color: var(--text-color);
        opacity: 0.7;
    }

    .input-group-text svg {
        width: 18px;
        height: 18px;
    }

    .form-control {
        border: none;
        background: none;
        padding: 0.75rem;
        width: 100%;
        color: var(--text-color);
        font-size: 1rem;
    }

    .form-control:focus {
        outline: none;
    }

    .btn {
        width: 100%;
        padding: 0.85rem;
        font-size: 1rem;
        font-weight: bold;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.5rem;
    }

    .btn-danger {
        background-color: var(--primary-color);
        color: white;
    }
    
    .btn-danger:hover {
        background-color: #c9302c; /* Darker red */
        box-shadow: 0 4px 15px rgba(217, 83, 79, 0.4);
        transform: translateY(-2px);
    }

    .text-center {
        text-align: center;
    }

    .text-center a {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: bold;
    }

    .text-center a:hover {
        text-decoration: underline;
    }
    
    /* --- Responsive Design --- */
    @media (max-width: 480px) {
        .login-card {
            padding: 1.5rem;
            border: none;
            box-shadow: none;
            max-width: 100%;
            height: 100%;
            border-radius: 0;
        }
    }
</style>
</head>
<body>

<div class="floating-container">
    <img class="floating-img" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiNmZmZmZmYiIHN0cm9rZS13aWR0aD0iMSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj48cGF0aCBkPSJNMjAgOS41bC0uNzEtLjU0YTUgNSAwIDAgMC02LjU4IDBsLTEuNDIgMS4wNmE1IDUgMCAwIDEtNi41OCAwbC0uNzEtLjU0Ij48L3BhdGg+PHBhdGggZD0iTTQgMTQuNWwuNzEuNTRhNSA1IDAgMCAwIDYuNTggMGwxLjQyLTEuMDZhNSA1IDAgMCAxIDYuNTggMGwuNzEuNTQiPjwvcGF0aD48L3N2Zz4=">
    <img class="floating-img" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiNmZmZmZmYiIHN0cm9rZS13aWR0aD0iMSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj48Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMCI+PC9jaXJjbGU+PC9zdmc+">
    <img class="floating-img" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiNmZmZmZmYiIHN0cm9rZS13aWR0aD0iMSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj48cGF0aCBkPSJtMjIgMi0xIDEtMS0xLTIgMi0xLTEtMSAxLTEgMS0yLTItMSAxLTEgMSAyIDIgMS0xIDEtMSAyLTIgMSAxIDEgMS0yIDIgMS0xIDEgMS0yLTIgMS0xLTEtMSAyLTJ6Ij48L3BhdGg+PC9zdmc+">
    <img class="floating-img" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiNmZmZmZmYiIHN0cm9rZS13aWR0aD0iMSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj48cGF0aCBkPSJtMyAyMSA4LTggMiAyIDggLTgiPjwvcGF0aD48cGF0aCBkPSJtNyAxNy0yIDIiPjwvcGF0aD48L3N2Zz4=">
    <img class="floating-img" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiNmZmZmZmYiIHN0cm9rZS13aWR0aD0iMSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj48cmVjdCB3aWR0aD0iNyIgaGVpZ2h0PSI3IiB4PSIzIiB5PSIzIiByeD0iMSI+PC9yZWN0PjxyZWN0IHdpZHRoPSI3IiBoZWlnaHQ9IjciIHg9IjE0IiB5PSIzIiByeD0iMSI+PC9yZWN0PjxyZWN0IHdpZHRoPSI3IiBoZWlnaHQ9IjciIHg9IjE0IiB5PSIxNCIgcng9IjEiPjwvcmVjdD48cmVjdCB3aWR0aD0iNyIgaGVpZ2h0PSI3IiB4PSIzIiB5PSIxNCIgcng9IjEiPjwvcmVjdD48L3N2Zz4=">
    <img class="floating-img" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiNmZmZmZmYiIHN0cm9rZS13aWR0aD0iMSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj48cGF0aCBkPSJNOS41IDUgNS41IDEuNSAxLjUgNS41IDUuNSA5LjV6Ij48L3BhdGg+PHBhdGggZD0iTTE4LjUgMTguNWwtNCA0LTQgLTR6Ij48L3BhdGg+PHBhdGggZD0iTTE1IDJsaDcuNSI+PC9wYXRoPjxwYXRoIGQ9Ik0yIDIybDcuNS0uNSI+PC9wYXRoPjwvc3ZnPg==">
</div>

<div class="login-card">
    <h1 class="card-title">Agent Login</h1>
    <form id="agent-login-form" action="agentLogin" method="post">
        <div class="mb-3">
            <label class="form-label">Agent Email</label>
            <div class="input-group">
                <span class="input-group-text">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="16" x="2" y="4" rx="2"/><path d="M6 10h2"/><path d="M12 10h6"/><path d="M6 14h2"/><path d="M12 14h4"/></svg>
                </span>
                <input type="text" class="form-control" name="email" required>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <div class="input-group">
                <span class="input-group-text">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                </span>
                <input type="password" class="form-control" name="password" required>
            </div>
        </div>
        <div class="d-grid mb-3">
            <button type="submit" class="btn btn-danger">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" x2="3" y1="12" y2="12"/></svg>
                Login
            </button>
        </div>
        <div class="text-center">
            <p>New agent? <a href="AgentRegister">Register Here</a></p>
        </div>
    </form>
</div>

</body>
</html>