<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Available Facilities</title>
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
						<th scope="col">Facility Image</th>
						<th scope="col">Facility Name</th>
						<th scope="col">Facility Description</th>
						<th scope="col">Location</th>
						<th scope="col">Action</th>
					</tr>




				</thead>

				<%
				List<Facility> allFacilities = new ArrayList<>();

				allFacilities = (List<Facility>) request.getAttribute("facilities");

				if (allFacilities != null) {
					for (Facility facility : allFacilities) {
				%>
				<tbody>
					<tr class="text-center">
						<td class="mid-align"><img
							style="max-height: 100px; max-width: 70px; width: auto;"
							class="img-fluid mx-auto d-block"
							src="resources/sportsimage/<%=facility.getImagePath()%>"
							alt="facility_pic"></td>
						<td class="mid-align"><%=facility.getName()%></td>
						<td class="mid-align"><%=facility.getDescription()%></td>
						<td class="mid-align"><%=facility.getLocation()%></td>

						<td class="mid-align"><a
							href="bookfacility?facilityId=<%=facility.getId()%>&role=<%=userType%>&userId=<%=userId%>"><button
									type="button" class="btn btn-primary">Book Facility</button></a> <a
							href="addFacilityReview?facilityId=<%=facility.getId()%>&role=<%=userType%>&userId=<%=userId%>"><button
									type="button" class="btn btn-primary">Add Review</button></a></td>
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