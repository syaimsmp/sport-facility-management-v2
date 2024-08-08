<%@page import="com.sportsfacilitymanagement.utility.Constants.FacilityOrEquipmentStatus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Equipment Status</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%
	Equipment equipment = (Equipment) request.getAttribute("equipment");
	%>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4 admin">
				<div class="card">
					<%@ include file="./components/message.jsp"%>
					<div class="card-body px-5">
						<h3 class="text-center my-3">Update equipment status</h3>
						<form action="updateequipmentStatus">
							<div class="form-group">
								<label>Equipment Id</label> <input type="text"
									class="form-control"
									name="equipmentId" value="<%=equipment.getId()%>"
									readonly required>
							</div>
							<div class="form-group">
								<label>Equipment Name</label> <input type="text"
									class="form-control" 
									placeholder="Enter facility here"
									value="<%=equipment.getName()%>" required readonly>
							</div>

                            <div class="form-group">
								<label for="status">Status</label> <select class="form-control"
									id="status" name="status" required>
									<option value="">Select Status</option>
									<%
									for (FacilityOrEquipmentStatus st : FacilityOrEquipmentStatus.values()) {
									%>
									<option value="<%=st.value()%>"><%=st.value()%></option>
									<%
									}
									%>

								</select>
							</div>

							<div class="container text-center">
								<button class="btn custom-bg text-white">Update
									Equipment</button>

							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>