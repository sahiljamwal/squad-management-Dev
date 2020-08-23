<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="SemiColonWeb" />

    <!-- StyleSheets -->
    <link
      href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i"
      rel="stylesheet"
      type="text/css"
    />
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="style.css" type="text/css" />
    <link rel="stylesheet" href="css/dark.css" type="text/css" />
    <link rel="stylesheet" href="css/animate.css" type="text/css" />
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap File Upload CSS -->
    <link
      rel="stylesheet"
      href="css/components/bs-filestyle.css"
      type="text/css"
    />

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1"
    />

    <!-- Document Title -->
    <title>About Us</title>
  </head>

  <body class="stretched">
    <!-- Document Wrapper -->
    <div id="wrapper" class="clearfix">
      <!-- Header -->
      <jsp:include page="headerMain.jsp" />

      <!-- Page Title -->
      <section id="page-title "  >
        <div class="container clearfix center" >
          <h1>About Us</h1>
        </div>
      </section>
      <!-- #page-title end -->

      <!-- Content -->
      <section id="content">
        <div class="content-wrap">
          <div class="container clearfix">
            <div
              class="title-content clearfix center"
              style="max-width: 1200px;"
            >
              <div class="row clearfix">
                <div class="col-md-2 bottommargin"></div>

                <div class="col-md-4 bottommargin">
                  <div class="team team-list clearfix">
                    <div class="team-image">
                      <img
                        src="images/avatar_girl_coder.png"
                        alt="Josh Clark"
                      />
                       <div class="team-title">
                        <h4>Anmol Gupta</h4>
                        <span>Founder, Developer</span>
                         <p><a href="https://github.com/Anmolag111" target="_blank"><i class="fa fa-github-square mr-1"></i></a><a href="https://www.linkedin.com/in/anmol-gupta-5b9396179/" target="_blank"><i class="fa fa-linkedin-square"></i></a></p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4 bottommargin">
                  <div class="team team-list clearfix">
                    <div class="team-image">
                      <img
                        src="images/avatar_boy_coder.png"
                        alt="Josh Clark"
                      />
                       <div class="team-title">
                        <h4>Sahil Jamwal</h4>
                        <span>Founder, Developer</span>
                         <p><a href="https://github.com/sahiljamwal" target="_blank"><i class="fa fa-github-square mr-1"></i></a><a href="https://www.linkedin.com/in/sj78625/" target="_blank"><i class="fa fa-linkedin-square"></i></a></p>
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
    <!-- Bootstrap File Upload Plugin -->
    <script src="js/components/bs-filestyle.js"></script>
  </body>
</html>
