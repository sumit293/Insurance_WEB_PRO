<%@page import="com.r3sys.model.PolicyHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Retrieve the PolicyHolder object from the request
    PolicyHolder holder = (PolicyHolder) request.getAttribute("holder");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Policy Holder</title>
<style>
    /* --- Base & Theme --- */
    :root {
        --background-color: #0d1117;
        --card-color: #161b22;
        --primary-color: #2ea043; /* Using a green accent for "Update" */
        --text-color: #c9d1d9;
        --border-color: #30363d;
        --input-bg: #0d1117;
        --error-color: #f85149;
    }

    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        min-height: 100vh;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        background-color: var(--background-color);
        color: var(--text-color);
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 2rem 0;
        overflow-x: hidden;
    }

    /* --- Animated Background --- */
    .background-shapes {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
        overflow: hidden;
    }

    .shape {
        position: absolute;
        bottom: -150px;
        opacity: 0;
        background-color: rgba(46, 160, 67, 0.1); /* Semi-transparent green */
        animation: rise 25s infinite ease-in;
    }
    
    .shape:nth-child(1) { width: 40px; height: 40px; left: 15%; animation-delay: 0s; border-radius: 50%; }
    .shape:nth-child(2) { width: 60px; height: 60px; left: 30%; animation-delay: 3s; animation-duration: 15s; }
    .shape:nth-child(3) { width: 25px; height: 25px; left: 55%; animation-delay: 1s; border-radius: 50%; }
    .shape:nth-child(4) { width: 90px; height: 90px; left: 75%; animation-delay: 5s; animation-duration: 20s; }
    
    @keyframes rise {
        from { transform: translateY(0); }
        to { transform: translateY(-120vh) rotate(450deg); }
    }
    
    /* --- Form/Message Card Styling --- */
    .card {
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
        text-align: center;
    }

    @keyframes slide-up {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .card-title {
        margin-bottom: 2rem;
        font-size: 2rem;
        font-weight: 500;
        color: #fff;
    }

    /* --- Floating Label Input Fields --- */
    .form-group {
        position: relative;
        margin-bottom: 1.75rem;
        text-align: left;
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
        box-sizing: border-box;
    }
    
    .form-input::placeholder { color: transparent; }

    .form-label {
        position: absolute;
        top: 12px;
        left: 10px;
        font-size: 1rem;
        color: #8b949e;
        pointer-events: none;
        transition: all 0.2s ease;
    }
    
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

    /* --- Button & Link Styling --- */
    .btn {
        display: inline-block;
        width: 100%;
        padding: 14px;
        font-size: 1.1rem;
        font-weight: bold;
        border-radius: 6px;
        border: none;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        box-sizing: border-box;
    }

    .btn-primary {
        background-color: var(--primary-color);
        color: #fff;
    }

    .btn-primary:hover {
        background-color: #3ddc53;
        box-shadow: 0 4px 20px rgba(46, 160, 67, 0.4);
        transform: translateY(-3px);
    }
    
    .message-text {
        font-size: 1.1rem;
        line-height: 1.6;
        margin-bottom: 2rem;
    }
    
    .btn-secondary {
        background-color: transparent;
        border: 1px solid var(--border-color);
        color: var(--text-color);
    }
    
    .btn-secondary:hover {
        background-color: var(--border-color);
        color: #fff;
    }

    /* --- Responsive Design --- */
    @media (max-width: 500px) {
        body { align-items: flex-start; padding: 0; }
        .card {
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
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>
</div>

<%
    // Check if the policy holder exists
    if (holder == null) {
%>
    <div class="card">
        <h2 class="card-title" style="color: var(--error-color);">Not Found</h2>
        <p class="message-text">
            The policy holder you are trying to update could not be found. 
            They may have been deleted or the link may be incorrect.
        </p>
        <a href="ViewAllHolders" class="btn btn-secondary">Return to List</a>
    </div>
<%
    } else {
%>
    <div class="card">
        <h2 class="card-title">Update Details</h2>
        <form action="SubmitUpdatePolicyHolder" method="post">
            
            <input type="hidden" name="email" value="<%= holder.getEmail() %>"/>

            <div class="form-group">
                <input type="text" id="name" name="name" class="form-input" value="<%= holder.getName() %>" placeholder="Full Name" required>
                <label for="name" class="form-label">Full Name</label>
            </div>

            <div class="form-group">
                <input type="text" id="contact" name="contact" class="form-input" value="<%= holder.getContact() %>" placeholder="Contact Number" required>
                <label for="contact" class="form-label">Contact Number</label>
            </div>

            <div class="form-group">
                <input type="text" id="password" name="password" class="form-input" value="<%= holder.getPassword() %>" placeholder="New Password" required>
                <label for="password" class="form-label">Password</label>
            </div>
            
            <input type="submit" value="Save Changes" class="btn btn-primary">
        </form>
    </div>
<%
    }
%>

</body>
</html>