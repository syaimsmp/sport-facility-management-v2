<%@page
	import="com.sportsfacilitymanagement.utility.Constants.FacilityOrEquipmentStatus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Facility</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%
	Facility facility = (Facility) request.getAttribute("facility");
	/* Integer userId = (Integer) request.getAttribute("userId"); */
	%>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4 admin">
				<div class="card">
					<%@ include file="./components/message.jsp"%>
					<div class="card-body px-5">
						<h3 class="text-center my-3">Book Facility</h3>
						<form action="/bookFacility" method="post">
							<input type="hidden" name="facilityId"
								value="<%=facility.getId()%>"> <input type="hidden"
								name="userId" value="<%=userId%>"> <input type="hidden"
								name="role" value="<%=userType%>">
							<div class="form-group">
								<label>Facility Name</label> <input type="text"
									class="form-control" placeholder="Enter facility here"
									value="<%=facility.getName()%>" required readonly>
							</div>

							<div class="form-group">
								<label>Facility Description</label>
								<textarea style="height: 150px" class="form-control"
									placeholder="Enter Facility Description here" required readonly><%=facility.getDescription()%>
									</textarea>
							</div>

							<div class="form-group">
								<label>Location</label> <input type="text" class="form-control"
									placeholder="Enter location here"
									value="<%=facility.getLocation()%>" required readonly>
							</div>

							<div class="form-group">
								<label>Select Date</label> <input type="date"
									class="form-control" placeholder="select book date..."
									name="date" required>
							</div>

							<div class="container text-center">
								<button class="btn custom-bg text-white">Book Facility</button>

							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>