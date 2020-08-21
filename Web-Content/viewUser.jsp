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
      rel="stylesheet"
      type="text/css"
    />
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="style.css" type="text/css" />
    <link rel="stylesheet" href="css/dark.css" type="text/css" />
    <link rel="stylesheet" href="css/font-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/animate.css" type="text/css" />
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

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
          <h1>View Your Employees</h1>
        </div>
      </section>
      <!-- #page-title end -->

      <!-- Content -->
      <section>
        <!-- Check if logged in -->
        <jsp:include page="partials/checkIfLoggedInAdmin.jsp" />

        <div class="content-wrap">
          <div class="container clearfix">
            <div class="clear"></div>
            <div class="line"></div>

            <form action="View_User" method="post">
              <span style="color: red;"
                ><%=(request.getAttribute("errormessage") == null) ? "" :
                request.getAttribute("errormessage")%></span
              >

              <label for="inputform" style="padding-left: 26%;">Eid:</label>
              <div class="col-md-12">
                <div
                  class="col-md-12"
                  style="padding-left: 25%; padding-right: 25%;"
                >
                  <input
                    id="inputform"
                    class="form-control mr-sm-0 bg-light navbar-primary"
                    type="number"
                    aria-label="Search"
                    name="Eid"
                    placeholder="Enter Eid To Continue"
                    required
                  />
                </div>
              </div>
              <br />

              <div class="col-md-12 center">
                <button
                  class="btn btn-outline-success my-2 my-sm-0"
                  type="submit"
                >
                  Search
                </button>
              </div>
            </form>

            <div class="clear"></div>
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
