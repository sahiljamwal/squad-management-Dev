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

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Document Title -->
    <title>Change Employee Settings</title>
  </head>

  <body class="stretched">
    <!-- Document Wrapper -->
    <div id="wrapper" class="clearfix">
      <!-- Header -->
      <jsp:include page="headerMain.jsp" />

      <!-- Page Title -->
      <section id="page-title">
        <div class="container clearfix">
          <h1>Change Password</h1>
        </div>
      </section>
      <!-- #page-title end -->

      <!-- Content -->
      <section id="content">
        <% HttpSession user=request.getSession(false);
        if(user.getAttribute("teaching")!=null ||
        user.getAttribute("non-teaching")!=null) { } else
        if(user.getAttribute("admin")!=null) { } else
        if(user.getAttribute("superAdmin")!=null) { } else { RequestDispatcher
        rd=request.getRequestDispatcher("/index.jsp"); rd.forward(request,
        response); } %>

        <div class="content-wrap">
          <div class="container clearfix">
            <div
              class="accordion accordion-lg divcenter nobottommargin clearfix"
              style="max-width: 550px;"
            >
              <div class="acctitle">
                <i class="acc-closed icon-lock3"></i
                ><i class="acc-open icon-unlock"></i>Change Password
              </div>
              <div class="acc_content clearfix">
                <form
                  id="User Settings form"
                  name="User Settings form"
                  class="nobottommargin"
                  action="Change_Settings"
                  method="post"
                >
                  <div class="col_full">
                    <label for="new password">Old Password</label>
                    <input
                      type="password"
                      id="new password"
                      name="Password"
                      value=""
                      class="form-control"
                    />
                  </div>

                  <div class="col_full">
                    <label for="confirm-password"> New Password</label>
                    <input
                      type="password"
                      id="confirm-password"
                      name="Newpassword"
                      value=""
                      class="form-control"
                    />
                  </div>
                  <span style="color: red;"
                    ><%=(request.getAttribute("successMessageChange") == null) ?
                    "" : request.getAttribute("successMessageChange")%></span
                  >
                  <span style="color: red;"
                    ><%=(request.getAttribute("errorMessageChange") == null) ?
                    "" : request.getAttribute("errorMessageChange")%></span
                  >

                  <div class="col_full nobottommargin">
                    <button
                      class="button button-3d button-black nomargin"
                      id="Settings-form-submit"
                      name="settings-form-submit"
                      value="updated"
                    >
                      Save
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
