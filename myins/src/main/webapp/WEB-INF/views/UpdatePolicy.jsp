<%@page import="com.r3sys.model.policy"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%
    policy p = (policy) request.getAttribute("policy");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update System Parameters</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* --- Cyberpunk Theme & Base --- */
        :root {
            --bg-color: #010413;
            --primary-color: #ff00ff; /* Magenta */
            --secondary-color: #00ffff; /* Cyan */
            --text-color: #d0d0d0;
            --card-bg: rgba(16, 23, 59, 0.8);
            --border-glow: rgba(0, 255, 255, 0.7);
            --error-color: #f71735;
        }
        
        @keyframes scanlines {
            0% { background-position: 0 0; }
            100% { background-position: 0 100px; }
        }

        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: 'Consolas', 'Menlo', 'monospace';
            background-color: var(--bg-color);
            color: var(--text-color);
            
            /* Background Grid and Scanline Effect */
            background-image: 
                linear-gradient(rgba(0,0,0,0.5) 2px, transparent 2px),
                linear-gradient(90deg, rgba(0,0,0,0.5) 2px, transparent 2px),
                linear-gradient(rgba(255,255,255,0.05) 1px, transparent 1px),
                linear-gradient(90deg, rgba(255,255,255,0.05) 1px, transparent 1px);
            background-size: 100px 100px, 100px 100px, 20px 20px, 20px 20px;
            
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }

        body::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom, rgba(1, 4, 19, 0) 98%, rgba(255,255,255,0.3) 100%);
            background-size: 100% 50px;
            animation: scanlines 2s linear infinite;
            pointer-events: none;
            z-index: 2;
        }

        /* --- Cyberpunk UI Card --- */
        .cyber-card {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid var(--border-glow);
            width: 100%;
            max-width: 480px;
            padding: 2.5rem;
            box-sizing: border-box;
            box-shadow: 0 0 15px var(--border-glow), inset 0 0 15px rgba(0, 255, 255, 0.2);
            position: relative;
            animation: fadeIn 1s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px) scale(0.98); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        /* Decorative corners */
        .cyber-card::before, .cyber-card::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border-color: var(--secondary-color);
            border-style: solid;
        }
        .cyber-card::before { top: -2px; left: -2px; border-width: 2px 0 0 2px; }
        .cyber-card::after { bottom: -2px; right: -2px; border-width: 0 2px 2px 0; }
        
        .cyber-title {
            color: #fff;
            text-align: center;
            font-size: 1.5rem;
            margin-top: 0;
            margin-bottom: 2.5rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            position: relative;
            text-shadow: 0 0 10px var(--shadow-pink);
            animation: glitch 1.5s linear infinite;
        }
        
        /* Glitch Effect */
        @keyframes glitch { 2%, 64% { transform: translate(2px,0) skew(0deg); } 4%, 60% { transform: translate(-2px,0) skew(0deg); } 62% { transform: translate(0,0) skew(5deg); } }
        .cyber-title:before, .cyber-title:after { content: attr(data-text); position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: transparent; }
        .cyber-title:before { left: 2px; text-shadow: -2px 0 var(--secondary-color); clip: rect(44px, 450px, 56px, 0); animation: glitch-anim 5s infinite linear alternate-reverse; }
        .cyber-title:after { left: -2px; text-shadow: -2px 0 var(--primary-color), 2px 2px var(--secondary-color); clip: rect(86px, 450px, 99px, 0); animation: glitch-anim-2 3s infinite linear alternate-reverse; }
        @keyframes glitch-anim { 0% { clip: rect(51px, 9999px, 6px, 0); transform: skew(.46deg) } 100% { clip: rect(65px, 9999px, 86px, 0); transform: skew(.88deg) } }
        @keyframes glitch-anim-2 { 0% { clip: rect(8px, 9999px, 7px, 0); transform: skew(.54deg) } 100% { clip: rect(93px, 9999px, 39px, 0); transform: skew(.38deg) } }

        /* --- Form Elements --- */
        .form-label {
            display: block;
            margin-bottom: 1rem;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 1px;
            color: var(--secondary-color);
        }
        .current-date {
            color: #fff;
            font-size: 1.2rem;
        }
        
        .cyber-input {
            width: 100%;
            padding: 12px 5px;
            box-sizing: border-box;
            font-family: inherit;
            font-size: 1.2rem;
            background: transparent;
            color: var(--text-color);
            border: none;
            border-bottom: 2px solid var(--border-glow);
            transition: all 0.3s ease;
        }
        
        .cyber-input:focus {
            outline: none;
            border-bottom-color: var(--primary-color);
            box-shadow: 0 5px 15px rgba(255, 0, 255, 0.3);
        }
        
        .cyber-button {
            width: 100%;
            margin-top: 2rem;
            padding: 15px;
            font-family: inherit;
            font-size: 1.1rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            background-color: transparent;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .cyber-button:hover {
            background-color: var(--primary-color);
            color: #000;
            box-shadow: 0 0 25px var(--primary-color);
        }

    </style>
</head>
<body>

<%
    if (p == null) {
%>
    <div class="cyber-card" style="border-color: var(--error-color); box-shadow: 0 0 15px var(--error-color);">
        <h2 class="cyber-title" data-text="ACCESS DENIED" style="color: var(--error-color); text-shadow: 0 0 10px var(--error-color);">ACCESS DENIED</h2>
        <p class="form-label" style="text-align: center; color: var(--text-color);">Data stream corrupt. Policy object not found in memory.</p>
    </div>
<%
    } else {
%>
    <div class="cyber-card">
        <h2 class="cyber-title" data-text="Modify Record">Modify Record</h2>
        <form action="UpdatePolicyDueDate" method="post">
            <input type="hidden" name="id" value="<%= p.getId() %>">
            
            <div class="form-group">
                <label class="form-label">Data Node: Policy #<%= p.getId() %></label>
                <label class="form-label">Current Due Date: <span class="current-date"><%= p.getDueDate() %></span></label>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="dueDate">Assign New Timestamp:</label>
                <input class="cyber-input" type="date" name="dueDate" id="dueDate" required>
            </div>
            
            <button class="cyber-button" type="submit">Execute</button>
        </form>
    </div>
<%
    }
%>

</body>
</html>