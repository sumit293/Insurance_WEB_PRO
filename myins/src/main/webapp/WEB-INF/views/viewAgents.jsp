<%@page import="com.r3sys.model.Agent"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>View All Agents</title>
<style>
	body {
		margin: 0;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background: linear-gradient(to right, #f0f2f5, #e4eaf0);
		transition: background 0.5s ease-in-out;
	}

	h2 {
		text-align: center;
		margin-top: 20px;
		color: #333;
	}

	table {
		width: 95%;
		margin: 30px auto;
		border-collapse: collapse;
		background: white;
		box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
		border-radius: 12px;
		overflow: hidden;
		animation: fadeIn 1s ease-in-out;
		transition: transform 0.3s ease;
	}

	th {
		background-color: #3949ab;
		color: white;
		font-weight: normal;
		padding: 15px;
		text-transform: uppercase;
	}

	td {
		padding: 15px;
		text-align: center;
		border-bottom: 1px solid #e0e0e0;
		color: #333;
		transition: background 0.4s ease-in-out, transform 0.2s ease;
	}

	tr:hover {
		background-color: #f0f4ff;
		transform: scale(1.01);
		box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
	}

	select, input[type="submit"] {
		padding: 6px 10px;
		border: 1px solid #ccc;
		border-radius: 6px;
		transition: all 0.3s ease-in-out;
		font-size: 14px;
	}

	select:hover, input[type="submit"]:hover {
		border-color: #3949ab;
		cursor: pointer;
		box-shadow: 0 0 6px rgba(57, 73, 171, 0.3);
	}

	input[type="submit"] {
		background-color: #3949ab;
		color: white;
		font-weight: bold;
	}

	input[type="submit"]:hover {
		background-color: #303f9f;
	}

	@keyframes fadeIn {
		from {
			opacity: 0;
			transform: translateY(30px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	@media (max-width: 768px) {
		table, thead, tbody, th, td, tr {
			display: block;
			width: 100%;
		}
		tr {
			margin-bottom: 15px;
			box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
			border-radius: 8px;
		}
		th {
			display: none;
		}
		td {
			text-align: right;
			position: relative;
			padding-left: 50%;
		}
		td::before {
			content: attr(data-label);
			position: absolute;
			left: 15px;
			width: 45%;
			white-space: nowrap;
			text-align: left;
			color: #555;
			font-weight: bold;
		}
	}
</style>
</head>
<body>

	<h2>All Insurance Agents</h2>

	<%
		List<Agent> agents = (List<Agent>) request.getAttribute("allAgents");
		if (agents != null && !agents.isEmpty()) {
	%>

	<table>
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Contact</th>
			<th>DOB</th>
			<th>Address</th>
			<th>Status</th>
			<th>Change Status</th>
		</tr>
		<%
			for (Agent agent : agents) {
		%>
		<tr>
			<td data-label="Name"><%= agent.getName() %></td>
			<td data-label="Email"><%= agent.getEmail() %></td>
			<td data-label="Contact"><%= agent.getContact() %></td>
			<td data-label="DOB"><%= agent.getDob() %></td>
			<td data-label="Address"><%= agent.getAddress() %></td>
			<td data-label="Status"><%= agent.getStatus() %></td>
			<td data-label="Change Status">
				<form action="changeStatus" method="post">
					<input type="hidden" name="iaEmail" value="<%= agent.getEmail() %>">
					<select name="newStatus">
						<option value="">Select</option>
						<option value="approved">Approved</option>
						<option value="pending">Pending</option>
					</select>
					<input type="submit" value="Update">
				</form>
			</td>
		</tr>
		<%
			}
		%>
	</table>

	<%
		} else {
	%>
	<p style="text-align:center; font-size:18px; color:#555;">No agents found.</p>
	<%
		}
	%>

</body>
</html>
