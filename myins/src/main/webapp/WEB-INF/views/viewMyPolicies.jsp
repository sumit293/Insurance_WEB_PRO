<%@page import="com.r3sys.model.policy"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Holodeck | My Policies</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
<style>
    /* --- THEME DEFINITION --- */
    :root {
        --font-primary: 'Orbitron', sans-serif;
        --font-secondary: 'Roboto', sans-serif;

        /* Dark Theme (Default) */
        --bg-color: #020412;
        --bg-gradient-start: #020412;
        --bg-gradient-end: #0a0f35;
        --card-bg: rgba(10, 15, 53, 0.5);
        --text-color: #d0d8f0;
        --header-color: #ffffff;
        --accent-color-1: #00ffff; /* Cyan */
        --accent-color-2: #ff00ff; /* Magenta */
        --border-color: rgba(0, 255, 255, 0.3);
        --shadow-color: rgba(0, 255, 255, 0.5);
        --hr-color: linear-gradient(90deg, transparent, var(--accent-color-1), transparent);
    }
    
    body[data-theme='light'] {
        /* Light Theme */
        --bg-color: #f4f7fc;
        --bg-gradient-start: #ffffff;
        --bg-gradient-end: #e9effc;
        --card-bg: rgba(255, 255, 255, 0.6);
        --text-color: #4c5673;
        --header-color: #0d1a42;
        --accent-color-1: #0052d4; /* Deep Blue */
        --accent-color-2: #ff3c78; /* Bright Pink */
        --border-color: rgba(0, 82, 212, 0.3);
        --shadow-color: rgba(0, 82, 212, 0.2);
        --hr-color: linear-gradient(90deg, transparent, var(--accent-color-1), transparent);
    }

    /* --- BASE & ANIMATED BACKGROUND --- */
    @keyframes move-particles {
        from { transform: translateY(0); }
        to { transform: translateY(-1000px); }
    }

    html {
        scroll-behavior: smooth;
    }
    
    body {
        margin: 0;
        padding: 0;
        font-family: var(--font-secondary);
        background-color: var(--bg-color);
        background-image: radial-gradient(circle at 20% 20%, var(--bg-gradient-end), var(--bg-gradient-start) 60%);
        color: var(--text-color);
        overflow-x: hidden;
        transition: background-color 0.5s ease;
    }

    #particle-container {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        pointer-events: none;
        z-index: -1;
    }
    .particle {
        position: absolute;
        width: 2px;
        height: 2px;
        background: var(--accent-color-1);
        border-radius: 50%;
        box-shadow: 0 0 5px var(--shadow-color);
        animation: move-particles 20s linear infinite;
    }

    /* --- HEADER & THEME SWITCH --- */
    .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 2rem 5%;
        max-width: 1600px;
        margin: 0 auto;
    }

    .page-title {
        font-family: var(--font-primary);
        font-size: 2.5rem;
        color: var(--header-color);
        text-shadow: 0 0 10px var(--shadow-color);
        margin: 0;
    }

    .theme-switch-wrapper {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .theme-switch {
        display: inline-block;
        height: 28px;
        position: relative;
        width: 50px;
    }
    .theme-switch input { display: none; }
    .slider {
        background-color: rgba(0,0,0,0.2);
        border: 1px solid var(--border-color);
        bottom: 0; left: 0; right: 0; top: 0;
        position: absolute;
        cursor: pointer;
        transition: .4s;
        border-radius: 34px;
    }
    .slider:before {
        background-color: var(--header-color);
        bottom: 3px; left: 4px;
        content: "";
        height: 20px;
        width: 20px;
        position: absolute;
        transition: .4s;
        border-radius: 50%;
    }
    input:checked + .slider { background-color: var(--accent-color-1); }
    input:checked + .slider:before { transform: translateX(21px); }

    /* --- POLICY GRID & CARDS --- */
    .policy-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
        gap: 2rem;
        padding: 2rem 5%;
        max-width: 1600px;
        margin: 0 auto;
    }
    
    @keyframes card-flip-in {
        from {
            opacity: 0;
            transform: translateY(50px) rotateX(-70deg);
        }
        to {
            opacity: 1;
            transform: translateY(0) rotateX(0deg);
        }
    }

    .policy-card {
        background: var(--card-bg);
        border: 1px solid var(--border-color);
        padding: 1.5rem 2rem;
        border-radius: 15px;
        position: relative;
        overflow: hidden;
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        box-shadow: 0 8px 32px 0 rgba(0,0,0,0.2);
        transition: all 0.5s ease;
        transform-style: preserve-3d;
        animation: card-flip-in 0.8s ease-out backwards;
    }
    
    .policy-card:hover {
        transform: translateY(-10px) scale(1.02);
        box-shadow: 0 16px 40px 0 var(--shadow-color);
        border-color: var(--accent-color-1);
    }
    
    .card-header {
        border-bottom: 1px solid var(--border-color);
        padding-bottom: 1rem;
        margin-bottom: 1rem;
    }

    .policy-title {
        font-family: var(--font-primary);
        font-size: 1.5rem;
        color: var(--header-color);
        margin: 0;
    }
    
    .policy-id {
        font-size: 0.8rem;
        opacity: 0.7;
    }

    .policy-details {
        font-size: 1rem;
        line-height: 1.6;
    }
    
    .data-block {
        margin-top: 1.5rem;
        padding-top: 1.5rem;
        border-top: 1px solid var(--border-color);
    }
    
    .data-block p {
        margin: 0.5rem 0;
        display: flex;
        justify-content: space-between;
    }
    
    .data-block .label {
        opacity: 0.7;
    }
    
    .data-block .value {
        font-weight: 700;
        color: var(--header-color);
    }

    /* --- RESPONSIVE --- */
    @media (max-width: 768px) {
        .header-container { flex-direction: column; gap: 1rem; }
        .page-title { font-size: 2rem; }
        .policy-grid { grid-template-columns: 1fr; }
    }
    
    /* --- NO POLICIES MESSAGE --- */
    .no-policies-message {
        text-align: center;
        padding: 5rem;
        font-family: var(--font-primary);
        font-size: 1.5rem;
        color: var(--header-color);
        opacity: 0.7;
    }

