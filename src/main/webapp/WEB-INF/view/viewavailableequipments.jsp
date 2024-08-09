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
            <h1>View Available Equipment</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Contacts</li>
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
            <div class="col-12 align-items-stretch flex-column">
				<div class="table-responsive">
					<table class="table">
						<thead class="custom-bg text-color">
		
							<tr>
								<th scope="col">Equipment Image</th>
								<th scope="col">Equipment Name</th>
								<th scope="col">Equipment Category</th>
								<th scope="col">Total Quantity</th>
								<th scope="col">Action</th>
							</tr>
		
		
		
		
						</thead>
		
						<%
						List<Equipment> allEquipments = new ArrayList<>();
		
						allEquipments = (List<Equipment>) request.getAttribute("equipments");
		
						if (allEquipments != null) {
							for (Equipment equipment : allEquipments) {
						%>
						<tbody>
							<tr class="text-center">
								<td class="mid-align"><img
									style="max-height: 100px; max-width: 70px; width: auto;"
									class="img-fluid mx-auto d-block"
									src="resources/sportsimage/<%=equipment.getImagePath()%>"
									alt="equipment_pic"></td>
								<td class="mid-align"><%=equipment.getName()%></td>
								<td class="mid-align"><%=equipment.getCategory()%></td>
								<td class="mid-align"><%=equipment.getTotalQuantity()%></td>
		
								<td class="mid-align"><a
									href="bookequipment?equipmentId=<%=equipment.getId()%>&role=<%=userType%>&userId=<%=userId%>"><button
											type="button" class="btn btn-primary">Book Equipment</button></a> <a
									href="addEquipmentReview?equipmentId=<%=equipment.getId()%>&role=<%=userType%>&userId=<%=userId%>"><button
											type="button" class="btn btn-primary">Add Review</button></a></td>
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
