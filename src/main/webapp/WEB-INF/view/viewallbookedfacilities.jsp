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
      <div class="container">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>View All Booked Facility</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="viewAvailableFacility">Available Facilities</a></li>
              <li class="breadcrumb-item active">View All Booked Facility</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container -->
    </section>

    <!-- Main content -->
    <section class="content">
		<%
		List<BookedFacility> bookings = (List<BookedFacility>) request.getAttribute("bookedFacilities");
		%>

      <div class="container mt-2">
              <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body">
          <div class="row">
            <div class="col-12 ">
				<%@ include file="./components/message.jsp"%>
				<div class="table-responsive">
					<table class="table">
						<thead class="custom-bg text-color">
							<tr>
								<th scope="col">Facility</th>
								<th scope="col">Facility Name</th>
								<th scope="col">User Name</th>
								<th scope="col">Role</th>
								<th scope="col">Book Time</th>
								<th scope="col">Added Time</th>
							</tr>
						</thead>
		
						<%
						if (bookings != null) {
							for (BookedFacility booking : bookings) {
		
								Facility facility = facilityDao.findById(booking.getFacilityId()).get();
		
								Student stdnt = null;
								Staff stf = null;
		
								if (booking.getRole().equals("student")) {
							stdnt = studentDao.findById(booking.getParticipantId()).get();
								} else {
							stf = staffDao.findById(booking.getParticipantId()).get();
								}
						%>
						<tbody>
							<tr class="text-center">
								<td class="mid-align"><img
									style="max-height: 100px; max-width: 70px; width: auto;"
									class="img-fluid mx-auto d-block"
									src="resources/sportsimage/<%=facility.getImagePath()%>"
									alt="facility_pic"></td>
								<td class="mid-align"><%=facility.getName()%></td>
								<td class="mid-align"><%=stdnt != null ? stdnt.getFirstname() + " " + stdnt.getLastname()
				: stf.getFirstname() + " " + stf.getLastname()%></td>
								<td class="mid-align"><%=booking.getRole()%></td>
								<td class="mid-align"><%=booking.getDate()%></td>
								<td class="mid-align"><%=Helper.millisToDateTime(booking.getBookingTime())%></td>
		
		
							</tr>
						</tbody>
						<%
						}
						}
						%>
					</table>
				</div>
          </div>
        </div>
        <!-- /.card-body -->
        </div>
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