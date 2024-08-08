<%@page
	import="com.sportsfacilitymanagement.utility.Constants.EventBookingStatus"%>
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
            <h1>Update Equipment</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Update Equipment</li>
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
            <div class="col-12 align-items-stretch flex-column">		
				<%
				Equipment equipment = (Equipment) request.getAttribute("equipment");
				%>
				<h3 class="text-center my-3">Update Equipment</h3>
				<form action="/updateequipment" method="post"
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

					<div class="text-center my-2">
						<button class="btn btn-primary btn-block">Update
							Equipment</button>
							<a href="/viewequipments" class="btn btn-block mt-1 btn-danger">Cancel</a>
					</div>
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
