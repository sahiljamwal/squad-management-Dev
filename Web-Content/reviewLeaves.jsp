<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
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
	crossorigin="anonymous" />

<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Document Title -->
<title>Review Leaves</title>
</head>

<body class="stretched">
	<!-- Document Wrapper -->
	<div id="wrapper" class="clearfix">
		<!-- Header -->
		<jsp:include page="headerMain.jsp" />

		<!-- Page Title -->
		<section id="page-title">
			<div class="container clearfix">
				<h1>Review Employee Leaves</h1>
			</div>
		</section>
		<!-- #page-title end -->

		<!-- Content -->
		<section id="content" style="min-height: 50vh">
			<!-- Check if logged in -->
			<jsp:include page="partials/checkIfLoggedInSuperAdmin.jsp" />
			
			<div class="line"></div>
			<div class="container clearfix">
				<center>
					<form action="ViewReview" method="post">
						<span style="color: red;"><%=(request.getAttribute("errorMessageNoData") == null) ? ""
					: request.getAttribute("errorMessageNoData")%></span> <label
							for="register-form-phone">Start Date:</label>
						<div class="row">
							<div class="col" style="padding-left: 25%; padding-right: 25%;">
								<input type="date" id="register-form-phone" name="currentDate"
									class="form-control" required />
							</div>
						</div>

						<br />
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
							Fetch Leaves</button>
					</form>
				</center>
			</div>
			<div class="line"></div>
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
