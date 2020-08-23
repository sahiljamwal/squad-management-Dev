<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<!-- Stylesheets -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous" />
	
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="css/dark.css" type="text/css" />
<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />


<link
	href="https://fonts.googleapis.com/css2?family=Kalam:wght@300;400;700&display=swap"
	rel="stylesheet">

<style>
#main-content {
	background-color: #000000;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1600 800'%3E%3Cg %3E%3Cpolygon fill='%230b1222' points='1600 160 0 460 0 350 1600 50'/%3E%3Cpolygon fill='%23172444' points='1600 260 0 560 0 450 1600 150'/%3E%3Cpolygon fill='%23223666' points='1600 360 0 660 0 550 1600 250'/%3E%3Cpolygon fill='%232e4888' points='1600 460 0 760 0 650 1600 350'/%3E%3Cpolygon fill='%23395aaa' points='1600 800 0 800 0 750 1600 450'/%3E%3C/g%3E%3C/svg%3E");
	background-attachment: fixed;
	background-size: cover;
}

.container-body {
	height: 90vh;
	width: 100%;
}


#logo {
	width: 140px;
}
</style>

<script	src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
<script src="js/typeit.js" defer></script>
<!-- Document Title -->
<title>HomePage</title>
</head>

<body class="stretched clearfix">
	<!-- Header -->
	<jsp:include page="headerIndex.jsp" />


	<!-- Content -->
	<section id="main-content">

		<div class="container-body">
			<p id="myElement"
				style="color: white; text-align: center !important; padding-top: 200px; font-family: Kalam; font-size: 30px;"></p>
		</div>

	</section>
	<!-- #content end -->

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	<!-- Go To Top -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts -->
	<script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>

	<!-- Footer Scripts -->
	<script src="js/functions.js"></script>

	<script>
		$(function() {
			$("#side-navigation").tabs({
				show : {
					effect : "fade",
					duration : 400
				}
			});
		});
	</script>
</body>
</html>
