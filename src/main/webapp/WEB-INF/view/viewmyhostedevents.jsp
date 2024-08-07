<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View My Hosted Events</title>
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
				%>
				<tbody>
					<tr class="text-center">

						<td class="mid-align"><%=event.getName()%></td>
						<td class="mid-align"><%=facility.getName()%></td>
						<td class="mid-align"><%=event.getOpenToPublic()%></td>
						<td class="mid-align"><%=event.getMinParticipant()%></td>
						<td class="mid-align"><%=event.getMaxParticipant()%></td>
						<td class="mid-align"><%=event.getVenue()%></td>
						<td class="mid-align"><%=event.getDateTime()%></td>

						<td class="mid-align"><a
							href="vieweventparticipants?eventId=<%=event.getId()%>"><button
									type="button" class="btn btn-primary">View Participant</button></a>

							<a href="vieweventreviews?eventId=<%=event.getId()%>"><button
									type="button" class="btn btn-primary">View Reviews</button></a></td>
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