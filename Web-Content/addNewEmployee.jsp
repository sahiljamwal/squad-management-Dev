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
    <title>Add New Employee</title>
  </head>

  <body class="stretched">
    <!-- Document Wrapper -->
    <div id="wrapper" class="clearfix">
      <!-- Header -->
      <jsp:include page="headerMain.jsp" />

      <!-- Page Title -->
      <section id="page-title">
        <div class="container clearfix">
          <h1>Add New Employee</h1>
        </div>
      </section>
      <!-- #page-title end -->

      <!-- Content -->
      <section id="content">
        <!-- Check if logged in -->
        <jsp:include page="partials/checkIfLoggedInAdmin.jsp" />
        
        <div class="content-wrap">
          <div class="container clearfix">
            <div
              class="tabs divcenter nobottommargin clearfix"
              id="tab-login-register"
              style="max-width: 500px;"
            >
              <ul class="tab-nav tab-nav2 center clearfix"></ul>

              <div class="tab-container">
                <div class="tab-content clearfix" id="tab-login">
                  <div class="card nobottommargin"></div>
                </div>

                <div class="tab-content clearfix" id="tab-register">
                  <div class="card nobottommargin">
                    <div class="card-body" style="padding: 40px;">
                      <h3>Add New Employee</h3>

                      <form
                        id="register-form"
                        name="register-form"
                        class="nobottommargin"
                        action="Add_new_Employee"
                        method="post"
                      >
                        <span style="color: red;"
                          ><%=(request.getAttribute("errormessage") == null) ?
                          "" : request.getAttribute("errormessage")%></span
                        >
                        <span style="color: red;"
                          ><%=(request.getAttribute("successmessage") == null) ?
                          "" : request.getAttribute("successmessage")%></span
                        >

                        <div class="col_full">
                          <label for="register-form-name">First Name:</label>
                          <input
                            type="text"
                            id="register-form-name"
                            name="Fname"
                            value=""
                            class="form-control"
                          />
                        </div>

                        <div class="col_full">
                          <label for="register-form-name">Last Name:</label>
                          <input
                            type="text"
                            id="register-form-name"
                            name="Lname"
                            value=""
                            class="form-control"
                          />
                        </div>

                        <div class="col_full">
                          <label for="register-form-email">EmployeeId:</label>
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
                          <label for="register-form-email"
                            >Email Address:</label
                          >
                          <input
                            type="Email"
                            id="register-form-email"
                            name="Email"
                            value=""
                            class="form-control"
                            required
                          />
                        </div>

                        <div class="col_full">
                          <label for="register-form-password"
                            >Choose Password:</label
                          >
                          <input
                            type="password"
                            id="register-form-password"
                            name="Password"
                            value=""
                            class="form-control"
                            required
                          />
                        </div>

                        <div class="col_full">
                          <label for="register-form-phone">Phone Number:</label>
                          <input
                            type="Phone"
                            id="register-form-phone"
                            name="Phone_no"
                            value=""
                            class="form-control"
                          />
                        </div>

                        <div class="col_full">
                          <label for="register-form-phone"
                            >Date Of Joining:</label
                          >
                          <input
                            type="date"
                            id="register-form-phone"
                            name="DOJ"
                            value=""
                            class="form-control"
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
                          <div class="col_full">
                            <label for="register-form-repassword"
                              >Designation:</label
                            >
                            <select
                              class="form-control"
                              id="exampleFormControlSelect1"
                              name="DesignationNonTeaching"
                            >
                              <option>Account Officer</option>
                              <option>Admin Officer</option>
                              <option>Librarian</option>
                              <option>Assistant Librarian</option>
                              <option>Professional Librarian</option>
                              <option>Library Assistant</option>
                              <option>General Assistant</option>
                              <option>Office Assistant</option>
                              <option>Accounts Assistant</option>
                              <option>Technical Assistant</option>
                              <option>Lab Assistant</option>
                              <option>Assistant</option>
                              <option>Receptionist</option>
                              <option>Attendant</option>
                            </select>
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone"
                              >Casual Leaves:</label
                            >
                            <input
                              type="number"
                              id="register-form-phone"
                              name="CasualLeaveNonTeaching"
                              class="form-control"
                              value="8"
                            />
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone"
                              >Medical Leaves:</label
                            >
                            <input
                              type="number"
                              id="register-form-phone"
                              name="MedicalLeavesNonTeaching"
                              value="10"
                              class="form-control"
                            />
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone">EL Leaves:</label>
                            <input
                              type="number"
                              id="register-form-phone"
                              name="ElLeavesNonTeaching"
                              value="15"
                              class="form-control"
                            />
                          </div>
                        </div>

                        <div id="showTEACHING" class="Roles">
                          <div class="col_full">
                            <label for="register-form-repassword"
                              >Designation:</label
                            >
                            <select
                              class="form-control"
                              id="exampleFormControlSelect1"
                              name="DesignationTeaching"
                            >
                              <option>HOD</option>
                              <option>Assistant Professor</option>
                              <option>Associate Professor</option>
                              <option>Reader</option>
                              <option>Professor</option>
                            </select>
                          </div>

                          <div class="col_full">
                            <label for="register-form-repassword"
                              >Branch:</label
                            >
                            <select
                              class="form-control"
                              id="exampleFormControlSelect1"
                              name="BranchTeaching"
                            >
                              <option>CSE-M</option>
                              <option>CSE-E</option>
                              <option>IT-M</option>
                              <option>IT-E</option>
                              <option>ECE-M</option>
                              <option>ECE-E</option>
                              <option>EEE</option>
                            </select>
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone"
                              >Casual Leaves:</label
                            >
                            <input
                              type="number"
                              id="register-form-phone"
                              name="CasualLeaveTeaching"
                              class="form-control"
                              value="8"
                            />
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone"
                              >Medical Leaves:</label
                            >
                            <input
                              type="number"
                              id="register-form-phone"
                              name="MedicalLeavesTeaching"
                              value="10"
                              class="form-control"
                            />
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone"
                              >Special Causual Leaves:</label
                            >
                            <input
                              type="number"
                              id="register-form-phone"
                              name="SpecialCasualLeaveTeaching"
                              value="8"
                              class="form-control"
                            />
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone"
                              >On Duty Leave:</label
                            >
                            <input
                              type="number"
                              id="register-form-phone"
                              name="OnDutyLeaveTeaching"
                              value="4"
                              class="form-control"
                            />
                          </div>
                        </div>

                        <div id="showNON-TEACHING" class="Roles">
                          <div class="col_full">
                            <label for="register-form-repassword"
                              >Designation:</label
                            >
                            <select
                              class="form-control"
                              id="exampleFormControlSelect1"
                              name="DesignationNonTeaching"
                            >
                              <option>Account Officer</option>
                              <option>Admin Officer</option>
                              <option>Librarian</option>
                              <option>Assistant Librarian</option>
                              <option>Professional Librarian</option>
                              <option>Library Assistant</option>
                              <option>General Assistant</option>
                              <option>Office Assistant</option>
                              <option>Accounts Assistant</option>
                              <option>Technical Assistant</option>
                              <option>Lab Assistant</option>
                              <option>Assistant</option>
                              <option>Receptionist</option>
                              <option>Attendant</option>
                            </select>
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone"
                              >Casual Leaves:</label
                            >
                            <input
                              type="number"
                              id="register-form-phone"
                              name="CasualLeaveNonTeaching"
                              class="form-control"
                              value="8"
                            />
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone"
                              >Medical Leaves:</label
                            >
                            <input
                              type="number"
                              id="register-form-phone"
                              name="MedicalLeavesNonTeaching"
                              value="10"
                              class="form-control"
                            />
                          </div>

                          <div class="col_full">
                            <label for="register-form-phone">EL Leaves:</label>
                            <input
                              type="number"
                              id="register-form-phone"
                              name="ElLeavesNonTeaching"
                              value="15"
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
                            <span>Add new Employee</span>
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
