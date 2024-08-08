<%@page
	import="com.sportsfacilitymanagement.utility.Constants.FacilityOrEquipmentStatus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sports Facility Management System</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-collapse">
<!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <%@ include file="./components/navbar.jsp"%>

  <!-- /.navbar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Book Facility</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="viewAvailableFacility">Available Facilities</a></li>
              <li class="breadcrumb-item active">Book Facility</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
		<%
		Facility facility = (Facility) request.getAttribute("facility");
		%>

      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body pb-0">
          <div class="row">
            <div class="col-12 ">
				<%@ include file="./components/message.jsp"%>
				<h3 class="text-center my-3">Book Facility</h3>
				<form action="bookFacility">
					<input type="hidden" name="facilityId"
						value="<%=facility.getId()%>"> 
					<input type="hidden" name="userId" value="<%=userId%>"> 
					<input type="hidden" name="role" value="<%=userType%>">
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

					<div class="mb-1 text-center">
						<button class="btn btn-block btn-primary">Book Facility</button>
					</div>
				</form>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>