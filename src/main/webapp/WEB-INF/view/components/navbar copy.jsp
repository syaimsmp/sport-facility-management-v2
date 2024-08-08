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

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

	<div class="container-fluid">
		<img src="resources/images/mainlogo.png" width="40"
			class="d-inline-block align-top" alt=""> <a
			class="navbar-brand" href="/"><h3 class="text-color">
				<i>Sports Facility Management System</i>
			</h3></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">


			<%
			if (userType != null) {
			%>
			<ul class="navbar-nav ml-auto">

				<%
				if (userType.equals("admin")) {
				%>

				<li class="nav-item dropdown active text-dark"><a
					class="nav-link dropdown-toggle text-dark" href="addFacility"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Facility </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="addFacility">Add Facility</a> <a
							class="dropdown-item" href="viewFacilities">View Facility</a> <a
							class="dropdown-item" href="viewAllBookedFacilities">Booked
							Facility</a>
					</div></li>

				<li class="nav-item dropdown active text-dark"><a
					class="nav-link dropdown-toggle text-dark" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Equipment </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="addEquipment">Add Equipment</a> <a
							class="dropdown-item" href="viewequipments">View Equipment</a> <a
							class="dropdown-item" href="viewAllBookedEquipments">Booked
							Equipment</a>
					</div></li>

				<li class="nav-item dropdown active text-dark"><a
					class="nav-link dropdown-toggle text-dark" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Events </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="viewallevents">All Events</a>
					</div></li>

				<li class="nav-item dropdown active text-dark"><a
					class="nav-link dropdown-toggle text-dark" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Users </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="viewstudents">View Students</a> <a
							class="dropdown-item" href="viewstaffs">View Staffs</a>
					</div></li>


				<%
				} else if (userType.equals("student") || userType.equals("staff")) {
				%>
				<li class="nav-item dropdown active text-dark"><a
					class="nav-link dropdown-toggle text-dark" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Facility </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="viewAvailableFacility">View All
							Facilities</a> <a class="dropdown-item"
							href="viewmybookedFacility?userId=<%=userId%>&role=<%=userType%>">My
							Booked Facilities</a>
					</div></li>

				<li class="nav-item dropdown active text-dark"><a
					class="nav-link dropdown-toggle text-dark" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Equipment </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="viewavailableequipments">View
							All Equipments</a><a class="dropdown-item"
							href="viewmybookedEquipments?userId=<%=userId%>&role=<%=userType%>">My
							Booked Equipments</a>
					</div></li>

				<li class="nav-item dropdown active text-dark"><a
					class="nav-link dropdown-toggle text-dark" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Event </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="addEvent">Add Event</a><a
							class="dropdown-item"
							href="viewmyhostedevents?hostId=<%=userId%>&role=<%=userType%>">My
							Hosted Events</a><a class="dropdown-item" href="viewallevents">All
							Events</a><a class="dropdown-item"
							href="viewmyappliedevents?userId=<%=userId%>&role=<%=userType%>">Applied
							Events</a>
					</div></li>
				<%
				}
				%>

				<li class="nav-item active text-color" data-toggle="modal"
					data-target=".logout-modal"><a class="nav-link" href="#"><b
						class="text-color">Logout</b></a></li>


			</ul>
			<%
			}

			else {
			%>
			<ul class="navbar-nav ml-auto text-color">

				<li class="nav-item active text-color"><a class="nav-link"
					href="studentregister"><b class="text-color">Register</b></a></li>

				<li class="nav-item text-color active"><a class="nav-link"
					href="studentlogin"><b class="text-color">Login</b></a></li>

				<li class="nav-item active text-color"><a class="nav-link"
					href="staffregister"><b class="text-color">Staff Register</b></a></li>

				<li class="nav-item text-color active"><a class="nav-link"
					href="stafflogin"><b class="text-color">Staff Login</b></a></li>
			</ul>

			<%
			}
			%>

		</div>
	</div>
</nav>

<!-- Logout modal -->

<div class="modal fade logout-modal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title" id="exampleModalLongTitle">Log Out</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<h5>Do you want to logout?</h5>

				<div class="text-center">
					<a href="logout"><button type="button"
							class="btn custom-bg text-white">Yes</button></a>
					<button type="button" class="btn btn-secondary ml-5"
						data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- *********** -->

<!-- About us modal -->

<div class="modal fade aboutusmodal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title text-color" id="exampleModalLongTitle">About
					Us</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<p style="font-size: 20px;">
						<b> An e-commerce website, by definition, is a website that
							allows you to buy and sell tangible goods, digital products or
							services online. Trade, be it barter exchange or buying and
							selling of goods and services has been prevalent for centuries.
							No one can be self-sufficient. And this brings out the need for
							demand and supply of goods and services.<br> <br>
							Transactions have been going on all over the world for centuries,
							locally, and across locations. Keeping the same concept in mind,
							now think electronic. However, also bear in mind that with the
							whole world going online, data privacy laws have become
							increasingly stringent. And before you begin, an eCommerce
							venture you should be aware of all the legal policies required
							for your eCommerce website.
						</b>
					</p>
				</div>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<button type="button" class="btn custom-bg text-color"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ********** -->

<!-- Contact us modal -->

<div class="modal fade contactusmodal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white text-center">
				<h5 class="modal-title text-color" id="exampleModalLongTitle">Contact
					Us</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container text-center">
					<p style="font-size: 23px;">
						<b> <img src="resources/images/phonee.png"
							style="width: 27px;" alt="img">+91 XXXXXXXXX / +91 XXXXXXXX<br>
							<img src="resources/images/emaill.png" style="width: 29px;"
							alt="img">xxxxxxx@gmail.com
						</b>
					</p>
				</div>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<button type="button" class="btn custom-bg text-color"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ********** -->
