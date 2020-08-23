<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
  <head>
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
      integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
      crossorigin="anonymous"
    />

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Document Title -->
    <title>Super-Admin Panel</title>
  </head>

  <body class="stretched">
    <!-- Document Wrapper -->
    <div id="wrapper" class="clearfix">
      <!-- Header -->
      <jsp:include page="headerMain.jsp" />

      <!-- Page Title -->
      <section id="page-title">
        <div class="container clearfix">
          <h1>Super-Admin Panel</h1>
        </div>
      </section>
      <!-- #page-title end -->

      <!-- Content -->
      <section id="content">
        <!-- Check if logged in -->
        <jsp:include page="partials/checkIfLoggedInSuperAdmin.jsp" />
        
        <div class="content-wrap">
          <div class="container clearfix" >
            <div class="row">
              <div class="col-sm-12">
                <div
                  class="col_full center"
                  style="margin-top: 10%;"
                  data-animate="pulse"
                >
                  <a href="#myModal1" data-lightbox="inline"
                    ><button
                      class="button button-border button-rounded button-fill fill-from-bottom button-black"
                    >
                      <i class="fas fa-user-check"></i
                      ><span> Review User's Leave</span>
                    </button></a
                  >

                  <!-- Modal 1 -->
                  <div class="modal1 mfp-hide" id="myModal1">
                    <div
                      class="block divcenter"
                      style="background-color: #fff; max-width: 500px;"
                    >
                      <div
                        class="feature-box fbox-center fbox-effect nobottomborder nobottommargin"
                        style="padding: 40px;"
                      >
                        <div class="fbox-icon">
                          <i class="icon-screen i-alt"></i>
                        </div>
                        <h3>
                          Review User's Leave<span class="subtitle"
                            >Leaves applied by Employees can be reviewed
                            here.</span
                          >
                        </h3>
                      </div>
                      <div
                        class="section center nomargin"
                        style="padding: 30px;"
                      >
                        <a href="reviewLeaves.jsp" class="button"
                          >Click To Review User's Leaves.</a
                        >
                      </div>
                    </div>
                  </div>

                  <a href="#myModal2" data-lightbox="inline"
                    ><button
                      class="button button-border button-rounded button-fill fill-from-bottom button-black"
                    >
                      <i class="fas fa-user-minus"></i
                      ><span> Delete User's Leave</span>
                    </button></a
                  >

                  <!-- Modal 2 -->
                  <div class="modal1 mfp-hide" id="myModal2">
                    <div
                      class="block divcenter"
                      style="background-color: #fff; max-width: 500px;"
                    >
                      <div
                        class="feature-box fbox-center fbox-effect nobottomborder nobottommargin"
                        style="padding: 40px;"
                      >
                        <div class="fbox-icon">
                          <i class="icon-screen i-alt"></i>
                        </div>
                        <h3>
                          Delete User's Leave<span class="subtitle"
                            >Leaves applied by Employees can be deleted
                            here.</span
                          >
                        </h3>
                      </div>
                      <div
                        class="section center nomargin"
                        style="padding: 30px;"
                      >
                        <a href="deleteUserLeavesSA.jsp" class="button"
                          >Click To Delete User's Leaves.</a
                        >
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
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
