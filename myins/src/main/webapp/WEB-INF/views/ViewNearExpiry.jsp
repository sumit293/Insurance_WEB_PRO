<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.policy" %>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Policy Overview</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        /* --- CS:GO Theme --- */
        :root {
            --cs-dark-bg: #1b2838;
            --cs-dark-secondary: #2a475e;
            --cs-blue: #66c0f4;
            --cs-gold: #ffc600;
            --cs-text: #c7d5e0;
            --cs-expired: #d9534f;
            --cs-near-expiry: #f0ad4e;
        }

        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            font-family: 'Montserrat', sans-serif;
            background-color: var(--cs-dark-bg);
            /* Subtle hexagonal background pattern */
            background-image:
                linear-gradient(rgba(27, 40, 56, 0.95), rgba(27, 40, 56, 0.95)),
                url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMCIgaGVpZ2h0PSIzMC4wMDIiPjxwYXRoIGQ9Ik0xMi45OTggNS43NzRsMi4xNjcgMS4yNTF2Mi41MDFsLTIuMTY3IDEuMjUyLTIuMTY3LTEuMjUyVjcuMDQ5bDIuMTY3LTEuMjUyek0xNS4xNjUgOC4yNzV2Mi41MDFsLTIuMTY3IDEuMjUyLTEuMTM2LS42NXYtMS4xODdsMi4xNjctMS4yNTIgMS4xMzYuNjV6TTguODMzIDguMjc1bDIuMTY3IDEuMjUyLTIuMTY3IDEuMjUydi0yLjVsMi4xNjctMS4yNTJ2Mi41ek0xMC44NjQgMy4xMThsMi4xMzQtMS4yMzMgMS41NzkuOTExLS41NTYgMS4xMy0yLjEzMyAxLjIzNC0xLjU4LS45MTIgLjU1Ni0xLjEzek0xMC4yNDkgOS41MjVsLTIuMTY3IDEuMjUyVjEyLjAyNmgyLjE2N3YtMi41MDF6TTcuNTI2IDE0LjE2M2wxLjEzNS42NjEgMi4xNjctMS4yNTFWMTIuMDI2bC0yLjE2Ny0xLjI1Mi0xLjEzNS42NjF2Mi41MjJ6bTEyLjMxNyAwbDIuMTY3LTIuNTAxdi0xLjE4NmwtMi4xNjctMS4yNTItMS4xMzUuNjYxdjIuNTAxbDEuMTM1LjY2ek0yMS4wMDQgOS41MjVsMi4xNjcgMS4yNTFWMTIuMDI2aC0yLjE2N3YtMi41MDF6bS03LjY3MiA3LjI5OGwtMi4xNjcgMS4yNTJ2Mi41MDFsMi4xNjcgMS4yNTIgMi4xNjctMS4yNTJ2LTIuNTAxbC0yLjE2Ny0xLjI1MkMtMTMuNzMgMTYuNzM0IDEzLjMzMiAxNi44MjMgMTMuMzMyIDE2LjgyM3ptMS4wMzUgMS4yNTFsMi4xNjggMS4yNTJ2Mi41MDFsLTEuMTM2LjY1di0yLjVsLTEuMDMyLS42MDF6bTQuMzA1IDBsMi4xNjcgMS4yNTJ2Mi41MDFsLTIuMTY3IDEuMjUyLTIuMTY3LTEuMjUyVjE4LjA3NGwyLjE2Ny0xLjI1MnptMy4xMzYgMS4yNTJsMi4xNjcgMS4yNTIgMS4xMzYuNjYxVjE4LjA3NGwtMS4xMzYtLjY1LTIuMTY3IDEuMjUyem0tMTQuNDU0IDBsMi4xNjctMS4yNTIgMi4xNjcgMS4yNTJ2Mi41MDFMNy41MjYgMjIuMDJsLTEuMTM2LS42NjF2LTIuNTIxbDEuMTM2LS42NXptNi40NzIgNC45NTZsMS4xMzYuNjUgMS4wMzUtLjYwMXYtMi41MDFsLTEuMDM1LS42MDEtMS4xMzYuNjVWMjIuMDJ6JyBmaWxsPSIjMmE0NzVlIiBmaWxsLW9wYWNpdHk9Ii4xNSIvPjwvc3ZnPg==');
            color: var(--cs-text);
        }

        /* --- Main Container & Layout --- */
        .container {
            padding: 2rem;
            max-width: 1400px;
            margin: 2rem auto;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .page-title {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--cs-gold);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 2rem;
            text-align: center;
            border-bottom: 2px solid #2a475e;
            padding-bottom: 1rem;
        }

        /* --- Table Styling --- */
        .csgo-table {
            width: 100%;
            border-collapse: collapse;
            background-color: var(--cs-dark-secondary);
            border: 1px solid #1a2430;
        }

        .csgo-table th, .csgo-table td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid #1a2430;
        }

        .csgo-table thead {
            background-color: rgba(0,0,0,0.2);
        }

        .csgo-table th {
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--cs-blue);
            text-transform: uppercase;
            white-space: nowrap;
        }

        .csgo-table tbody tr {
            transition: background-color 0.2s ease;
        }

        .csgo-table tbody tr:hover {
            background-color: rgba(102, 192, 244, 0.1);
        }

        /* --- Row Highlighting --- */
        .expired, .near-expiry {
            position: relative;
        }
        
        .expired td, .near-expiry td {
            border-left: 5px solid;
        }

        .expired td {
            border-left-color: var(--cs-expired);
            background-color: rgba(217, 83, 79, 0.1);
        }

        .near-expiry td {
            border-left-color: var(--cs-near-expiry);
            background-color: rgba(240, 173, 78, 0.1);
        }
        
        /* No data message */
        .no-data-message {
            text-align: center;
            padding: 3rem;
            font-size: 1.2rem;
            background-color: var(--cs-dark-secondary);
            border: 1px solid #1a2430;
        }

        /* --- Responsive Design --- */
        @media screen and (max-width: 992px) {
            .csgo-table thead {
                display: none;
            }

            .csgo-table, .csgo-table tbody, .csgo-table tr, .csgo-table td {
                display: block;
                width: 100%;
                box-sizing: border-box;
            }

            .csgo-table tr {
                margin-bottom: 15px;
                border: 1px solid #1a2430;
            }
            
            .csgo-table td {
                text-align: right;
                position: relative;
                padding-left: 50%;
                border-bottom: 1px solid #2c3d52;
                border-left: 5px solid; /* Keep the colored border */
            }
            
            .csgo-table tr td:last-child {
                border-bottom: none;
            }

            .csgo-table td::before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                width: 45%;
                padding-right: 10px;
                white-space: nowrap;
                text-align: left;
                font-weight: 600;
                color: var(--cs-blue);
                text-transform: uppercase;
            }
        }
    </style>
