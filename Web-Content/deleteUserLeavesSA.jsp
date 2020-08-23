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
            <div
              class="tabs divcenter nobottommargin clearfix"
              id="tab-login-register"
              style="max-width: 500px;"
            >
              <div class="tab-container">
                <div class="tab-content clearfix" id="tab-login">
                  <div class="card nobottommargin"></div>
                </div>
                <span style="color: red;"
                  ><%=(request.getAttribute("successMessageDeleteSA") == null) ?
                  "" : request.getAttribute("successMessageDeleteSA")%></span
                >
                <span style="color: red;"
                  ><%=(request.getAttribute("errorMessageDeleteSA") == null) ?
                  "" : request.getAttribute("errorMessageDeleteSA")%></span
                >

                <div class="tab-content clearfix" id="tab-register">
                  <div class="card nobottommargin">
                    <div class="card-body" style="padding: 40px;">
                      <h3>Delete Employee Record</h3>

                      <form
                        id="register-form"
                        name="register-form"
                        class="nobottommargin"
                        action="DeleteUserLeavesSA_Servlet"
                        method="post"
                      >
                        <div class="col_full">
                          <label for="register-form-email">Employee Id:</label>
                          <input
                            type="text"
                            id="register-form-email"
                            name="Eid"
                            value=""
                            class="form-control"
                            required
                          />
                        </div>

                        <div class="col_full">
                          <label>Role:</label><br />
                          <label
                            >ADMIN<input
                              type="radio"
                              id="register-form-phone"
                              name="Role"
                              value="ADMIN"
                              class="form-control"
                              checked
                          /></label>
                          <label
                            >TEACHING<input
                              type="radio"
                              id="register-form-phone"
                              name="Role"
                              value="TEACHING"
                              class="form-control"
                          /></label>
                          <label
                            >NON-TEACHING<input
                              type="radio"
                              id="register-form-phone"
                              name="Role"
                              value="NON-TEACHING"
                              class="form-control"
                          /></label>
                        </div>

                        <div id="showADMIN" class="Roles">
                          <label>Type Of Leave:</label><br />
                          <label
                            >ML<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_ADMIN"
                              value="ML"
                              class="form-control"
                              checked
                          /></label>
                          <label
                            >CL<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_ADMIN"
                              value="CL"
                              class="form-control"
                          /></label>
                          <label
                            >EL<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_ADMIN"
                              value="EL"
                              class="form-control"
                          /></label>
                          <br />
                          <br />
                        </div>

                        <div id="showTEACHING" class="Roles">
                          <label>Type Of Leave:</label><br />
                          <label
                            >ML<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_TEACHING"
                              value="ML"
                              class="form-control"
                              checked
                          /></label>
                          <label
                            >CL<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_TEACHING"
                              value="CL"
                              class="form-control"
                          /></label>
                          <label
                            >SCL<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_TEACHING"
                              value="SCL"
                              class="form-control"
                          /></label>
                          <label
                            >OD<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_TEACHING"
                              value="OD"
                              class="form-control"
                          /></label>
                          <br />
                          <br />
                        </div>

                        <div id="showNON-TEACHING" class="Roles">
                          <label>Type Of Leave:</label><br />
                          <label
                            >ML<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_NON-TEACHING"
                              value="ML"
                              class="form-control"
                              checked
                          /></label>
                          <label
                            >CL<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_NON-TEACHING"
                              value="CL"
                              class="form-control"
                          /></label>
                          <label
                            >EL<input
                              type="radio"
                              id="register-form-phone"
                              name="type_of_leave_NON-TEACHING"
                              value="EL"
                              class="form-control"
                          /></label>
                          <br />
                          <br />
                        </div>

                        <div class="col_full">
                          <label>Duration:</label><br />
                          <label
                            >Full Day<input
                              type="radio"
                              id="register-form-phone"
                              name="duration"
                              value="FULL_DAY"
                              class="form-control"
                              checked
                          /></label>
                          <label
                            >Half Day<input
                              type="radio"
                              id="register-form-phone"
                              name="duration"
                              value="HALF_DAY"
                              class="form-control"
                          /></label>
                        </div>

                        <div id="seeFULL_DAY" class="Duration">
                          <div class="col_full">
                            <label for="register-form-phone">Start Date:</label>
                            <input
                              type="date"
                              id="register-form-phone"
                              name="start_date_FULLDAY"
                              class="form-control"
                            />
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone">End Date:</label>
                            <input
                              type="date"
                              id="register-form-phone"
                              name="end_date_FULLDAY"
                              class="form-control"
                            />
                          </div>
                        </div>

                        <div id="seeHALF_DAY" class="Duration">
                          <div class="col_full">
                            <label for="register-form-phone">Start Date:</label>
                            <input
                              type="date"
                              id="register-form-phone"
                              name="start_date_HALFDAY"
                              class="form-control"
                            />
                          </div>
                        </div>

                        <div class="col_full nobottommargin">
                          <button
                            type="submit"
                            form="register-form"
                            class="button button-border button-rounded button-fill fill-from-bottom button-black"
                          >
                            <span>Delete Employee Leaves</span>
                          </button>
                        </div>
                      </form>
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
