
<%@ page import="com.sportsfacilitymanagement.model.*"%>
<%@ page import="com.sportsfacilitymanagement.utility.*"%>
<%@ page import="com.sportsfacilitymanagement.dao.*"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page
    import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>


<%
String userType = (String) session.getAttribute("user-login");
Admin admin = null;
Student student = null;
Staff staff = null;

if (userType != null && userType.equals("admin")) {
    admin = (Admin) session.getAttribute("active-user");
}

else if (userType != null && userType.equals("student")) {
    student = (Student) session.getAttribute("active-user");
}

else if (userType != null && userType.equals("staff")) {
    staff = (Staff) session.getAttribute("active-user");
}

Integer userId = student == null && staff == null ? 0 : student != null ? student.getId() : staff.getId();

ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
StudentDao studentDao = context.getBean(StudentDao.class);
StaffDao staffDao = context.getBean(StaffDao.class);
BookedEquipmentDao bookedEquipmentDao = context.getBean(BookedEquipmentDao.class);
EventDao eventDao = context.getBean(EventDao.class);
BookedEventDao bookedEventDao = context.getBean(BookedEventDao.class);
FacilityDao facilityDao = context.getBean(FacilityDao.class);
EquipmentDao equipmentDao = context.getBean(EquipmentDao.class);
BookedFacilityDao bookedFacilityDao = context.getBean(BookedFacilityDao.class);
ReviewEquipmentDao reviewEquipmentDao = context.getBean(ReviewEquipmentDao.class);
ReviewEventDao reviewEventDao = context.getBean(ReviewEventDao.class);
ReviewFacilityDao reviewFacilityDao = context.getBean(ReviewFacilityDao.class);
ReviewEventParticipantDao reviewEventParticipantDao = context.getBean(ReviewEventParticipantDao.class);
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Registration Page</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">

  <!-- Toastr -->
<link rel="stylesheet" href="/plugins/toastr/toastr.min.css">
   
<!-- Toastr -->
<script src="/plugins/toastr/toastr.min.js"></script>
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
        <a href="/" class="h1"><b>Sports Facility Management </b>System</a>
    </div>
    <div class="card-body">
        <img src="/resources/images/loginlogo.png" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
      <p class="login-box-msg">Register a new membership</p>
      <%@ include file="./components/message.jsp"%>

      <form action="register" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="firstname" placeholder="First name" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="lastname" placeholder="Last name" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" name="emailid" class="form-control" placeholder="Email" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
            <input type="password" name="password" class="form-control" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" >
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="Retype password">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>
          </div>
        <div class="input-group mb-3">
          <input type="text" name="mobileno" class="form-control" placeholder="Mobile No." required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-phone"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" name="street" class="form-control" placeholder="Street" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-truck"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" name="city" class="form-control" placeholder="City" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-truck"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="number" name="pincode" class="form-control" placeholder="Pin Code" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-truck"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">Register</button>
          </div>
          <!-- /.col -->
          <div class="col-12 mt-1">
            <a href="/" class="btn btn-danger btn-block" >Cancel</a>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <a href="login" class="text-center">I already have a membership</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
</body>
</html>
