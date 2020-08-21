<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

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

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Document Title -->
    <title>Reset Password</title>
  </head>

  <body class="stretched">
    <!-- Document Wrapper -->
    <div id="wrapper" class="clearfix">
      <!-- Header -->
      <jsp:include page="headerMain.jsp" />

      <!-- Content -->
      <section id="content">
        <div class="content-wrap">
          <div class="container clearfix">
            <div
              class="divcenter nobottommargin clearfix"
              style="max-width: 550px;"
            >
              <div class="acc_content clearfix">
                <span style="color: red;"
                  ><%=(request.getAttribute("errorMessageReset") == null) ? "" :
                  request.getAttribute("errorMessageReset")%></span
                >
                <span style="color: red;"
                  ><%=(request.getAttribute("successMessageReset") == null) ? ""
                  : request.getAttribute("successMessageReset")%></span
                >

                <form
                  id="resetpass-form"
                  name="resetpass-form"
                  class="nobottommargin"
                  action="forget_servlet"
                  method="post"
                >
                  <div class="col_full">
                    <label for="resetpass"
                      >Enter you email-id to reset your password:</label
                    >
                    <input
                      type="email"
                      id="resetpass"
                      name="email"
                      value=""
                      class="form-control"
                      placeholder="Enter Email"
                      required
                    />
                  </div>

                  <div class="col_full nobottommargin">
                    <button
                      class="button button-3d button-black nomargin"
                      id="resetpassform-submit"
                      name="resetpassform-submit"
                      value="resetpass"
                    >
                      Submit
                    </button>
                  </div>
                </form>
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
