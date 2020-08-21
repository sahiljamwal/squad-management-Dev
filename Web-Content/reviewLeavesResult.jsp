<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.sql.ResultSet"%>

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
    <title>Review Leaves</title>
  </head>

  <body class="stretched">
    <!-- Document Wrapper -->
    <div id="wrapper" class="clearfix">
      <!-- Header -->
      <jsp:include page="headerMain.jsp" />

      <!-- Page Title -->
      <section id="page-title">
        <div class="container clearfix">
          <h1>Review Employee Leaves</h1>
        </div>
      </section>
      <!-- #page-title end -->

      <!-- Content -->
      <section id="content">
        <!-- Check if logged in -->
        <jsp:include page="partials/checkIfLoggedInSuperAdmin.jsp" />

        <% ResultSet rs=(ResultSet)session.getAttribute("ReviewResultSet"); %>

        <div class="container clearfix">
          <div class="clear"></div>
          <div class="line"></div>
          <div class="col_full center">
            <a href="reviewLeaves.jsp"
              ><button
                class="button button-border button-rounded button-fill fill-from-bottom button-black"
              >
                <i class="fas fa-user-check"></i
                ><span> Click to Approve for Another Date</span>
              </button></a
            >
            <% if(rs.next()==true){ rs.previous(); %><a href="ApproveAllLeaves"
              ><button
                class="button button-border button-rounded button-fill fill-from-bottom button-black"
              >
                <i class="fas fa-check-circle"></i
                ><span> Click to Approve All Leaves</span>
              </button></a
            ><% }%>
          </div>
        </div>

        <div class="container clearfix">
          &nbsp; &nbsp; <% if(rs.next()==true){ rs.previous(); %>
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>Eid</th>
                <th>Type Of Leave</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>No Of Days</th>
                <th>Reason</th>
                <th>Reject Approval</th>
              </tr>
            </thead>

            <% int count=1; %> <% while(rs.next()){%>
            <tbody>
              <form action="DeleteReview" method="post">
                <tr>
                  <td>
                    <code
                      ><strong
                        ><% out.println(rs.getString("Eid")); %></strong
                      ></code
                    ><input type="hidden" name="Eid<%= count %>" value="<%=
                    rs.getString("Eid")%>">
                  </td>
                  <td>
                    <% out.println(rs.getString("Type_Of_Leave")); %><input
                    type="hidden" name="Type_Of_Leave<%= count %>" value="<%=
                    rs.getString("Type_Of_Leave")%>">
                  </td>
                  <td>
                    <% out.println(rs.getString("Start_Date")); %><input
                    type="hidden" name="Start_Date<%= count %>" value="<%=
                    rs.getString("Start_Date")%>">
                  </td>
                  <td>
                    <% out.println(rs.getString("End_Date")); %><input
                    type="hidden" name="End_Date<%= count %>" value="<%=
                    rs.getString("End_Date")%>">
                  </td>
                  <td><% out.println(rs.getString("Begin_Time"));%></td>
                  <td><% out.println(rs.getString("End_Time"));%></td>
                  <td><% out.println(rs.getFloat("No_Of_Days")); %></td>
                  <td><% out.println(rs.getString("Remarks")); %></td>
                  <td>
                    <button
                      class="button button-border button-rounded button-fill fill-from-bottom button-black"
                      value="<%= count%>"
                      name="counterValue"
                    >
                      <i class="fas fa-user-minus"></i
                      ><span> Click to Remove this Approval</span>
                    </button>
                  </td>
                  <% count++; %>
                </tr>
              </form>
            </tbody>

            <% } %>
          </table>
          &nbsp; &nbsp; <% }else{%>
          <div class="divcenter border-color" data-animate="rubberBand">
            <center>
              <h1><span>No Leaves To Approve.</span></h1>
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
