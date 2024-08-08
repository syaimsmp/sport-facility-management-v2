<%@page
	import="com.sportsfacilitymanagement.utility.Constants.FacilityBanStatus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Customers</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<%
	List<Student> students = (List<Student>) request.getAttribute("students");
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
						<th scope="col">Action</th>
					</tr>
				</thead>

				<%
				if (students != null) {
					for (Student user : students) {
				%>
				<tbody>
					<tr class="text-center">
						<td class="mid-align"><%=user.getFirstname()%></td>
						<td class="mid-align"><%=user.getLastname()%></td>
						<td class="mid-align"><%=user.getMobileno()%></td>
						<td class="mid-align"><%=user.getEmailid()%></td>
						<td class="mid-align"><%=user.getStreet() + " " + user.getCity() + " " + user.getPincode()%></td>
						<td class="mid-align">
							<%
							if (user.getFacilityBan().equals(FacilityBanStatus.YES.value())) {
							%> <a
							href="updateStudentBanStatus?studentId=<%=user.getId()%>&status=No"><button
									type="button" class="btn btn-success">Un-Ban</button></a> <%
 } else {
 %> <a
							href="updateStudentBanStatus?studentId=<%=user.getId()%>&status=Yes"><button
									type="button" class="btn btn-danger">Ban</button></a> <%
 }
 %>
						</td>
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