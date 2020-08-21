<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.ResultSet"%>

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
          <h1>View Your Details Here</h1>
        </div>
      </section>
      <!-- #page-title end -->

      <!-- Content -->
      <section>
        <!-- Check if logged in -->
        <jsp:include page="partials/checkIfLoggedInUser.jsp" />

        <div class="container clearfix">
          <% HttpSession s1=request.getSession(false); ResultSet
          rs=(ResultSet)session.getAttribute("ResultSet"); %> &nbsp; &nbsp; <%
          if(rs.next()==true){ rs.previous(); %>
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>Type Of Leave</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>No Of Days</th>
                <th>Reason</th>
              </tr>
            </thead>

            <% while(rs.next()){%>
            <tbody>
              <tr>
                <td>
                  <code
                    ><strong
                      ><% out.println(rs.getString("Type_Of_Leave")); %></strong
                    ></code
                  >
                </td>
                <td><% out.println(rs.getString("Start_Date")); %></td>
                <td><% out.println(rs.getString("End_Date")); %></td>
                <td><% out.println(rs.getString("Begin_Time"));%></td>
                <td><% out.println(rs.getString("End_Time"));%></td>
                <td><% out.println(rs.getFloat("No_Of_Days")); %></td>
                <td><% out.println(rs.getString("Remarks")); %></td>
              </tr>
            </tbody>

            <% } %>
          </table>
          <% }else{%>
          <div class="divcenter border-color" data-animate="rubberBand">
            <center>
              <h1><span>You have not availed any Leaves yet.</span></h1>
            </center>
          </div>
          <% } %>
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