</head>
<body>

    <%
        List<policy> policies = (List<policy>) request.getAttribute("policies");
        String filterType = (String) request.getAttribute("filterType");

        String heading = "All Policies Overview";
        if ("near".equals(filterType)) {
            heading = "Policies: Expiration Imminent";
        } else if ("expired".equals(filterType)) {
            heading = "Policies: Status Expired";
        }

        // We use server's current time, but it could be different from user's. Let's assume it's close enough.
        // Current Time in India: Sunday, 27 July 2025, around 4:08 PM
        LocalDate today = LocalDate.of(2025, 7, 27);
        LocalDate oneMonthLater = today.plusMonths(1);
    %>

    <div class="container">
        <h2 class="page-title"><%= heading %></h2>

        <%
            if (policies == null || policies.isEmpty()) {
        %>
            <div class="no-data-message">
                <p>No policies match the selected criteria.</p>
            </div>
        <%
            } else {
        %>
            <table class="csgo-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Details</th>
                        <th>Holder Name</th>
                        <th>Holder Email</th>
                        <th>Due Date</th>
                        <th>Agent Email</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (policy p : policies) {
                            LocalDate dueDate = null;
                            // Assuming getDueDate returns a String like "YYYY-MM-DD"
                            // You might need to adjust this parsing based on your actual data type
                            try {
                                if (p.getDueDate() != null) {
                                     // If p.getDueDate() is already a LocalDate, you don't need to parse.
                                     // If it's a java.sql.Date, you can convert it: new java.sql.Date(p.getDueDate().getTime()).toLocalDate();
                                     // Assuming it's a String for this example:
                                     dueDate = LocalDate.parse(p.getDueDate().toString());
                                }
                            } catch (Exception e) {
                                // Handle parsing error if date format is wrong
                            }

                            String rowClass = "";
                            if (dueDate != null) {
                                if (dueDate.isBefore(today)) {
                                    rowClass = "expired";
                                } else if (!dueDate.isAfter(oneMonthLater)) {
                                    rowClass = "near-expiry";
                                }
                            }
                    %>
                    <tr class="<%= rowClass %>">
                        <td data-label="ID"><%= p.getId() %></td>
                        <td data-label="Title"><%= p.getPolicyTitle() %></td>
                        <td data-label="Details"><%= p.getPolicyDetail() %></td>
                        <td data-label="Holder Name"><%= p.getHolderName() %></td>
                        <td data-label="Holder Email"><%= p.getPhEmail() %></td>
                        <td data-label="Due Date"><%= p.getDueDate() %></td>
                        <td data-label="Agent Email"><%= p.getIaEmail() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        <%
            }
        %>
    </div>

</body>
</html>