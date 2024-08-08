<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Equipment</title>
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
						<h3 class="text-center my-3">Update Equipment</h3>
						<form action="updateequipment" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label>Equipment Id</label> <input type="text"
									class="form-control" name="equipmentId" required readonly
									value="<%=equipment.getId()%>">
							</div>

							<div class="form-group">
								<label>Equipment Name</label> <input type="text"
									class="form-control" name="name"
									placeholder="Enter equipment here"
									value="<%=equipment.getName()%>" required>
							</div>

							<div class="form-group">
								<label>Equipment Quantity</label> <input type="text"
									class="form-control" name="totalQuantity"
									placeholder="Enter quantity here"
									value="<%=equipment.getTotalQuantity()%>" required>
							</div>

							<div class="form-group">
								<label>Select Category</label> <select name="category"
									class="form-control" required>
									<option value="">Category</option>

									<option value="Ball">Ball</option>
									<option value="Racket">Racket</option>

								</select>
							</div>

							<div class="form-group">
								<label>Select Equipment Pic</label><br> <input type="file"
									class="form-control" name="image" required>
							</div>

							<div class="container text-center">
								<button class="btn custom-bg text-color">Update
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