</style>
</head>
<body data-theme="dark">
<div id="particle-container"></div>

<header class="header-container">
    <h1 class="page-title">Personal Databank</h1>
    <div class="theme-switch-wrapper">
        <label class="theme-switch" for="theme-toggle">
            <input type="checkbox" id="theme-toggle" />
            <span class="slider"></span>
        </label>
    </div>
</header>

<main>
    <%
        List<policy> myPolicies = (List<policy>) request.getAttribute("myPolicies");
        if (myPolicies != null && !myPolicies.isEmpty()) {
    %>
    <div class="policy-grid">
        <%
            int delay = 0;
            for (policy p : myPolicies) {
                delay += 100; // Stagger animation for each card
        %>
        <div class="policy-card" style="animation-delay: <%= delay %>ms;">
            <div class="card-header">
                <h2 class="policy-title"><%= p.getPolicyTitle() %></h2>
                <p class="policy-id">ID: <%= p.getId() %></p>
            </div>
            
            <div class="policy-details">
                <p><%= p.getPolicyDetail() %></p>
            </div>

            <div class="data-block">
                <p><span class="label">Due Date:</span> <span class="value"><%= p.getDueDate() %></span></p>
                <p><span class="label">Agent Contact:</span> <span class="value"><%= p.getIaEmail() %></span></p>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <%
        } else {
    %>
        <div class="no-policies-message">
            <p>// No Active Policies Found in Record //</p>
        </div>
    <%
        }
    %>
</main>

<script>
    // --- Theme Switcher Logic ---
    const themeToggle = document.getElementById('theme-toggle');
    const currentTheme = localStorage.getItem('theme');

    // Apply saved theme on page load
    if (currentTheme) {
        document.body.setAttribute('data-theme', currentTheme);
        if (currentTheme === 'light') {
            themeToggle.checked = true;
        }
    }

    themeToggle.addEventListener('change', function() {
        if (this.checked) {
            document.body.setAttribute('data-theme', 'light');
            localStorage.setItem('theme', 'light');
        } else {
            document.body.setAttribute('data-theme', 'dark');
            localStorage.setItem('theme', 'dark');
        }
    });
    
    // --- Animated Particles Logic ---
    const particleContainer = document.getElementById('particle-container');
    const particleCount = 50;
    for (let i = 0; i < particleCount; i++) {
        let particle = document.createElement('div');
        particle.classList.add('particle');
        particle.style.left = `${Math.random() * 100}%`;
        particle.style.top = `${Math.random() * 100}%`;
        particle.style.animationDuration = `${Math.random() * 15 + 10}s`;
        particle.style.animationDelay = `${Math.random() * 5}s`;
        particleContainer.appendChild(particle);
    }
</script>

</body>
</html>