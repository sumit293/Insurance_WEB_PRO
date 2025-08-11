<%@page import="com.r3sys.model.PolicyHolder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Policy Holders</title>
<style>
    /* --- Base & Theme --- */
    :root {
        --background-color: #0d1117;
        --card-color: #161b22;
        --primary-color: #58a6ff;
        --text-color: #c9d1d9;
        --border-color: #30363d;
        --hover-color: #1f242c;
        --danger-color: #f85149;
        --success-color: #2ea043;
    }

    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        background-color: var(--background-color);
        color: var(--text-color);
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
        background-color: rgba(88, 166, 255, 0.05);
        animation: rise 25s infinite ease-in;
    }
    
    .shape:nth-child(1) { width: 80px; height: 80px; left: 25%; animation-delay: 0s; border-radius: 30%;}
    .shape:nth-child(2) { width: 20px; height: 20px; left: 10%; animation-delay: 2s; animation-duration: 12s; }
    .shape:nth-child(3) { width: 50px; height: 50px; left: 70%; animation-delay: 4s; border-radius: 30%;}
    .shape:nth-child(4) { width: 60px; height: 60px; left: 40%; animation-delay: 0s; animation-duration: 18s; }
    .shape:nth-child(5) { width: 120px; height: 120px; left: 65%; animation-delay: 1s; animation-duration: 22s; }

    @keyframes rise {
        from { transform: translateY(0) rotate(0deg); opacity: 0; }
        10% { opacity: 1; }
        to { transform: translateY(-120vh) rotate(360deg); opacity: 0; }
    }
    
    /* --- Main Content & Table Container --- */
    .container {
        padding: 2rem;
        max-width: 1200px;
        margin: 2rem auto;
        animation: fade-in 0.8s ease-out;
    }
    
    @keyframes fade-in {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .page-title {
        font-size: 2.5rem;
        font-weight: 600;
        color: #fff;
        margin-bottom: 2rem;
        text-align: center;
    }

    /* --- Table Styling --- */
    .data-table {
        width: 100%;
        border-collapse: collapse;
        background-color: var(--card-color);
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
    }
    
    .data-table th, .data-table td {
        padding: 15px 20px;
        text-align: left;
    }

    .data-table thead {
        background-color: #1f242c;
    }
    
    .data-table th {
        font-size: 0.85rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        font-weight: 600;
        color: #8b949e;
    }
    
    .data-table tbody tr {
        border-bottom: 1px solid var(--border-color);
        transition: background-color 0.2s ease;
    }
    
    .data-table tbody tr:last-of-type {
        border-bottom: none;
    }

    .data-table tbody tr:hover {
        background-color: var(--hover-color);
    }

    /* --- Action Buttons --- */
    .action-btn {
        display: inline-block;
        padding: 6px 12px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: 500;
        font-size: 0.9rem;
        text-align: center;
        transition: all 0.2s ease;
        margin-right: 5px;
    }
    
    .btn-update {
        background-color: var(--primary-color);
        color: #fff;
    }
    .btn-update:hover {
        background-color: #79c0ff;
        transform: scale(1.05);
    }

    .btn-delete {
        background-color: var(--danger-color);
        color: #fff;
    }
    .btn-delete:hover {
        background-color: #ff756f;
        transform: scale(1.05);
    }

    /* --- Responsive Design for Table --- */
    @media screen and (max-width: 800px) {
        .data-table thead {
            display: none; /* Hide table headers */
        }
        
        .data-table, .data-table tbody, .data-table tr, .data-table td {
            display: block;
            width: 100%;
        }

        .data-table tr {
            margin-bottom: 15px;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid var(--border-color);
        }

        .data-table td {
            text-align: right;
            padding-left: 50%; /* Make space for the label */
            position: relative;
            border-bottom: 1px solid var(--border-color);
        }
        
        .data-table td:last-child {
            border-bottom: none;
        }

        .data-table td::before {
            content: attr(data-label);
            position: absolute;
            left: 15px;
            width: calc(50% - 30px);
            padding-right: 10px;
            white-space: nowrap;
            text-align: left;
            font-weight: bold;
            color: #8b949e;
        }
    }
</style>
</head>
<body>

<div class="background-shapes">
    <div class="shape"></div><div class="shape"></div>
    <div class="shape"></div><div class="shape"></div>
    <div class="shape"></div>
</div>

<div class="container">
    <h1 class="page-title">Policy Holder Management</h1>
    
    <table class="data-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>DOB</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>	
        <tbody>
            <%
                List<PolicyHolder> getAllHolders = (List<PolicyHolder>) request.getAttribute("getAllHolders");
                if (getAllHolders != null && !getAllHolders.isEmpty()) {
                    for (PolicyHolder c : getAllHolders) {
            %>
            <tr>
                <td data-label="Name"><%= c.getName() %></td>
                <td data-label="Contact"><%= c.getContact() %></td>
                <td data-label="Address"><%= c.getAddress() %></td>
                <td data-label="DOB"><%= c.getDob() %></td>
                <td data-label="Email"><%= c.getEmail() %></td>
                <td data-label="Actions">
                    <a class="action-btn btn-update" href="UpdatePolicyHolder?phEmail=<%= c.getEmail() %>">Update</a>
                    <a class="action-btn btn-delete" href="deletePolicyHolder?phEmail=<%= c.getEmail() %>">Delete</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6" style="text-align: center; padding: 40px;">No policy holders found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>