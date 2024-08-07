<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Facility Reviews</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%
	List<ReviewEquipment> reviews = (List<ReviewEquipment>) request.getAttribute("reviews");
	%>
	<div class="container-fluid mt-2">

		<div class="table-responsive">
			<table class="table">
				<thead class="custom-bg text-color">
					<tr>
						<th scope="col">Reviewer</th>
						<th scope="col">Role</th>
						<th scope="col">Review</th>
						<th scope="col">Added Time</th>
					</tr>
				</thead>

				<%
				if (reviews != null) {
					for (ReviewEquipment review : reviews) {

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

</body>
</html>