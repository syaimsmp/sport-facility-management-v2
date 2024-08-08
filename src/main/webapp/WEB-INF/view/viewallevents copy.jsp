<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Events</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<%-- <%
	Integer userId = student != null ? student.getId() : staff.getId();
	%> --%>

	<div class="container-fluid mt-2">

		<div class="table-responsive">
			<table class="table">
				<thead class="custom-bg text-color">

					<tr>
						<th scope="col">Event Name</th>
						<th scope="col">Host Name</th>
						<th scope="col">Host Role</th>
						<th scope="col">Facility Name</th>
						<th scope="col">Open For Public</th>
						<th scope="col">Min Participant</th>
						<th scope="col">Max Participant</th>
						<th scope="col">Venue</th>
						<th scope="col">Event Time</th>
						<th scope="col">Action</th>
					</tr>
				</thead>

				<%
				List<Event> events = new ArrayList<>();

				events = (List<Event>) request.getAttribute("events");

				if (events != null) {
					for (Event event : events) {
						Facility facility = facilityDao.findById(event.getFacilityId()).get();

						Student stdnt = null;
						Staff stf = null;

						if (event.getRole().equals("student")) {
					stdnt = studentDao.findById(event.getHostId()).get();
						} else {
					stf = staffDao.findById(event.getHostId()).get();
						}
				%>
				<tbody>
					<tr class="text-center">

						<td class="mid-align"><%=event.getName()%></td>
						<td class="mid-align"><%=stdnt != null ? stdnt.getFirstname() + " " + stdnt.getLastname()
		: stf.getFirstname() + " " + stf.getLastname()%></td>
						<td class="mid-align"><%=event.getRole()%></td>
						<td class="mid-align"><%=facility.getName()%></td>
						<td class="mid-align"><%=event.getOpenToPublic()%></td>
						<td class="mid-align"><%=event.getMinParticipant()%></td>
						<td class="mid-align"><%=event.getMaxParticipant()%></td>
						<td class="mid-align"><%=event.getVenue()%></td>
						<td class="mid-align"><%=event.getDateTime()%></td>

						<%
						if (userType.equals("admin")) {
						%>
						<td class="mid-align"><a
							href="vieweventparticipants?eventId=<%=event.getId()%>"><button
									type="button" class="btn btn-primary">View Participant</button></a>
							<a href="vieweventreviews?eventId=<%=event.getId()%>"><button
									type="button" class="btn btn-primary">View Reviews</button></a></td>
						<%
						} else {
						%>
						<td class="mid-align"><a
							href="applyForEvent?eventId=<%=event.getId()%>&userId=<%=userId%>&role=<%=userType%>"><button
									type="button" class="btn btn-primary">Apply</button></a></td>
						<%
						}
						%>


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