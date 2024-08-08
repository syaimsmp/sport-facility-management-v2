<%@page
	import="com.sportsfacilitymanagement.utility.Constants.OpenForPublicStatus"%>
<%@page
	import="com.sportsfacilitymanagement.utility.Constants.FacilityOrEquipmentStatus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Event</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4 admin">
				<div class="card">
					<%@ include file="./components/message.jsp"%>
					<div class="card-body px-5">

						<h3 class="text-center my-3">Add Event</h3>
						<form action="addEvent" method="post">
							<input type="hidden" name="hostId" value="<%=userId%>"> <input
								type="hidden" name="role" value="<%=userType%>">

							<div class="form-group">
								<label>Event Name</label> <input type="text"
									class="form-control" name="name"
									placeholder="Enter event name here" required>
							</div>

							<div class="form-group">
								<label>Select Facility</label> <select name="facilityId"
									class="form-control" required>
									<option value="">Facility</option>

									<%
									for (Facility facility : facilityDao.findByStatus(FacilityOrEquipmentStatus.AVAILABLE.value())) {
									%>
									<option value="<%=facility.getId()%>"><%=facility.getName()%></option>
									<%
									}
									%>

								</select>
							</div>

							<div class="form-group">
								<label>Is Event Open for Public?</label> <select
									name=openToPublic class="form-control" required>
									<option value="">Open for Public</option>

									<%
									for (OpenForPublicStatus s : OpenForPublicStatus.values()) {
									%>
									<option value="<%=s.value()%>"><%=s.value()%></option>
									<%
									}
									%>

								</select>
							</div>


							<div class="form-group">
								<label>Venue</label> <input type="text" class="form-control"
									name="venue" placeholder="Enter venue here" required>
							</div>

							<div class="form-group">
								<label>Event Time</label> <input type="datetime-local"
									class="form-control" name="dateTime" required>
							</div>

							<div class="form-group">
								<label>Min Participant</label> <input type="number"
									class="form-control" name="minParticipant"
									placeholder="Enter min participant here" required>
							</div>

							<div class="form-group">
								<label>Max Participant</label> <input type="number"
									class="form-control" name="maxParticipant"
									placeholder="Enter max participant here" required>
							</div>

							<div class="container text-center">
								<button class="btn custom-bg text-color">
									<b>Add Event</b>
								</button>
							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>