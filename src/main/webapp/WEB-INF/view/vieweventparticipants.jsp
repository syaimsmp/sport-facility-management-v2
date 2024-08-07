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
						<th scope="col">User Name</th>
						<th scope="col">Role</th>
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
						Student stdnt = null;
						Staff stf = null;

						if (booking.getRole().equals("student")) {
					stdnt = studentDao.findById(booking.getParticipantId()).get();
						} else {
					stf = staffDao.findById(booking.getParticipantId()).get();
						}
				%>
				<tbody>
					<tr class="text-center">
						<td class="mid-align"><%=stdnt != null ? stdnt.getFirstname() + " " + stdnt.getLastname()
		: stf.getFirstname() + " " + stf.getLastname()%></td>
						<td class="mid-align"><%=booking.getRole()%></td>
						<td class="mid-align"><%=Helper.millisToDateTime(booking.getBookingTime())%></td>
						<td class="mid-align"><%=booking.getStatus()%></td>

						<%
						if (booking.getStatus().equals(EventBookingStatus.PENDING.value())) {
						%>
						<td class="mid-align"><a
							href="updateBookingStatus?bookingId=<%=booking.getId()%>&status=<%=EventBookingStatus.APPROVED.value()%>"><button
									type="button" class="btn btn-success">Approve</button></a> <a
							href="updateBookingStatus?bookingId=<%=booking.getId()%>&status=<%=EventBookingStatus.REJECT.value()%>"><button
									type="button" class="btn btn-danger">Reject</button></a></td>

						<%
						} else if (booking.getStatus().equals(EventBookingStatus.APPROVED.value()) && userType.equals("admin")) {
						%>
						<td class="mid-align"><a
							href="viewparticipantreviews?eventId=<%=booking.getEventId()%>"><button
									type="button" class="btn btn-primary">View Reviews</button></a></td>
						<%
						} else if(booking.getStatus().equals(EventBookingStatus.APPROVED.value())) {
						%>
						<td class="mid-align"><a
							href="addparticipantreview?participantId=<%=booking.getParticipantId()%>&role=<%=booking.getRole()%>&eventId=<%=booking.getEventId()%>&hosteventId=<%=booking.getEventId()%>Id=<%=userId%>"><button
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