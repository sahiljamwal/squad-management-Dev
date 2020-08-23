<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">

<head>
<style type="text/css" media="all">
p {
	margin-top: 300px;
}
</style>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="SemiColonWeb" />

<!-- Stylesheets -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="css/dark.css" type="text/css" />
<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Document Title -->
<title>View Panel</title>

</head>

<body class="stretched">

	<!-- Document Wrapper -->
	<div id="wrapper" class="clearfix">

		<!-- Header -->
		<jsp:include page="headerMain.jsp" />

		<!-- Page Title -->
		<section id="page-title">
			<div class="container clearfix">
				<h1>Employee Main</h1>
			</div>
		</section>
		<!-- #page-title end -->

		<!-- Content -->
		<section>

			<!-- Check if logged in -->
			<jsp:include page="partials/checkIfLoggedInUser.jsp" />

			<div class="container clearfix pb-5">
				<div class="pb-5">
					<div class="line"></div>

					<%
						HttpSession s1 = request.getSession(false);
					%>
					<center>
						<div>
							<h1>
								Welcome
								<%=session.getAttribute("fname")%></h1>
						</div>
						<a href="logout"
							class="button button-border button-rounded button-fill fill-from-bottom button-black"><span><i
								class="fas fa-sign-out-alt"></i> SignOut</span></a>

						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Fields</th>
									<th>Entries</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><code>Employee ID</code></td>
									<td><%=session.getAttribute("eid")%></td>
								</tr>

								<tr>
									<td><code>Email</code></td>
									<td><%=session.getAttribute("email")%></td>
								</tr>

								<tr>
									<td><code>Name</code></td>
									<td><%=session.getAttribute("fname") + " " + session.getAttribute("lname")%></td>
								</tr>


								<tr>
									<td><code>Role</code></td>
									<td><%=session.getAttribute("role")%></td>
								</tr>

								<tr>
									<td><code>Phone No:</code></td>
									<td><%=session.getAttribute("Phone_No")%></td>
								</tr>

								<tr>
									<td><code>Date Of Joining</code></td>
									<td><%=session.getAttribute("DOJ")%></td>
								</tr>

								<tr>
									<td><code>Designation</code></td>
									<td><%=session.getAttribute("Designation")%></td>
								</tr>

								<%
									if (s1.getAttribute("role").equals("TEACHING")) {
								%>

								<tr>
									<td><code>
											No. of CasualLeave(<%=session.getAttribute("Total_CL")%>)
										</code></td>
									<td><%=session.getAttribute("casualLeave")%></td>
								</tr>

								<tr>
									<td><code>
											No. of SpecialCasualLeave(<%=session.getAttribute("Total_SCL")%>)
										</code></td>
									<td><%=session.getAttribute("specialCasualLeave")%></td>
								</tr>

								<tr>
									<td><code>
											No. of MedicalLeave(<%=session.getAttribute("Total_ML")%>)
										</code></td>
									<td><%=session.getAttribute("medicalLeave")%></td>
								</tr>

								<tr>
									<td><code>
											No. of OnDutyLeave(<%=session.getAttribute("Total_ODL")%>)
										</code></td>
									<td><%=session.getAttribute("OnDutyLeave")%></td>
								</tr>

								<tr>
									<td><code>Consumed Leaves Details:</code></td>
									<td><a href="viewDetailsSearch.jsp">Link</a></td>
								</tr>

								<tr>
									<td><code>Branch</code></td>
									<td><%=session.getAttribute("branch")%></td>
								</tr>

								<%
									} else {
								%>
								<tr>
									<td><code>
											No. of CasualLeave(<%=session.getAttribute("Total_CL")%>)
										</code></td>
									<td><%=session.getAttribute("casualLeave")%></td>
								</tr>

								<tr>
									<td><code>
											No. of MedicalLeave(<%=session.getAttribute("Total_ML")%>)
										</code></td>
									<td><%=session.getAttribute("medicalLeave")%></td>
								</tr>

								<tr>
									<td><code>
											No. of EL(<%=session.getAttribute("Total_EL")%>)
										</code></td>
									<td><%=session.getAttribute("EL")%></td>
								</tr>

								<tr>
									<td><code>Consumed Leaves Details:</code></td>
									<td><a href="viewDetailsSearch.jsp">Link</a></td>
								</tr>

								<%
									}
								%>
							</tbody>
						</table>
					</center>
					<div class="line"></div>
				</div>
			</div>
		</section>
		<!-- #content end -->

		<!-- Footer -->
		<jsp:include page="footer.jsp" />

	</div>
	<!-- #wrapper end -->

	<!-- Go To Top -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts -->
	<script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>

	<!-- Footer Scripts -->
	<script src="js/functions.js"></script>

</body>

</html>