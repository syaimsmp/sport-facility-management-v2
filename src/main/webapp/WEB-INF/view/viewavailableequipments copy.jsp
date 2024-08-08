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
						<th scope="col">Equipment Image</th>
						<th scope="col">Equipment Name</th>
						<th scope="col">Equipment Category</th>
						<th scope="col">Total Quantity</th>
						<th scope="col">Action</th>
					</tr>




				</thead>

				<%
				List<Equipment> allEquipments = new ArrayList<>();

				allEquipments = (List<Equipment>) request.getAttribute("equipments");

				if (allEquipments != null) {
					for (Equipment equipment : allEquipments) {
				%>
				<tbody>
					<tr class="text-center">
						<td class="mid-align"><img
							style="max-height: 100px; max-width: 70px; width: auto;"
							class="img-fluid mx-auto d-block"
							src="resources/sportsimage/<%=equipment.getImagePath()%>"
							alt="equipment_pic"></td>
						<td class="mid-align"><%=equipment.getName()%></td>
						<td class="mid-align"><%=equipment.getCategory()%></td>
						<td class="mid-align"><%=equipment.getTotalQuantity()%></td>

						<td class="mid-align"><a
							href="bookequipment?equipmentId=<%=equipment.getId()%>&role=<%=userType%>&userId=<%=userId%>"><button
									type="button" class="btn btn-primary">Book Equipment</button></a> <a
							href="addEquipmentReview?equipmentId=<%=equipment.getId()%>&role=<%=userType%>&userId=<%=userId%>"><button
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