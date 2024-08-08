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
            <h1>View Facility Reviews</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">View Facility Reviews</li>
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
					<%
					List<ReviewFacility> reviews = (List<ReviewFacility>) request.getAttribute("reviews");
					%>
					<table class="table">
						<thead class="custom-bg text-color">
							<tr class="text-center">
								<th scope="col">Reviewer</th>
								<th scope="col">Role</th>
								<th scope="col">Review</th>
								<th scope="col">Added Time</th>
							</tr>
						</thead>
		
						<%
						if (reviews != null) {
							for (ReviewFacility review : reviews) {
		
								Student stdnt = null;
								Staff stf = null;
		
								if (review.getRole().equals("student")) {
							stdnt = studentDao.findById(review.getParticipantId()).get();
								} else {
							stf = staffDao.findById(review.getParticipantId()).get();
								}
						%>
						<tbody>
							<tr class="text-center">
		
								<td class="mid-align"><%=stdnt != null ? stdnt.getFirstname() + " " + stdnt.getLastname()
				: stf.getFirstname() + " " + stf.getLastname()%></td>
								<td class="mid-align"><%=review.getRole()%></td>
								<td class="mid-align"><%=review.getReview()%></td>
								<td class="mid-align"><%=Helper.millisToDateTime(review.getAddedTime())%></td>
		
		
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
