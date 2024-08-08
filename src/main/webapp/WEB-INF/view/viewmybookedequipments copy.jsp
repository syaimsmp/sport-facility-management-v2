<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View My Booked Equipments</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%
	List<BookedEquipment> bookings = (List<BookedEquipment>) request.getAttribute("bookedEquipments");
	%>
	<div class="container-fluid mt-2">

		<div class="table-responsive">
			<table class="table">
				<thead class="custom-bg text-color">
					<tr>
						<th scope="col">Equipment</th>
						<th scope="col">Equipment Name</th>
						<th scope="col">Category</th>
						<th scope="col">Book Time</th>
						<th scope="col">Added Time</th>
					</tr>
				</thead>

				<%
				if (bookings != null) {
					for (BookedEquipment booking : bookings) {

						Equipment equipment = equipmentDao.findById(booking.getEquipmentId()).get();

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
							src="resources/sportsimage/<%=equipment.getImagePath()%>"
							alt="facility_pic"></td>
						<td class="mid-align"><%=equipment.getName()%></td>
						<td class="mid-align"><%=equipment.getCategory()%></td>
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