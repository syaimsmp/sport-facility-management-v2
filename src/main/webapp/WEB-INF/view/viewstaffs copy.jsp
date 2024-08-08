<%@page
	import="com.sportsfacilitymanagement.utility.Constants.FacilityBanStatus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Staffs</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<%
	List<Staff> students = (List<Staff>) request.getAttribute("staffs");
	%>

	<div class="container-fluid mt-2">

		<div class="table-responsive">
			<table class="table">
				<thead class="custom-bg text-color">
					<tr>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Mobile No</th>
						<th scope="col">Email Id</th>
						<th scope="col">Address</th>
					</tr>
				</thead>

				<%
				if (students != null) {
					for (Staff user : students) {
				%>
				<tbody>
					<tr class="text-center">
						<td class="mid-align"><%=user.getFirstname()%></td>
						<td class="mid-align"><%=user.getLastname()%></td>
						<td class="mid-align"><%=user.getMobileno()%></td>
						<td class="mid-align"><%=user.getEmailid()%></td>
						<td class="mid-align"><%=user.getStreet() + " " + user.getCity() + " " + user.getPincode()%></td>
				
					</tr>
				</tbody>
				<%
				}
				}
				%>
			</table>
		</div>
	</div>

</body>
</html>