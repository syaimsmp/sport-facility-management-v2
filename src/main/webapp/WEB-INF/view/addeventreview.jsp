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
  <%
  Event event = (Event) request.getAttribute("event");
  /* Integer userId = (Integer) request.getAttribute("userId"); */
  %>
  <!-- /.navbar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add Event Review</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Add Event Review</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container -->
    </section>

    <!-- Main content -->
    <section class="content">

		<div class="container mt-2">
			      <!-- Default box -->
				  <div class="card card-solid">
					<div class="card-body">
					  <div class="row">
						<div class="col-12 d-flex align-items-stretch flex-column">
							<%@ include file="./components/message.jsp"%>
							<h3 class="text-center my-3">Add Event Review</h3>
							<form action="/addEventReview">
								<input type="hidden" name="eventId" value="<%=event.getId()%>">
								<input type="hidden" name="userId" value="<%=userId%>"> <input
									type="hidden" name="role" value="<%=userType%>">
								<div class="form-group">
									<label>Event Name</label> <input type="text"
										class="form-control" placeholder="Enter facility here"
										value="<%=event.getName()%>" required readonly>
								</div>
	
								<div class="form-group">
									<label>Event Date</label> <input type="text"
										class="form-control" placeholder="Enter location here"
										value="<%=event.getDateTime()%>" required readonly>
								</div>
	
								<div class="form-group">
									<label>Review</label> <input type="text" class="form-control"
										placeholder="write review..." name="review" required>
								</div>
	
								<div class="container text-center">
									<button class="btn btn-block btn-primary">Add Review</button>
									<a href="/viewallevents" class="btn btn-danger mt-1 btn-block">Cancel</a>
								</div>
							</form>
						</div>
					  </div>
					</div>
					<!-- /.card-body -->
				  </div>
				  <!-- /.card -->
			
		</div>
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
