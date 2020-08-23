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
    <title>Login</title>
  </head>

  <body class="stretched" >
    <!-- Document Wrapper -->
    <div id="wrapper" class="clearfix">
      <!-- Header -->
      <jsp:include page="headerMain.jsp" />

      <!-- Content -->
      <section id="content">
        <div class="content-wrap nopadding" >
          <div
            class="section nopadding nomargin"
            style="
              width: 100%;
              height: 100%;
              position: absolute;
              left: 0;
              top: 0;
              background: url('images/login.png') center center no-repeat;
              background-size: cover;
            "
          ></div>

          <div class="section nobg full-screen nopadding nomargin">
            <div class="container-fluid vertical-middle divcenter clearfix">
              <div
                class="card divcenter noradius noborder"
                style="
                  max-width: 400px;
                  background-color: rgba(255, 255, 255, 0.93);
                "
              >
                <div class="card-body" style="padding: 40px;">
                  <form
                    id="login-form"
                    name="login-form"
                    class="nobottommargin"
                    action="login"
                    method="post"
                  >
                    <h3>Login to your Account</h3>

                    <div class="col_full">
                      <label for="login-form-username">Username/Eid:</label>
                      <input
                        type="number"
                        id="login-form-username"
                        name="eid"
                        value=""
                        class="form-control not-dark"
                        required
                      />
                    </div>

                    <div class="col_full">
                      <label for="login-form-password">Password:</label>
                      <input
                        type="password"
                        id="login-form-password"
                        name="password"
                        value=""
                        class="form-control not-dark"
                        required
                      />
                    </div>

                    <span style="color: red;"
                      ><%=(request.getAttribute("errormessage") == null) ? "" :
                      request.getAttribute("errormessage")%></span
                    >
                    <span style="color: red;"
                      ><%=(request.getAttribute("logoutmessage") == null) ? "" :
                      request.getAttribute("logoutmessage")%></span
                    >

                    <div class="col_full nobottommargin">
                      <button
                        type="submit"
                        form="login-form"
                        class="button button-3d button-black nomargin"
                        id="login-form-submit"
                        name="login-form-submit"
                        value="login"
                      >
                        Login
                      </button>
                      <a href="forgetPass.jsp" class="fright"
                        >Forgot Password?</a
                      >
                    </div>
                  </form>
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
