<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insurance Agent Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            margin: 0;
            padding: 0;
        }
        .dashboard {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #006064;
        }
        form {
            margin: 15px 0;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #006064;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #004d4d;
        }
    </style>
</head>
<body>

<div class="dashboard">
    <h2>Insurance Agent Dashboard</h2>

    <form action="AddPolicyHolder" method="post">
        <button type="submit">➕ Add Policy Holder</button>
    </form>

    <form action="ViewPolicyHolders" method="post">
        <button type="submit">👀 View Policy Holders</button>
    </form>

   


    <form action="AddPolicy" method="post">
        <button type="submit">📄 Add New Policy</button>
    </form>

    <form action="ViewPolicy" method="post">
        <button type="submit">📋 View All Policies</button>
    </form>

    <form action="ViewNearExpiry" method="post">
        <button type="submit">📅 Near Expiry Policies (Next 1 Month)</button>
    </form>

    <form action="ViewExpiredPolicies" method="post">
        <button type="submit">⌛ View Expired Policies</button>
    </form>

 
</div>

</body>
</html>
