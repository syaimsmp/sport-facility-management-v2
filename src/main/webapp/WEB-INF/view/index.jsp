<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Home- Sports Facility Management System</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%@ include file="./components/message.jsp"%>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <style>
    .carousel-item img {
        height: 500px; /* Set this to your desired height */
        object-fit: cover; /* This ensures that the image covers the entire area without distortion */
        width: 100%; /* Ensures the image takes up the full width */
    }
  </style>
</head>
<body class="hold-transition sidebar-collapse layout-top-nav">
  <div id="carouselExampleIndicators" class="carousel slide"
  data-ride="carousel">
  <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0"
          class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
  </ol>
  <div class="carousel-inner" style="width: 100%;max-height: fit-content;">
      <div class="carousel-item active">
          <img class="d-block w-100" src="/resources/images/carousal1.jpg"
              alt="First slide">
      </div>
      <div class="carousel-item">
          <img class="d-block w-100" src="/resources/images/carousal2.jpg"
              alt="Second slide">
      </div>
      <div class="carousel-item">
          <img class="d-block w-100" src="/resources/images/carousal3.jpg"
              alt="Third slide">
      </div>
      <div class="carousel-item">
          <img class="d-block w-100" src="/resources/images/carousal4.jpg"
              alt="Fourth slide">
      </div>
      <div class="carousel-item">
          <img class="d-block w-100" src="/resources/images/carousal5.jpg"
              alt="Fifth slide">
      </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators"
      role="button" data-slide="prev"> <span
      class="carousel-control-prev-icon" aria-hidden="true"></span> <span
      class="sr-only">Previous</span>
  </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
      role="button" data-slide="next"> <span
      class="carousel-control-next-icon" aria-hidden="true"></span> <span
      class="sr-only">Next</span>
  </a>
</div>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
      <div class="container mt-2">
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="row">
                    <div class="col-12 order-2 order-md-1">
                      <div class="row">
                      <div class="col-12 col-sm-4">
                      <div class="info-box bg-light">
                      <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">Estimated Users</span>
                      <span class="info-box-number text-center text-muted mb-0">2300</span>
                      </div>
                      </div>
                      </div>
                      <div class="col-12 col-sm-4">
                      <div class="info-box bg-light">
                      <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">Total amount spent</span>
                      <span class="info-box-number text-center text-muted mb-0">RM 20, 000</span>
                      </div>
                      </div>
                      </div>
                      <div class="col-12 col-sm-4">
                      <div class="info-box bg-light">
                      <div class="info-box-content">
                      <span class="info-box-text text-center text-muted">Estimated project duration</span>
                      <span class="info-box-number text-center text-muted mb-0">200 hrs</span>
                      </div>
                      </div>
                      </div>
                      </div>
                    </div>
                </div>
                <hr>
                <h2 class="text-center"><b>Latest News</b></h2>
                <div class="row">
                  <%@ include file="./components/iklan.jsp" %>
                </div>
                <hr>
                <h2 class="text-center"><b>About Us</b></h2>
                <div class="row">
                  <%@ include file="./components/about_us.jsp" %>
                </div>
              </div>
            </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
</body>
</html>
