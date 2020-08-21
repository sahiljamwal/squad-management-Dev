<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <!-- Stylesheets -->
    <link
      href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i"
      rel="stylesheet"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="style.css" type="text/css" />
    <link rel="stylesheet" href="css/dark.css" type="text/css" />
    <link rel="stylesheet" href="css/font-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/animate.css" type="text/css" />
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="custom-css/style.css" />
    <!-- Document Title -->
    <title>HomePage</title>
  </head>

  <body class="stretched clearfix">
    <!-- Document Wrapper -->
    <!-- <div id="wrapper" class="clearfix"> -->
    <!-- Header -->
    <jsp:include page="headerIndex.jsp" />


    <!-- Content -->
    <section
      id="content"
      data-height-xl="571"
      data-height-lg="571"
      data-height-md="571"
      data-height-sm="571"
      data-height-xs="571"
    ></section>
    <!-- #content end -->

    <!-- Footer -->
    <jsp:include page="footer.jsp" />
    <!-- </div> -->
    <!-- #wrapper end -->

    <!-- Go To Top -->
    <div id="gotoTop" class="icon-angle-up"></div>

    <!-- External JavaScripts -->
    <script src="js/jquery.js"></script>
    <script src="js/plugins.js"></script>

    <!-- Footer Scripts -->
    <script src="js/functions.js"></script>

    <script>
      $(function () {
        $("#side-navigation").tabs({ show: { effect: "fade", duration: 400 } });
      });
    </script>
  </body>
</html>
