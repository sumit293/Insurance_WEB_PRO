<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Policy</title>
<style>
    /* --- Base & Theme --- */
    :root {
        --background-color: #0d1117;
        --card-color: #161b22;
        --primary-color: #8957e5; /* A vibrant purple for 'add' actions */
        --text-color: #c9d1d9;
        --border-color: #30363d;
        --input-bg: #0d1117;
    }

    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        background-color: var(--background-color);
        color: var(--text-color);
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
    }

    .shape {
        position: absolute;
        bottom: -150px;
        opacity: 0;
        background-color: rgba(137, 87, 229, 0.1);
        animation: rise 25s infinite ease-in;
    }
    
    .shape:nth-child(1) { width: 40px; height: 40px; left: 15%; animation-delay: 0s; border-radius: 50%; }
    .shape:nth-child(2) { width: 60px; height: 60px; left: 30%; animation-delay: 3s; animation-duration: 15s; }
    .shape:nth-child(3) { width: 90px; height: 90px; left: 75%; animation-delay: 5s; animation-duration: 20s; }
    
    @keyframes rise {
        from { transform: translateY(0); }
        to { transform: translateY(-120vh) rotate(360deg); }
    }
    
    /* --- Main Container & Card --- */
    .container {
        width: 100%;
        max-width: 800px;
        margin: 3rem auto;
        padding: 0 1rem;
        box-sizing: border-box;
    }

    .policy-card {
        background-color: var(--card-color);
        padding: 2rem 2.5rem;
        border-radius: 12px;
        border: 1px solid var(--border-color);
        animation: slide-up 0.7s ease-out forwards;
        opacity: 0;
    }
    
    @keyframes slide-up {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .card-title {
        text-align: center;
        margin-top: 0;
        margin-bottom: 2.5rem;
        font-size: 2.2rem;
        font-weight: 500;
        color: #fff;
    }

    /* --- Form Grid Layout --- */
    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 1.5rem;
    }

    /* --- Floating Label Inputs --- */
    .form-group {
        position: relative;
    }
    
    .form-group.full-width {
        grid-column: 1 / -1; /* Make element span both columns */
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
    
    textarea.form-input {
        resize: vertical;
        min-height: 100px;
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

    /* --- Submit Button --- */
    .submit-btn {
        width: 100%;
        padding: 14px;
        margin-top: 1rem;
        font-size: 1.1rem;
        font-weight: bold;
        border-radius: 6px;
        border: none;
        cursor: pointer;
        transition: all 0.3s ease;
        background-color: var(--primary-color);
        color: #fff;
    }

    .submit-btn:hover {
        background-color: #a074f0;
        box-shadow: 0 4px 20px rgba(137, 87, 229, 0.4);
        transform: translateY(-3px);
    }
    
    /* --- Scroll Activity Section --- */
    .scroll-activity-section {
        text-align: center;
        margin-top: 10rem;
        margin-bottom: 10rem;
        opacity: 0;
        transition: opacity 1s;
    }
    
    .scroll-activity-section.is-visible {
        opacity: 1;
    }
    
    .scroll-activity-section h3 {
        font-weight: 400;
        color: #8b949e;
        margin-bottom: 2rem;
    }
    
    #shield-svg path {
        stroke-dasharray: 1000;
        stroke-dashoffset: 1000;
    }
    
    .scroll-activity-section.is-visible #shield-svg path {
        animation: draw 3s ease-in-out forwards;
    }
    
    @keyframes draw {
        to {
            stroke-dashoffset: 0;
        }
    }

    /* --- Responsive Design --- */
    @media (max-width: 768px) {
        .form-grid {
            grid-template-columns: 1fr; /* Stack columns on smaller screens */
        }
        .container {
            margin-top: 1rem;
            margin-bottom: 1rem;
        }
        .policy-card {
            padding: 1.5rem;
        }
    }
</style>
</head>
<body>

<div class="background-shapes">
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>
</div>

<div class="container">
    <div class="policy-card">
        <h2 class="card-title">Add New Policy</h2>
        <form action="SubmitAddPolicy" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <input type="text" id="holderName" name="holderName" class="form-input" placeholder="Holder Name" required />
                    <label for="holderName" class="form-label">Holder Name</label>
                </div>

                <div class="form-group">
                    <input type="date" id="dob" name="dob" class="form-input" placeholder="Date of Birth" required />
                    <label for="dob" class="form-label">Date of Birth</label>
                </div>
                
                <div class="form-group">
                    <input type="text" id="contact" name="contact" class="form-input" placeholder="Contact" required />
                    <label for="contact" class="form-label">Contact</label>
                </div>
                
                <div class="form-group">
                    <input type="email" id="phEmail" name="phEmail" class="form-input" placeholder="Policy Holder Email" required />
                    <label for="phEmail" class="form-label">Policy Holder Email</label>
                </div>
                
                <div class="form-group full-width">
                    <input type="text" id="policyTitle" name="policyTitle" class="form-input" placeholder="Policy Title" required />
                    <label for="policyTitle" class="form-label">Policy Title</label>
                </div>
                
                <div class="form-group full-width">
                    <textarea id="policyDetail" name="policyDetail" class="form-input" placeholder="Policy Detail" required></textarea>
                    <label for="policyDetail" class="form-label">Policy Detail</label>
                </div>
                
                <div class="form-group">
                    <input type="date" id="dueDate" name="dueDate" class="form-input" placeholder="Due Date" required />
                    <label for="dueDate" class="form-label">Due Date</label>
                </div>

                <div class="form-group">
                    <input type="email" id="iaEmail" name="iaEmail" class="form-input" placeholder="Agent Email" required />
                    <label for="iaEmail" class="form-label">Agent Email</label>
                </div>
                
                <div class="form-group full-width">
                    <input type="submit" value="Add Policy" class="submit-btn" />
                </div>
            </div>
        </form>
    </div>
    
    <div class="scroll-activity-section">
        <h3>Securing Your Future</h3>
        <svg id="shield-svg" width="100" height="100" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round">
            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
            <path d="m9 12 2 2 4-4"></path>
        </svg>
    </div>
</div>

<script>
    // JavaScript for the scroll-activated activity
    const activitySection = document.querySelector('.scroll-activity-section');

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                activitySection.classList.add('is-visible');
                observer.unobserve(activitySection); // Animate only once
            }
        });
    }, {
        root: null, // relative to the viewport
        threshold: 0.5 // trigger when 50% of the element is visible
    });

    observer.observe(activitySection);
</script>

</body>
</html>