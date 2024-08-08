<%@page
	import="com.sportsfacilitymanagement.utility.Constants.EventBookingStatus"%>
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
						<th scope="col">Venue</th>
						<th scope="col">Event Time</th>
						<th scope="col">Booking Time</th>
						<th scope="col">Status</th>
						<th scope="col">Action</th>
					</tr>
				</thead>

				<%
				List<BookedEvent> bookings = new ArrayList<>();

				bookings = (List<BookedEvent>) request.getAttribute("bookedEvents");

				if (bookings != null) {
					for (BookedEvent booking : bookings) {
						Event event = eventDao.findById(booking.getEventId()).get();
				%>
				<tbody>
					<tr class="text-center">
						<td class="mid-align"><%=event.getName()%></td>
						<td class="mid-align"><%=event.getVenue()%></td>
						<td class="mid-align"><%=event.getDateTime()%></td>
						<td class="mid-align"><%=Helper.millisToDateTime(booking.getBookingTime())%></td>
						<td class="mid-align"><%=booking.getStatus()%></td>

						<%
						if (booking.getStatus().equals(EventBookingStatus.APPROVED.value())) {
						%>
						<td class="mid-align"><a
							href="addeventreview?eventId=<%=event.getId()%>&userId=<%=userId%>&role=<%=userType%>"><button
									type="button" class="btn btn-primary">Add Review</button></a></td>

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