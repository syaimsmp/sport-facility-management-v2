<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Equipments</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<div class="container-fluid mt-2">

		<div class="table-responsive">
			<table class="table">
				<thead class="custom-bg text-color">
					<tr>
						<th scope="col">Equipment</th>
						<th scope="col">Equipment Name</th>
						<th scope="col">Category</th>
						<th scope="col">Total Quantity</th>
						<th scope="col">Status</th>
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
						<td class="mid-align"><%=equipment.getStatus()%></td>
						<td class="mid-align"><a
							href="updateEquipment?equipmentId=<%=equipment.getId()%>"><button
									type="button" class="btn btn-primary">Update Details</button></a> <a
							href="updateEquipmentStatus?equipmentId=<%=equipment.getId()%>"><button
									type="button" class="btn btn-primary">Update Status</button></a> <a
							href="viewequipmentreviews?equipmentId=<%=equipment.getId()%>"><button
									type="button" class="btn btn-primary">Reviews</button></a></td>
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