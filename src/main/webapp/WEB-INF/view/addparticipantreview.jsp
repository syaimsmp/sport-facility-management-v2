<%@page
	import="com.sportsfacilitymanagement.utility.Constants.FacilityOrEquipmentStatus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Event Participant Review</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%
	Integer eventId = (Integer) request.getAttribute("eventId");
	Integer participantId = (Integer) request.getAttribute("participantId");
	String role = (String) request.getAttribute("role");

	/* Integer userId = (Integer) request.getAttribute("userId"); */
	%>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4 admin">
				<div class="card">
					<%@ include file="./components/message.jsp"%>
					<div class="card-body px-5">
						<h3 class="text-center my-3">Add Event Participant Review</h3>
						<form action="addParticipantReview">
							<input type="hidden" name="eventId" value="<%=eventId%>">
							<input type="hidden" name="participantId"
								value="<%=participantId%>"> <input type="hidden"
								name="role" value="<%=role%>">

							<div class="form-group">
								<label>Review</label> <input type="text" class="form-control"
									placeholder="write review..." name="review" required>
							</div>

							<div class="container text-center">
								<button class="btn custom-bg text-white">Add Review</button>

							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>