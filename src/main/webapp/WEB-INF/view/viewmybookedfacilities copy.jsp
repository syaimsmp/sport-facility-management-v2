<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View My Booked Facilities</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%
	List<BookedFacility> bookings = (List<BookedFacility>) request.getAttribute("bookedFacilities");
	%>
	<div class="container-fluid mt-2">

		<div class="table-responsive">
			<table class="table">
				<thead class="custom-bg text-color">
					<tr>
						<th scope="col">Facility</th>
						<th scope="col">Facility Name</th>
						<th scope="col">Location</th>
						<th scope="col">Book Time</th>
						<th scope="col">Added Time</th>
					</tr>
				</thead>

				<%
				if (bookings != null) {
					for (BookedFacility booking : bookings) {

						Facility facility = facilityDao.findById(booking.getFacilityId()).get();

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
						<td class="mid-align"><img
							style="max-height: 100px; max-width: 70px; width: auto;"
							class="img-fluid mx-auto d-block"
							src="resources/sportsimage/<%=facility.getImagePath()%>"
							alt="facility_pic"></td>
						<td class="mid-align"><%=facility.getName()%></td>
						<td class="mid-align"><%=facility.getLocation()%></td>
						<td class="mid-align"><%=booking.getDate()%></td>
						<td class="mid-align"><%=Helper.millisToDateTime(booking.getBookingTime())%></td>


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