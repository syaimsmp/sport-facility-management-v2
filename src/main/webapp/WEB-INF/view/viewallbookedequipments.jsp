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
            <h1>Booked Equipment</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Booked Equipment</li>
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
				<%
				List<BookedEquipment> bookings = (List<BookedEquipment>) request.getAttribute("bookedEquipments");
				%>
				<div class="table-responsive">
					<table class="table">
						<thead class="custom-bg text-color">
							<tr class="text-center">
								<th scope="col">Equipment</th>
								<th scope="col">Equipment Name</th>
								<th scope="col">User Name</th>
								<th scope="col">Role</th>
								<th scope="col">Book Time</th>
								<th scope="col">End Time</th>
							</tr>
						</thead>
		
						<%
						if (bookings != null) {
							for (BookedEquipment booking : bookings) {
		
								Equipment equipment = equipmentDao.findById(booking.getEquipmentId()).get();
		
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
									src="resources/sportsimage/<%=equipment.getImagePath()%>"
									alt="facility_pic"></td>
								<td class="mid-align"><%=equipment.getName()%></td>
								<td class="mid-align"><%=stdnt != null ? stdnt.getFirstname() + " " + stdnt.getLastname()
				: stf.getFirstname() + " " + stf.getLastname()%></td>
								<td class="mid-align"><%=booking.getRole()%></td>
								<td class="mid-align"><%=Helper.millisToDateTime(booking.getBookingTime())%></td>
                <td class="mid-align">
                  <%=booking.getEndTime() != null ? Helper.millisToDateTime(booking.getEndTime()) : ""%> 
                  <%if(booking.getEndTime() != null && Helper.isBookingExceedEndTime(booking.getEndTime())){
                  %>
                    <br>
                  <span class='text-danger text-bold'>User are late in returning</span>
                  <%
                  }
                  %>
                </td>
		
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
