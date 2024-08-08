<%@page
	import="com.sportsfacilitymanagement.utility.Constants.OpenForPublicStatus"%>
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
            <h1>Add Event</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Add Event</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body pb-0">
          <div class="row">
            <div class="col-12 d-flex align-items-stretch flex-column">
				<%@ include file="./components/message.jsp"%>
				<h3 class="text-center my-3">Add Event</h3>
				<form action="/addEvent" method="post">
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

						<button class="btn btn-primary btn-block">
							<b>Add Event</b>
						</button>
				</form>
            </div>
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
