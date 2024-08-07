
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


<!-- Navbar -->
  <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
    <div class="container">
      <a href="/" class="navbar-brand">
        <img style="max-width:10%"  src="resources/images/mainlogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Sports Facility Management System</span>
      </a>

      <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Right navbar links -->
      <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
          <li class="nav-item">
            <a href="/" class="nav-link">Home</a>
          </li>
          <li class="nav-item">
            <a href="/contact" class="nav-link">Contact</a>
          </li>
		  <%
			if (userType != null) {
			%>
      <li class="nav-item dropdown">
        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Dropdown</a>
        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
          <li><a href="#" class="dropdown-item">Some action </a></li>
          <li><a href="#" class="dropdown-item">Some other action</a></li>

          <li class="dropdown-divider"></li>

          <!-- Level two dropdown-->
          <li class="dropdown-submenu dropdown-hover">
            <a id="dropdownSubMenu2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">Hover for action</a>
            <ul aria-labelledby="dropdownSubMenu2" class="dropdown-menu border-0 shadow">
              <li>
                <a tabindex="-1" href="#" class="dropdown-item">level 2</a>
              </li>

              <!-- Level three dropdown-->
              <li class="dropdown-submenu">
                <a id="dropdownSubMenu3" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">level 2</a>
                <ul aria-labelledby="dropdownSubMenu3" class="dropdown-menu border-0 shadow">
                  <li><a href="#" class="dropdown-item">3rd level</a></li>
                  <li><a href="#" class="dropdown-item">3rd level</a></li>
                </ul>
              </li>
              <!-- End Level three -->

              <li><a href="#" class="dropdown-item">level 2</a></li>
              <li><a href="#" class="dropdown-item">level 2</a></li>
            </ul>
          </li>
          <!-- End Level two -->
        </ul>
      </li>
      <%
			} 
      else {
      %>
          <li class="nav-item dropdown">
            <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Login</a>
            <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
              <li><a href="/admin/login" class="dropdown-item">Admin</a></li>
              <li><a href="/staff/login" class="dropdown-item">Staff</a></li>
              <li><a href="/student/login" class="dropdown-item">Student </a></li>  
            </ul>
          </li>
		  <%
			} 
		  %>
      </ul>
    </div>
  </nav>
  <!-- /.navbar -->