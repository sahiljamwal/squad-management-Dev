<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

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
            <div class="line"></div>
            <center>
              <form action="View_User" method="post">
                <input
                  class="form-control mr-sm-0 bg-light navbar-primary"
                  type="number"
                  placeholder="Search"
                  aria-label="Search"
                  name="Eid"
                  required
                /><br />
                <button
                  class="btn btn-outline-success my-2 my-sm-0"
                  type="submit"
                >
                  Search
                </button>
              </form>

              <% HttpSession s1=request.getSession(false); %>

              <table class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Fields</th>
                    <th>Entries</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                    <td><code>Employee ID</code></td>
                    <td><%=s1.getAttribute("eid") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>First Name</code>
                    </td>
                    <td><%=s1.getAttribute("fname") %></td>
                  </tr>
                  <tr>
                    <td>
                      <code>Last Name</code>
                    </td>
                    <td><%=s1.getAttribute("lname") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>Email</code>
                    </td>
                    <td><%=s1.getAttribute("email") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>Role</code>
                    </td>
                    <td><%=s1.getAttribute("role") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>Date Of Joining</code>
                    </td>
                    <td><%=s1.getAttribute("DOJ") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>No. of CasualLeave Left</code>
                    </td>
                    <td><%=s1.getAttribute("casualLeave") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>No. of MedicalLeave Left</code>
                    </td>
                    <td><%=s1.getAttribute("medicalLeave") %></td>
                  </tr>
                  <% if(s1.getAttribute("role").equals("TEACHING")) {%>

                  <tr>
                    <td>
                      <code>No. of SpecialCasualLeave Left</code>
                    </td>
                    <td><%=s1.getAttribute("specialCasualLeave") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>No. of OnDuty Leave Left</code>
                    </td>
                    <td><%=s1.getAttribute("onDutyLeave") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>Branch</code>
                    </td>
                    <td><%=s1.getAttribute("branch") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>Designation</code>
                    </td>
                    <td><%=s1.getAttribute("Designation") %></td>
                  </tr>
                  <% } else {%>
                  <tr>
                    <td>
                      <code>No. of EL Left</code>
                    </td>
                    <td><%=s1.getAttribute("EL") %></td>
                  </tr>

                  <tr>
                    <td>
                      <code>Designation</code>
                    </td>
                    <td><%=s1.getAttribute("Designation") %></td>
                  </tr>

                  <% }%>
                </tbody>
              </table>
            </center>
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
