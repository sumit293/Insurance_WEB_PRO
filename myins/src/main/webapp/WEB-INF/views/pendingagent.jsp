<%@page import="com.r3sys.model.Agent"%>
<%@page import="java.util.List"%>
<%@page import="com.r3sys.model.Agent"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Pending Insurance Agents</title>
<style>
table {
	width: 90%;
	border-collapse: collapse;
	margin: 20px auto;
}

th, td {
	padding: 10px;
	border: 1px solid #aaa;
	text-align: center;
}

h2 {
	text-align: center;
}

form {
	margin: 0;
}

select, input[type="submit"] {
	padding: 5px;
}
</style>
</head>
<body>

	<h2>Pending Insurance Agent Requests</h2>

	<%
		List<Agent> agents = (List<Agent>) request.getAttribute("pendingAgents");
		if (agents != null && !agents.isEmpty()) {
	%>

	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Contact</th>
				<th>DOB</th>
				<th>Address</th>
				<th>Current Status</th>
				<th>Change Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Agent agent : agents) {
			%>
			<tr>
				<td><%=agent.getName()%></td>
				<td><%=agent.getEmail()%></td>
				<td><%=agent.getContact()%></td>
				<td><%=agent.getDob()%></td>
				<td><%=agent.getAddress()%></td>
				<td><%=agent.getStatus()%></td>
				<td>
					<form method="post" action="changeStatus">
						<input type="hidden" name="iaEmail"
							value="<%=agent.getEmail()%>" /> <select name="newStatus"
							required>
							<option value="">Select</option>
							<option value="approved">Approved</option>
							<option value="rejected">Rejected</option>
						</select>
				</td>
				<td><input type="submit" value="Update" />
					</form></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<%
		} else {
	%>
	<p style="text-align: center;">No pending insurance agent
		registrations found.</p>
	<%
		}
	%>

</body>
</html>
