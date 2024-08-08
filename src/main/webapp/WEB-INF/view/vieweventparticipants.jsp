<%@page
	import="com.sportsfacilitymanagement.utility.Constants.EventBookingStatus"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
  <%@ include file="./components/message.jsp"%>

  <!-- /.navbar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>View Event Participants</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Event Participants</li>
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
				<div class="table-responsive">
					<table class="table">
						<thead class="custom-bg text-color">
		
							<tr>
								<th scope="col">User Name</th>
								<th scope="col">Role</th>
								<th scope="col">Booking Time</th>
								<th scope="col">Status</th>
								<th scope="col">Action</th>
							</tr>
		
		
		
		
						</thead>
		
						<%
						List<BookedEvent> bookings = new ArrayList<>();
		
						bookings = (List<BookedEvent>) request.getAttribute("bookedEvents");
		
						if (bookings != null) {
							for (BookedEvent booking : bookings) {
								Event event = eventDao.findById(booking.getEventId()).get();
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
								<td class="mid-align"><%=stdnt != null ? stdnt.getFirstname() + " " + stdnt.getLastname()
				: stf.getFirstname() + " " + stf.getLastname()%></td>
								<td class="mid-align"><%=booking.getRole()%></td>
								<td class="mid-align"><%=Helper.millisToDateTime(booking.getBookingTime())%></td>
								<td class="mid-align"><%=booking.getStatus()%></td>
		
								<%
								if (booking.getStatus().equals(EventBookingStatus.PENDING.value())) {
								%>
								<td class="mid-align"><a
									href="updateBookingStatus?bookingId=<%=booking.getId()%>&status=<%=EventBookingStatus.APPROVED.value()%>"><button
											type="button" class="btn btn-success">Approve</button></a> <a
									href="updateBookingStatus?bookingId=<%=booking.getId()%>&status=<%=EventBookingStatus.REJECT.value()%>"><button
											type="button" class="btn btn-danger">Reject</button></a></td>
		
								<%
								} else if (booking.getStatus().equals(EventBookingStatus.APPROVED.value()) && userType.equals("admin")) {
								%>
								<td class="mid-align"><a
									href="viewparticipantreviews?eventId=<%=booking.getEventId()%>"><button
											type="button" class="btn btn-primary">View Reviews</button></a></td>
								<%
								} else if(booking.getStatus().equals(EventBookingStatus.APPROVED.value())) {
								%>
								<td class="mid-align"><a
									href="addparticipantreview?participantId=<%=booking.getParticipantId()%>&role=<%=booking.getRole()%>&eventId=<%=booking.getEventId()%>&hosteventId=<%=booking.getEventId()%>Id=<%=userId%>"><button
											type="button" class="btn btn-primary">Add Review</button></a></td>
								<%
								}
								%>
		
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
