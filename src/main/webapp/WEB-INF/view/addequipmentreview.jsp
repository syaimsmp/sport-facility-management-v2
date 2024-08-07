<%@page
	import="com.sportsfacilitymanagement.utility.Constants.FacilityOrEquipmentStatus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Equipment Review</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%
	Equipment equipment = (Equipment) request.getAttribute("equipment");
	/* Integer userId = (Integer) request.getAttribute("userId"); */
	%>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4 admin">
				<div class="card">
					<%@ include file="./components/message.jsp"%>
					<div class="card-body px-5">
						<h3 class="text-center my-3">Add Equipment Review</h3>
						<form action="addequipmentreview">
							<input type="hidden" name="equipmentId"
								value="<%=equipment.getId()%>"> <input type="hidden"
								name="userId" value="<%=userId%>"> <input type="hidden"
								name="role" value="<%=userType%>">
							<div class="form-group">
								<label>Equipment Name</label> <input type="text"
									class="form-control" placeholder="Enter equipment here"
									value="<%=equipment.getName()%>" required readonly>
							</div>

							<div class="form-group">
								<label>Category</label> <input type="text" class="form-control"
									placeholder="Enter location here"
									value="<%=equipment.getCategory()%>" required readonly>
							</div>

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