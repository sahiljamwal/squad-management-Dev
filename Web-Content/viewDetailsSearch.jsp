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
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
    />

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Document Title -->
    <title>View Details Panel</title>
  </head>

  <body class="stretched">
    <!-- Document Wrapper -->
    <div id="wrapper" class="clearfix">
      <!-- Header -->
      <jsp:include page="headerMain.jsp" />

      <!-- Page Title -->
      <section id="page-title">
        <div class="container clearfix">
          <h1>View Your Leave Details here</h1>
        </div>
      </section>
      <!-- #page-title end -->

      <!-- Content -->
      <section>
        <!-- Check if logged in -->
        <jsp:include page="partials/checkIfLoggedInUser.jsp" />

        <div class="content-wrap">
          <div class="container clearfix">
            <div class="clear"></div>
            <div class="line"></div>

            <form
              id="register-form"
              name="register-form"
              class="nobottommargin"
              action="View_Leave_Details"
              method="post"
            >
              <div class="row">
                <div class="col-md-6">
                  <label for="register-form-phone">Start Date:</label>
                  <input
                    type="date"
                    id="register-form-phone"
                    name="StartDate"
                    class="form-control"
                  />
                </div>

                <div class="col-md-6">
                  <label for="register-form-phone">End Date:</label>
                  <input
                    type="date"
                    id="register-form-phone"
                    name="EndDate"
                    class="form-control"
                  />
                </div>
              </div>

              <div class="col_full nobottommargin center">
                <button
                  type="submit"
                  form="register-form"
                  class="button button-border button-rounded button-fill fill-from-bottom button-black"
                >
                  <i class="fas fa-search"></i><span>Search</span>
                </button>
              </div>
            </form>
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
