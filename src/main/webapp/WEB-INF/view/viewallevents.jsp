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
      <div class="container">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>All Events</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">All Events</li>
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
							<div class="table-responsive">
								<table class="table">
									<thead class="custom-bg text-color">
					
										<tr>
											<th scope="col">Event Name</th>
											<th scope="col">Host Name</th>
											<th scope="col">Host Role</th>
											<th scope="col">Facility Name</th>
											<th scope="col">Open For Public</th>
											<th scope="col">Min Participant</th>
											<th scope="col">Max Participant</th>
											<th scope="col">Venue</th>
											<th scope="col">Event Time</th>
											<th scope="col">Action</th>
										</tr>
									</thead>
					
									<%
									List<Event> events = new ArrayList<>();
					
									events = (List<Event>) request.getAttribute("events");
					
									if (events != null) {
										for (Event event : events) {
											Facility facility = facilityDao.findById(event.getFacilityId()).get();
					
											Student stdnt = null;
											Staff stf = null;
					
											if (event.getRole().equals("student")) {
										stdnt = studentDao.findById(event.getHostId()).get();
											} else {
										stf = staffDao.findById(event.getHostId()).get();
											}
									%>
									<tbody>
										<tr class="text-center">
					
											<td class="mid-align"><%=event.getName()%></td>
											<td class="mid-align"><%=stdnt != null ? stdnt.getFirstname() + " " + stdnt.getLastname()
							: stf.getFirstname() + " " + stf.getLastname()%></td>
											<td class="mid-align"><%=event.getRole()%></td>
											<td class="mid-align"><%=facility.getName()%></td>
											<td class="mid-align"><%=event.getOpenToPublic()%></td>
											<td class="mid-align"><%=event.getMinParticipant()%></td>
											<td class="mid-align"><%=event.getMaxParticipant()%></td>
											<td class="mid-align"><%=event.getVenue()%></td>
											<td class="mid-align"><%=event.getDateTime()%></td>
					
											<%
											if (userType.equals("admin")) {
											%>
											<td class="mid-align"><a
												href="vieweventparticipants?eventId=<%=event.getId()%>"><button
														type="button" class="btn btn-primary">View Participant</button></a>
												<a href="vieweventreviews?eventId=<%=event.getId()%>"><button
														type="button" class="btn btn-primary">View Reviews</button></a></td>
											<%
											} else {
											%>
											<td class="mid-align"><a
												href="applyForEvent?eventId=<%=event.getId()%>&userId=<%=userId%>&role=<%=userType%>"><button
														type="button" class="btn btn-primary">Apply</button></a></td>
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
