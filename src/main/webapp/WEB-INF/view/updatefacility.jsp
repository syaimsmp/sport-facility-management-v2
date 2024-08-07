<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Facility</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%
	Facility facility = (Facility) request.getAttribute("facility");
	%>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4 admin">
				<div class="card">
					<%@ include file="./components/message.jsp"%>
					<div class="card-body px-5">
						<h3 class="text-center my-3">Update Facility</h3>
						<form action="updateFacility" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>Facility Id</label> <input type="text"
									class="form-control" name="facilityId"
									placeholder="Enter Facility Id" value="<%=facility.getId()%>"
									readonly required>
							</div>
							<div class="form-group">
								<label>Facility Name</label> <input type="text"
									class="form-control" name="name"
									placeholder="Enter facility here"
									value="<%=facility.getName()%>" required>
							</div>

							<div class="form-group">
								<label>Facility Description</label>
								<textarea style="height: 150px" class="form-control"
									name="description"
									placeholder="Enter Facility Description here" required><%=facility.getDescription()%>
									</textarea>
							</div>

							<div class="form-group">
								<label>Location</label> <input type="text" class="form-control"
									name="location" placeholder="Enter location here"
									value="<%=facility.getLocation()%>" required>
							</div>


							<div class="form-group">
								<label>Select Facility Pic</label><br> <input type="file"
									class="form-control" name="image" required>
							</div>

							<div class="container text-center">
								<button class="btn custom-bg text-white">Update
									Facility</button>

							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>